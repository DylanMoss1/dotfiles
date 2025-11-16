if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ========== ESSENTIALS ==========

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt
    if test $status -eq 0
        set arrow_color green
    else
        set arrow_color red
    end

    set_color blue

    printf "\n"

    if set -q VIRTUAL_ENV
        printf "(%s) " (basename $VIRTUAL_ENV)
    end

    set_color cyan
    printf "%s" (prompt_pwd --dir-length 20 --full-length-dirs 20)

    set_color $arrow_color
    printf "\n❯ "

    set fish_color_command blue
end

set -x LS_COLORS "$LS_COLORS:di=34"

function c
    clear
end

function e
    exit
end

function r
    set tmp (mktemp)
    ranger --choosedir="$tmp" $argv
    if test -f "$tmp"
        set dir (cat $tmp)
        rm -f "$tmp"
        if test -d "$dir" -a "$dir" != (pwd)
            cd "$dir"
        end
    end
end

function rmt
    trash $argv
end

function fc
    nvim ~/.config/fish/config.fish
end

function fcs
    . ~/.config/fish/config.fish
end

function n
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end

function swap
    rm ~/.local/state/nvim/swap/*.swp
end

# function b
#     sudo systemctl restart bluetooth
# end

fish_add_path "~/.local/bin"

fzf_configure_bindings --directory=\cd --git_log=\cg --history=\cr --variables=\cy

set fish_greeting

# ========== GIT ==========

abbr gs "git status"

abbr -a ga --set-cursor 'git add "%"'
abbr -a gau "git add -u"

abbr -a gc --set-cursor -- 'git commit -m "%"'

abbr gp "git push -u origin HEAD"

# ========== LOAD CUSTOM CONFIG ==========  

set script_dir (status dirname)
source $script_dir/config_custom.fish
