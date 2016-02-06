 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 NeoBundle 'Shougo/vimproc.vim', {
 \ 'build' : {
 \     'windows' : 'tools\\update-dll-mingw',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make',
 \     'linux' : 'make',
 \     'unix' : 'gmake',
 \    }
 \ }
 " My Bundles here:
  NeoBundle 'benekastah/neomake'
  NeoBundle 'kassio/neoterm'
  NeoBundle 'simnalamburt/vim-mundo'
  NeoBundle 'tpope/vim-eunuch'
  NeoBundle 'guns/xterm-color-table.vim'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'tpope/vim-obsession'
  NeoBundle 'https://github.com/jlanzarotta/bufexplorer'
  NeoBundle 'https://github.com/tpope/vim-surround'
  NeoBundle 'https://github.com/bling/vim-airline'
  NeoBundle 'https://github.com/scrooloose/nerdcommenter'
  NeoBundle 'https://github.com/ctrlpvim/ctrlp.vim'
  NeoBundle 'https://github.com/tpope/vim-fugitive'
  NeoBundle 'https://github.com/terryma/vim-multiple-cursors'
  NeoBundle 'https://github.com/svermeulen/vim-easyclip'
  NeoBundle 'https://github.com/easymotion/vim-easymotion'
  NeoBundle 'https://github.com/editorconfig/editorconfig-vim.git'
  NeoBundle 'https://github.com/tpope/vim-repeat'
  NeoBundle 'https://github.com/rking/ag.vim'
  NeoBundle 'altercation/vim-colors-solarized'


 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
  NeoBundleCheck

noremap ; :
