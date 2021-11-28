#!/usr/bin/bash

# COLORS
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NC=$(tput sgr0)
BOLD=$(tput bold)

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
  if ! command -v tput &>/dev/null; then
    print_missing_dep_msg "tput"
    exit 1
  fi

  msg
  echo -n "${BOLD}Detecting platform for managing any additional neovim dependencies... ${NC}"
  detect_platform
  echo -e "${GREEN}${BOLD}Done\n${NC}"
  check_system_deps

  while [ true ]; do
    read -p $'Make sure to backup your current config. Do you wish to install Ecovim now? \e[33m[y/n]\e[0m: ' yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "${BOLD}Please answer ${YELLOW}y${NC}${BOLD} or ${YELLOW}n${NC}${BOLD}.${NC}";;
    esac
  done

  install_packer
  setup

  msg "${BOLD}${GREEN}Thank you for installing my ${BLUE}Ecovim${NC}${BOLD}${GREEN} config! Please support me by giving a star :)${NC}"
  echo -e "${BOLD}${RED}Please open neovim and select ${NC}${BOLD}Install plugins${BOLD}${RED} from menu${NC}"
  echo -e "${BOLD}${GREEN}Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts].\nI recommend Fira Code for Ecovim setup.${NC}"
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
      echo -e "${BOLD}OS $OS is not currently supported.${NC}"
      exit 1
      ;;
  esac
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ]; then
    echo "${BOLD}${RED}[ERROR]: Unable to find dependency [$1]${NC}"
    echo "${BOLD}Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1${BOLD}"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "${BOLD}${RED}[ERROR]: Unable to find dependencies [%s]" "$@"
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
    msg "${BOLD}${GREEN}Packer already installed${NC}"
  else
    if ! git clone --depth 1 "https://github.com/wbthomason/packer.nvim" \
      "$PACK_DIR/packer/start/packer.nvim"; then
      msg "${BOLD}${RED}Failed to clone Packer. Installation failed.${NC}"
      exit 1
    fi
  fi
}

function setup() {
  msg "${BOLD}Installing telescope-fzf-native...${NC}"
  git clone https://github.com/nvim-telescope/telescope-fzf-native.nvim /tmp/telescope-fzf-native.nvim
  rm -rf /tmp/telescope-fzf-native.nvim/.git
  cp -r /tmp/telescope-fzf-native.nvim "$PACK_DIR/packer/start/packer.nvim"
  rm -rf /tmp/telescope-fzf-native.nvim

  [ ! -d "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim" ] && msg "${BOLD}${RED}Error while installing telescope-fzf-native... Aborting" && exit
  cd "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim"
  msg "${BOLD}Building telescope-fzf-native...${NC}"
  make
  [ ! -f "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim/build/libfzf.so" ] && msg "${BOLD}${RED}Error while building telescope-fzf-native... Aborting" && exit
  cd $CONFIG_DIR/.install

  msg "${BOLD}Installing plugins...${NC}"
  "$NVIM_DIR" --headless -u installation_config.lua \
    -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'

  msg "${BOLD}Packer setup complete!${NC}"
}

function print_logo() {
  echo -e "${BLUE}"
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
  echo -e "${NC}"
}

main
