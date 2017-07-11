#!/usr/bin/env bash

#### CLI Public Tool to Fully Configure Development Environment ####
install() {
  # Clean relevant file-system locations before installation of .hot
  clean_all

  # Clone remote Git repository into .hot/ as a bare repository
  git clone --bare git@github.com:Cfeusier/.hot.git $HOME/.hot

  # Checkout recently cloned local hot repository and configure to only show tracked files
  g checkout
  g config status.showUntrackedFiles no

  # Link source dotfiles to 'expected' locations on file system
  link_all
}

#### CLI Public Interface to Hot-wrapped-Git ####
g() {
  /usr/bin/git --git-dir=$HOME/.hot/ --work-tree=$HOME $@
}

#### Cleaning Functions ####
log_separator() {
  echo '----------------------------------------------------------------------'
}

remove_root() {
  log_separator
  echo 'Removing .hot/ before cloning repository...'
  rm -rf $HOME/.hot
}

remove_env() {
  log_separator
  echo 'Removing .env/...'
  rm -rf $HOME/.env
}

remove_bin() {
  log_separator
  echo 'Removing .bin/...'
  rm -rf $HOME/.bin
}

remove_bashrc() {
  log_separator
  echo 'Removing .bashrc...'
  rm $HOME/.bashrc
}

remove_bash_profile() {
  log_separator
  echo 'Removing .bash_profile...'
  rm $HOME/.bash_profile
}

remove_zshrc() {
  log_separator
  echo 'Removing .zshrc...'
  rm $HOME/.zshrc
}

remove_tmux_conf() {
  log_separator
  echo 'Removing .tmux.conf...'
  rm $HOME/.tmux.conf
}

remove_vimrc() {
  log_separator
  echo 'Removing .vimrc...'
  rm $HOME/.vimrc
}

remove_gitconfig() {
  log_separator
  echo 'Removing .gitconfig...'
  rm $HOME/.gitconfig
}

remove_gitignore() {
  log_separator
  echo 'Removing .gitignore...'
  rm $HOME/.gitignore
}

remove_readme() {
  log_separator
  echo 'Removing README...'
  rm $HOME/README.md
}

clean_all() {
  log_separator
  echo 'Cleaning file-system before installing .hot...'
  remove_root
  remove_env
  remove_bin
  remove_bashrc
  remove_bash_profile
  remove_zshrc
  remove_tmux_conf
  remove_vimrc
  remove_gitconfig
  remove_gitignore
  remove_readme
  log_separator
}

#### Linking Functions ####
link_bash() {
  if [ "$1" != true ]; then
    remove_bashrc
    remove_bash_profile
    log_separator
  fi
  echo "alias hot='/Users/clark/.bin/hot.sh'" >> .env/bash/.bashrc
  echo 'Linking .env/bash/.bashrc to ~/.bashrc...'
  ln -s .env/bash/.bashrc ~/.bashrc
  log_separator
  echo 'Linking .env/bash/.bash_profile to ~/.bash_profile...'
  ln -s .env/bash/.bash_profile ~/.bash_profile
}

link_zsh() {
  if [ "$1" != true ]; then
    remove_zshrc
    log_separator
  fi
  echo "alias hot='/Users/clark/.bin/hot.sh'" >> .env/zsh/.zshrc
  echo 'Linking .env/zsh/.zshrc to ~/.zshrc...'
  ln -s .env/zsh/.zshrc ~/.zshrc
}

link_tmux() {
  if [ "$1" != true ]; then
    remove_tmux_conf
    log_separator
  fi
  echo 'Linking .env/tmux/.tmux.conf to ~/.tmux.conf...'
  ln -s .env/tmux/.tmux.conf ~/.tmux.conf
}

link_vim() {
  if [ "$1" != true ]; then
    remove_vimrc
    log_separator
  fi
  echo 'Linking .env/vim/.vimrc to ~/.vimrc...'
  ln -s .env/vim/.vimrc ~/.vimrc
}

link_git() {
  if [ "$1" != true ]; then
    remove_gitconfig
    remove_gitignore
    log_separator
  fi
  echo 'Linking .env/git/.gitconfig to ~/.gitconfig...'
  ln -s .env/git/.gitconfig ~/.gitconfig
  log_separator
  echo 'Linking .env/git/.gitignore to ~/.gitignore...'
  ln -s .env/git/.gitignore ~/.gitignore
}

link_all() {
  # this is only used in install script
  echo '----------------------------------------------------------------------'
  echo 'Linking repository to relevant dotfiles...'
  echo '----------------------------------------------------------------------'
  link_bash true
  echo '----------------------------------------------------------------------'
  link_zsh true
  echo '----------------------------------------------------------------------'
  link_tmux true
  echo '----------------------------------------------------------------------'
  link_vim true
  echo '----------------------------------------------------------------------'
  link_git true
}

#### Read arguments
"$@"

