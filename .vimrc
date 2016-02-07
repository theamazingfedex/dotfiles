 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.nvim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.nvim/bundle/'))

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
  NeoBundle 'tmhedberg/matchit'
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'https://github.com/jlanzarotta/bufexplorer'
  NeoBundle 'https://github.com/tpope/vim-surround'
  NeoBundle 'https://github.com/bling/vim-airline'
  NeoBundle 'https://github.com/scrooloose/nerdcommenter'
  NeoBundle 'https://github.com/scrooloose/nerdtree'
  NeoBundle 'https://github.com/ctrlpvim/ctrlp.vim'
  NeoBundle 'https://github.com/tpope/vim-fugitive'
  NeoBundle 'https://github.com/terryma/vim-multiple-cursors'
  NeoBundle 'https://github.com/svermeulen/vim-easyclip'
  NeoBundle 'https://github.com/easymotion/vim-easymotion'
  NeoBundle 'https://github.com/editorconfig/editorconfig-vim.git'
  NeoBundle 'https://github.com/tpope/vim-repeat'
  NeoBundle 'https://github.com/rking/ag.vim'


 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
  NeoBundleCheck

 " Configuration
  " Begin default configuration
   syntax on
   let g:solarized_termcolors=256
   let mapleader=","
   let g:EasyMotion_leader_key=',,'
   set esckeys
   set lazyredraw
   set mouse=a
   set clipboard=unnamed
   set hlsearch
   set mat=2
   set number
   set showmatch
   set lbr
   set tw=0
   set hidden
   set ignorecase
   set nofoldenable
   set wildignore+=*/cache*/*,*/tmp/*,*/*node_modules/*,*.swp,*.zip,*.gz,*.tar,*.so,*.exe
   set statusline+=%#warningmsg#
   set statusline+=%*
   set statusline+=%{fugitive#statusline()}
   set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
   set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
   set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*
   set laststatus=2
   set cursorcolumn
   set cursorline
   set undofile
   set undodir=$HOME/.vim/tmp/undo
   set undolevels=5000
   set history=1000
   set incsearch
   set noerrorbells
   set backupdir=~/.vim/tmp/backups
   set directory=~/.vim/tmp/swaps

   call matchadd('ColorColumn', '\%81v', 100)
   ca ,, <esc>

  augroup mygroup
    au!
    au VimEnter * call SetGitDir()
    au! VimLeave,TermClose,BufHidden,BufWinLeave,BufLeave,BufFilePost,BufDelete,BufWipeout *.js lcl
    "Note: read in .spark files as html for syntax highlighting
    au BufRead,BufNewFile *.spark set filetype=html
    "Note: run eslint when opening and writing js files
    au! BufEnter *.js call EnterNeomake()
    au! BufWritePost *.js call SaveNeomake()
  augroup END
" Begin plugin configuration
 " Airline
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#buffer_nr_show = 0
  let g:airline#extensions#tabline#tab_nr_type = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = ' '
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = ' '
  let g:airline_symbols_branch = ''
  let g:airline_symbols_readonly = ''
  let g:airline_symbols_linenr = ''
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'murmur'

 " Ctrl+P
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_max_depth = 0
  let g:ctrlp_max_files = 0
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_lazy_update = 150
  if executable("ag")
    let g:ctrlp_user_command = 'ag %s -i --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
  endif

  let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<CR>'],
  \ 'AcceptSelection("t")': ['<C-t>','<c-m>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-h>'],
  \ 'AcceptSelection("v")': ['<c-v>']
  \ }

 " Gundo/Mundo
  let g:gundo_preview_height = 20
  let g:gundo_close_on_revert = 1

 " NeoMake
  let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
  let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
  let g:neomake_verbose=1
  let g:neomake_open_list=2
  let g:neomake_list_height=10
  let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact'],
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_logfile='/mnt/Resources/Workspace/neomake.log'
  let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'WarningMsg',
    \ }
  let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'ErrorMsg',
    \ }

 " NeoTerm
  let g:neoterm_shell = 'bash'
  let g:neoterm_position = 'horizontal'
  let g:neoterm_automap_keys = '<leader>tt'
  let g:neoterm_size=15

 " NerdCommenter
  let g:NERDCustomDelimiters = {
    \ 'javascript': { 'left': '// ', 'leftAlt': '{/* ', 'rightAlt': ' */}'}
    \ }

 " Begin Custom Functions
  let g:highlighting = 0

function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction

function! SetGitDir()
  " Change working dir to the current file
  "cd %:p:h
  " Set 'gitdir' to be the folder containing .git
  let l:gitdir=system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let l:isnotgitdir=matchstr(gitdir, '^fatal:.*')
  " If it empty, there was no error. Let's cd
  "if exists(l:gitdir)
    "cd l:gitdir
  if empty(l:isnotgitdir)
    exe "lcd " . l:gitdir
  endif
endfunction

function! EnterNeomake()
  " don't show the loc-list when entering a buffer
  let g:neomake_open_list=0
  exe "Neomake"
endfunction

function! SaveNeomake()
  " don't show the loc-list when entering a buffer
  let g:neomake_open_list=2
  exe "Neomake"
endfunction

function! Tabbufn()
  let s:tab_count = tabpagenr('$')
  if s:tab_count <= 1
    :bn
  else
    :tabnext
  endif
endfunction

function! Tabbufp()
  let s:tab_count = tabpagenr('$')
  if s:tab_count <= 1
    :bp
  else
    :tabprev
  endif
endfunction

" Begin Custom Keymappings

 "Note: clipboard customizations.
 "let g:EasyClipEnableBlackHoleRedirectForChangeOperator = 0
 let g:EasyClipUseCutDefaults = 0
 let g:EasyClipUseSubstituteDefaults = 1
 noremap  <S-x>      <S-v>x
 " cuts the char under cursor to an unused register
 nnoremap x          "_x
 " cuts the char(s) under selection to the system register
 vnoremap x          "*x
 " ctrl+v pasting from system clipboard
 inoremap <C-v>      <C-r>*
 cnoremap <C-v>      <C-r>*

 " Normal Mode Mappings
  " NeoTerm Mappings
  nnoremap <silent> <f10> :TREPLSendFile<cr>
  nnoremap <silent> <f9> :TREPLSend<cr>
  vnoremap <silent> <f9> :TREPLSend<cr>

  " run set test lib
  nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
  nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
  nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
  nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>

  " Useful maps
  " open terminal
  nnoremap <silent> <leader>tt :call neoterm#toggle()<cr>
  " hide/close terminal
  nnoremap <silent> <leader>th :call neoterm#close()<cr>
  " clear terminal
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

  " Basic Mappings
  nnoremap  <silent>    <expr> <CR>    Highlighting()
  nnoremap <silent> <F5> :call Tabbufp()<CR>
  nnoremap <silent> <F6> :call Tabbufn()<CR>
  nnoremap <silent> <C-i> "=nr2char(getchar())<cr>P
  nnoremap <silent> <C-a> <right>"=nr2char(getchar())<cr>P
  nnoremap  <silent>     gn              :lnext<cr>
  nnoremap  <silent>     gp              :lprev<cr>
  nnoremap  <silent>     @ws             :w<CR>:source<space>%<CR>:echom("Saved & Sourced Current File")<CR>
  nnoremap  <silent>     @s              :source<space>%<CR>:echom("Sourced Current File")<CR>
  nnoremap  <silent>     <leader>p       :ClearCtrlPCache<CR>\|:CtrlP<CR>
  nnoremap               <leader>;       A;<esc>
  nnoremap               <Nul>           :b#<CR>
  nnoremap  <silent>     <F7> :GundoToggle<CR>
  nnoremap       <silent> <C-c><C-c>      :call NERDComment(1, 'toggle')<cr>
  nnoremap       <silent> <C-c>c          :call NERDComment(1, 'toggle')<cr>

 " Visual Mode Mappings
  vnoremap  <silent>    <leader><leader> <esc>
  vnoremap  <leader>ac  y:ag<space><C-R>0<space>-i
  vnoremap       <silent> <C-c><C-c>      :call NERDComment(2, 'toggle')<cr>
  vnoremap       <silent> <C-c>c          :call NERDComment(2, 'toggle')<cr>

 " Insert Mode Mappings
  inoremap               <leader><leader> <esc>

 " Complete Mappings
  ca ag Ag!
  ca ColorTable XtermColorTable
  ca showcolors XtermColorTable
  "ca colors XtermColorTable
  noremap       <C-f>           :NERDTreeToggle<CR>
  noremap       <C-b>           :BufExplorer<CR>
  noremap       ;               :

 "Custom Colors:
  hi CursorColumn ctermbg=16
  hi CursorLine ctermbg=16 cterm=none
  hi search ctermfg=190 ctermbg=none cterm=bold,underline
  hi visual ctermfg=226 ctermbg=093
  hi SpellBad ctermfg=000 ctermbg=202
  hi SpellCap ctermfg=000 ctermbg=220
  hi Pmenu ctermbg=195 ctermfg=000 cterm=standout
  highlight Cursor ctermfg=000
  highlight iCursor ctermfg=000



  " Clean up excess .init after loading
  silent !rm ~/.vim/.init.vim-rplugin~


