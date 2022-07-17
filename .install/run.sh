#!/usr/bin/bash

# COLORS
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
NC=$(tput sgr0)
BOLD=$(tput bold)

# VARIABLES
declare -r GIT_BRANCH="${GIT_BRANCH:-"master"}"
declare -r GIT_REMOTE="${GIT_REMOTE:-ecosse3/nvim.git}"
declare -r NVIM_DIR="${NVIM_DIR:-"$(which nvim)"}"
declare -r INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"
declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
declare -r RUNTIME_DIR="${RUNTIME_DIR:-"$XDG_DATA_HOME/nvim"}"
declare -r CONFIG_DIR="${CONFIG_DIR:-"$XDG_CONFIG_HOME/nvim"}"
declare -r CACHE_DIR="${XDG_CACHE_HOME:-"$XDG_CACHE_HOME/nvim"}"
declare -r PACK_DIR="$RUNTIME_DIR/site/pack"

# MAIN
function main() {
  print_logo
  check_tput_install

  detect_platform
  check_system_deps
  echo -e "${BOLD}${YELLOW}Installation will override your $CONFIG_DIR directory!${NC}\n"

  while [ true ]; do
    read -p $'Do you wish to backup your current config? \e[33m[y/n]\e[0m: ' yn
    case $yn in
        [Yy]* ) backup_old_config;break;;
        [Nn]* ) break;;
        * ) echo "${BOLD}Please answer ${YELLOW}y${NC}${BOLD} or ${YELLOW}n${NC}${BOLD}.${NC}";;
    esac
  done

  while [ true ]; do
    msg
    read -p $'Do you wish to install Ecovim now? \e[33m[y/n]\e[0m: ' yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "${BOLD}Please answer ${YELLOW}y${NC}${BOLD} or ${YELLOW}n${NC}${BOLD}.${NC}";;
    esac
  done
  
  remove_current_repo
  clone_repo
  install_packer
  setup
  finish
}

function msg() {
  local text="$1"
  local flag="$2"
  local line="$3"
  local div_width="80"

  # Render line
  if [ "$line" != "0" ]; then 
    printf "%${div_width}s\n" ' ' | tr ' ' -
  fi

  # Render text
  if [ "$flag" == "1" ]; then 
    echo -e "$text"
  else
    echo -n "$text"
  fi
}

function detect_platform() {
  msg "${BOLD}Detecting platform for managing any additional neovim dependencies... ${NC}"
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
  echo -e "${GREEN}${BOLD}Done${NC}"
}

function print_missing_dep_msg() {
  if [ "$#" -eq 1 ] && [ "$1" == "neovim" ] && [ "$OS" == "Darwin" ]; then
    echo -e "${BOLD}${RED}[ERROR]: Unable to find neovim dependency${NC}"
    echo -e "${BOLD}Please install it first and re-run the installer.${NC}"
    echo -e "${BOLD}You need to install latest nightly version. Use: brew install --HEAD neovim${NC}\n"
  elif [ "$#" -eq 1 ]; then
    echo -e "${BOLD}${RED}[ERROR]: Unable to find dependency [$1]${NC}"
    echo -e "${BOLD}Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL $1${NC}\n"
  else
    local cmds
    cmds=$(for i in "$@"; do echo "$RECOMMEND_INSTALL $i"; done)
    printf "${BOLD}${RED}[ERROR]: Unable to find dependencies [%s]${NC}" "$@"
    printf "Please install any one of the dependencies and re-run the installer. Try: \n%s\n" "$cmds"
  fi
}

function check_tput_install() {
  if ! command -v tput &>/dev/null; then
    print_missing_dep_msg "tput"
    exit 1
  fi
}

function check_system_deps() {
  if ! command -v npm &>/dev/null; then
    print_missing_dep_msg "npm"
    exit 1
  fi
  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
  if ! command -v fzf &>/dev/null; then
    print_missing_dep_msg "fzf"
    exit 1
  fi
}

function backup_old_config() {
  msg "${BOLD}Backing up your current Neovim configuration...${NC}" "1"

  mkdir -p "$CONFIG_DIR" "$CONFIG_DIR.bak"
  if command -v rsync &>/dev/null; then
    rsync --archive -hh --partial --progress --cvs-exclude \
      --modify-window=1 "$CONFIG_DIR"/ "$CONFIG_DIR.bak"
  else
    OS="$(uname -s)"
    case "$OS" in
      Linux | *BSD)
        cp -r "$CONFIG_DIR/"* "$CONFIG_DIR.bak/."
        ;;
      Darwin)
        cp -R "$CONFIG_DIR/"* "$CONFIG_DIR.bak/."
        ;;
      *)
        echo "OS $OS is not currently supported."
        ;;
    esac
  fi
  echo "${BOLD}${GREEN}Backup operation complete! ${GREEN}You can find it under ${CONFIG_DIR}.bak${NC}"
}

function remove_current_repo() {
  cd $HOME
  msg "${BOLD}Removing current Neovim configuration... ${NC}"
  rm -rf "$RUNTIME_DIR"
  rm -rf "$CACHE_DIR"
  rm -rf "$CONFIG_DIR"
  echo -e "${GREEN}${BOLD}Done${NC}"
}

function clone_repo() {
  msg "${BOLD}Cloning Ecovim configuration... ${NC}" "1"
  if ! git clone --branch "$GIT_BRANCH" \
    --depth 1 "https://github.com/${GIT_REMOTE}" "$CONFIG_DIR"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
  echo -e "${GREEN}${BOLD}Done${NC}"
  msg "${BOLD}Moving to Ecovim directory... ${NC}"
  cd $CONFIG_DIR
  echo "${GREEN}${BOLD}Done${NC}"
}

function install_packer() {
  if [ -e "$PACK_DIR/packer/start/packer.nvim" ]; then
    msg "${BOLD}${GREEN}Packer already installed!${NC}"
    echo -e
  else
    if ! git clone --depth 1 "https://github.com/wbthomason/packer.nvim" \
      "$PACK_DIR/packer/start/packer.nvim"; then
      msg "${BOLD}${RED}Failed to clone Packer. Installation failed.${NC}"
      exit 1
    fi
  fi
}

function finish () {
  touch /tmp/first-ecovim-run
  msg "${BOLD}${GREEN}Thank you for installing my ${BLUE}Ecovim${NC}${BOLD}${GREEN} config! Please support me by giving a star :)${NC}" 1
  echo -e "${BOLD}${GREEN}Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts].\nI recommend Fira Code for Ecovim setup.${NC}"
}

function setup() {
  msg "${BOLD}Installing telescope-fzf-native...${NC}" 1
  git clone https://github.com/nvim-telescope/telescope-fzf-native.nvim /tmp/telescope-fzf-native.nvim
  rm -rf /tmp/telescope-fzf-native.nvim/.git
  cp -r /tmp/telescope-fzf-native.nvim "$PACK_DIR/packer/start/packer.nvim"
  rm -rf /tmp/telescope-fzf-native.nvim
  [ -d "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim" ] && msg "${BOLD}${GREEN}Done${NC}" 1 0
  [ ! -d "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim" ] && msg "${BOLD}${RED}Error while installing telescope-fzf-native... Aborting" 1 && exit

  cd "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim"
  msg "${BOLD}Building telescope-fzf-native...${NC}"
  make
  [ ! -f "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim/build/libfzf.so" ] && msg "${BOLD}${RED}Error while building telescope-fzf-native... Aborting" 1 && exit
  [ -f "$PACK_DIR/packer/start/packer.nvim/telescope-fzf-native.nvim/build/libfzf.so" ] && msg "${BOLD}${GREEN}Done${NC}" 1 0
  cd $CONFIG_DIR/.install

  msg "${BOLD}Installing plugins...${NC}" 1
  nvim -c 'autocmd User PackerComplete quitall' \
    -c 'PackerSync'
  msg "${BOLD}${GREEN}Done${NC}" 1 0

  msg "${BOLD}${GREEN}Packer setup complete!${NC}" 1
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
