echo "\nWould you like to install NeoVim to your computer ( y/n ):\n"
read -n 1 shouldInstallNeovim
if [ $shouldInstallNeovim == "y" ]; then
  echo "\nDownloading and Installing NeoVim\n"
  brew install neovim/neovim/neovim

  echo "\nDo you want to add the alias 'vim=\"nvim $*\"' to your ~/.bashrc?  ( y/n ):\n"
  read -n 1 shouldAddAlias
  if [ $shouldAddAlias == "y" ]; then
    echo "\nUpdating bash Vim alias to point to NeoVim\n"
    echo 'alias vim="nvim $*"' >> ~/.bashrc
    source ~/.bashrc
  fi
fi

echo "\nWould you like to install NeoBundle to your Vim configuration?  ( y/n ):\n"
read -n 1 shouldInstallNeobundle
if [ $shouldInstallNeobundle == "y" ]; then
  echo "\nWould you like to backup your existing vim configs before moving forward?  ( y/n ):\n"
  read -n 1 shouldBackupVim
  if [ $shouldBackupVim == "y" ]; then
    if [ -d ~/.vim ]; then
      mv ~/.vim ~/old.vim
    fi
  fi
  echo "\nDownloading and Installing NeoBundle\n"
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh >> ~/installNeobundle.sh
  sh ~/installNeobundle.sh
  rm ~/installNeobundle.sh

  cp ../.nvimrc ~/.nvimrc
  ln -s ~/.nvimrc ~/.nvim/init.vim
  nvim -c "q"

  if [ -f ~/.vimrc ]; then
    echo "\nDo you want to delete your existing .vimrc file?  ( y/n ):\n"
    read -n 1 shouldDeleteConfig
    if [ $shouldDeleteConfig == "y" ]; then
      echo "\nWould you like to create a backup of your .vimrc before deleting it? It will be saved as 'old.vimrc'  ( y/n ):\n"
      read -n 1 shouldBackupConfig
      if [ $shouldBackupConfig == "y" ]; then
          mv ~/.vimrc ~/old.vimrc
      fi
    fi
  fi
  rm ~/.nvimrc
  cp ../.vimrc ~/.nvimrc
  ln -s ../.vimrc ~/.nvim/init.vim


  echo "\nWould you like to start up vim now?  ( y/n ):"
  read -n 1 shouldStartVim
  if [ $shouldStartVim == "y" ]; then
    nvim
  else
    echo "\n\nCompleted the install script. Check out more things from TheAmazingFedex at https://github.com/theamazingfedex\n"
    read
    exit 0
  fi
fi
