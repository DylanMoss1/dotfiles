# Install Instructions

## Initial Setup

```bash
mkdir -p ~/.local/bin
export PATH=~/.local/bin:$PATH
```

## Install Fish

Install fish:
- With sudo: [LINK](https://fishshell.com/)
- Without sudo: [LINK](https://github.com/fish-shell/fish-shell/releases/tag/4.5.0)

## Install trash and ranger

```bash
python3 -m pip install trash-cli ranger-fm
```

## Install Rust 

```bash
curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Install NeoVim

### Latest Version

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
mkdir ~/.local/bin/nvim
mv nvim-linux-x86_64.appimage ~/.local/bin/nvim
```

### Older GLIB Version

```bash
curl -LO https://github.com/neovim/neovim-releases/releases/download/v0.11.2/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
mkdir ~/.local/bin/nvim
mv nvim-linux-x86_64.appimage ~/.local/bin/nvim
```

## Install Fish Plugins

### fzf.fish (fuzzy finder)

```bash
# Dependencies of fzf.fish
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

cargo install fd-find
cargo install --locked bat

# Install fzf.fish
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher && fisher install PatrickF1/fzf.fish"
```

## Install Stow

```bash
if ! command -v stow >/dev/null 2>&1; then
  wget http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
  tar -xvzf stow-latest.tar.gz
  cd stow-*
  ./configure --prefix $HOME/.local/bin
  make
  make install
  cd ~
  rm -rf stow-latest*
fi
```

## Install dotfiles

```bash
# Remove previous configs
rm -rf ~/.bashrc ~/.custom_bashrc ~/.config/fish ~/.config/ranger ~/.custom/wezterm ~/.custom/nvim

# Install dotfiles (run from inside dotfiles/)
for dir in */; do stow "$dir"; done
```
