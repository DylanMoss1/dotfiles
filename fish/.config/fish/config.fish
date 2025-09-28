if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ========== ESSENTIALS ==========

function fish_prompt
    printf "\n%s\n> " (prompt_pwd --dir-length 20 --full-length-dirs 20)
end

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
    if count $argv >/dev/null
        nvim $argv # /apps/home/mossdyla/nvim.appimage
    else
        nvim .
    end
end

function swap
    rm ~/.local/state/nvim/swap/*.swp
end

# function b
#     sudo systemctl restart bluetooth
# end

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
