#!/usr/bin/bash

# VARIABLES
declare -r NVIM_DIR="${NVIM_DIR:-"$(which nvim)"}"
declare -r INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"
declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
declare -r RUNTIME_DIR="${RUNTIME_DIR:-"$XDG_DATA_HOME/nvim"}"
declare -r CONFIG_DIR="${CONFIG_DIR:-"$XDG_CONFIG_HOME/nvim"}"
declare -r PACK_DIR="$RUNTIME_DIR/site/pack"

# MAIN
function main() {
  print_logo

  msg
  echo -n "Detecting platform for managing any additional neovim dependencies... "
  detect_platform
  echo "Done"
  check_system_deps

  while [ true ]; do
    read -p "Make sure to backup your current config. Do you wish to install Ecovim now? [yes/no] " yn
    case $yn in
        [Yy]* ) break;;
        [Yes]* ) break;;
        [yes]* ) break;;
        [Nn]* ) exit;;
        [No]* ) exit;;
        [no]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done

  install_packer
  setup

  msg "Thank you for installing my Ecovim config! Please support me by giving a star :)"
  echo 'Please open neovim and select 'Install plugins" from menu"
  echo "Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]"
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}


function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge install -y"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "[ERROR]: Unable to find dependency [$1]"
    echo "Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "[ERROR]: Unable to find dependencies [%s]" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}


function check_system_deps() {
  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "npm"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
  if ! command -v fzf &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
}
function install_packer() {
  if [ -e "$PACK_DIR/packer/start/packer.nvim" ]; then
    msg "Packer already installed"
  else
    if ! git clone --depth 1 "https://github.com/wbthomason/packer.nvim" \
      "$PACK_DIR/packer/start/packer.nvim"; then
      msg "Failed to clone Packer. Installation failed."
      exit 1
    fi
  fi
}

function setup() {
  msg "Installing telescope-fzf-native..."
  git clone https://github.com/nvim-telescope/telescope-fzf-native.nvim /tmp/telescope-fzf-native.nvim
  rm -rf /tmp/telescope-fzf-native.nvim/.git
  cp -r /tmp/telescope-fzf-native.nvim "$PACK_DIR/packer/start/packer.nvim"
  rm -rf /tmp/telescope-fzf-native.nvim

  cd "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim"
  msg "Building telescope-fzf-native..."
  make
  cd $CONFIG_DIR/.install

  msg "Installing plugins..."
  "$NVIM_DIR" --headless -u installation_config.lua \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'

  msg "Packer setup complete!"
}

function print_logo() {
  cat <<'EOF'
       ████████                           ██            
      ░██░░░░░                           ░░             
      ░██        █████   ██████  ██    ██ ██ ██████████ 
      ░███████  ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
      ░██░░░░  ░██  ░░ ░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
      ░██      ░██   ██░██   ░██ ░░████  ░██ ░██ ░██ ░██
      ░████████░░█████ ░░██████   ░░██   ░██ ███ ░██ ░██
      ░░░░░░░░  ░░░░░   ░░░░░░     ░░    ░░ ░░░  ░░  ░░ 
EOF
}

main
