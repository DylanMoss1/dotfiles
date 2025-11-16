#!/bin/bash

PYTHON="python3"
PIP="pip3"

if [ ! -f .local/bin ]; then
  mkdir -p ~/.local/bin
fi

export PATH=~/.local/bin:$PATH

if ! command -v cmake 2>&1; then
  cd ~
  wget https://github.com/Kitware/CMake/releases/download/v4.1.2/cmake-4.1.2-linux-x86_64.sh
  chmod +x cmake-4.1.2-linux-x86_64.sh
  yes | ./cmake-4.1.2-linux-x86_64.sh
  cp -r ~/cmake-4.1.2-linux-x86_64/bin/cmake ~/.local/bin/cmake
  rm -rf ~/cmake-4.1.2*
  export PATH=~/.local/bin/cmake:$PATH
fi

if ! command -v fish 2>&1; then
  cd ~
  wget https://github.com/fish-shell/fish-shell/releases/download/4.2.1/fish-4.2.1-linux-x86_64.tar.xz
  tar -xf fish-4.2.1-linux-x86_64.tar.xz
  mv fish ~/.local/bin/fish
  rm -rf fish-4.2.1-*
fi

$PYTHON -m pip install trash-cli ranger-fm

if ! command -v cargo >/dev/null 2>&1; then
  curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if ! command nvim >/dev/null 2>&1; then
  glibc_version=$(ldd --version | head -n1 | awk '{print $NF}')

  required_version="2.28"

  if [ "$(printf '%s\n' "$required_version" "$glibc_version" | sort -V | head -n1)" != "$required_version" ]; then
    curl -LO https://github.com/neovim/neovim-releases/releases/download/v0.11.5/nvim-linux-x86_64.appimage
  else
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  fi

  chmod +x nvim-linux-x86_64.appimage
  mv nvim-linux-x86_64.appimage ~/.local/bin/nvim
fi

if ! comand -v fzf >/dev/null 2>&1; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  yes | ~/.fzf/install
fi

if ! command -v fd >/dev/null 2>&1; then
  cargo install fd-find
fi

if ! command -v bat >/dev/null 2>&1; then
  cargo install --locked bat
fi

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher && fisher install PatrickF1/fzf.fish"

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

rm -rf ~/.bashrc ~/.custom_bashrc ~/.config/fish ~/.config/ranger ~/.custom/wezterm ~/.custom/nvim

cd dotfiles

for dir in */; do stow "$dir"; done

cd ~

fish
