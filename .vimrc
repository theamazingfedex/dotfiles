
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
  NeoBundle 'othree/yajs.vim'
  NeoBundle 'benekastah/neomake'
  NeoBundle 'kassio/neoterm'
  NeoBundle 'carlitux/deoplete-ternjs'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'ompugao/vim-airline-datetime'
  NeoBundle 'simnalamburt/vim-mundo'
  NeoBundle 'tpope/vim-eunuch'
  NeoBundle 'guns/xterm-color-table.vim'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'tpope/vim-obsession'
  NeoBundle 'tmhedberg/matchit'
  NeoBundle 'gregsexton/MatchTag'
  NeoBundle 'ervandew/supertab'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'Shougo/deoplete.nvim'
  NeoBundle 'reedes/vim-lexical'
  "NeoBundle 'suan/vim-instant-markdown'
  "NeoBundle 'tpope/vim-markdown'
  NeoBundle 'euclio/vim-markdown-composer', { 'build_commands': 'cargo build --release' }
  NeoBundle 'ternjs/tern_for_vim', { 'build_commands': 'npm install' }
  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'cuteTodoList'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'jlanzarotta/bufexplorer'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'svermeulen/vim-easyclip'
  NeoBundle 'easymotion/vim-easymotion'
  NeoBundle 'editorconfig/editorconfig-vim.git'
  NeoBundle 'tpope/vim-repeat'
  NeoBundle 'rking/ag.vim'
  NeoBundle 'vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'Shougo/neco-vim'


 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on
 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
  NeoBundleCheck

  " Registering Python3 Remote Plugins:
  "call remote#host#RegisterPlugin('python3', '/Users/daniwood/.nvim/bundle/deoplete.nvim/rplugin/python3/deoplete.py', [
        "\ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
        "\ ])

 set runtimepath+=~/.nvim/bundle/deoplete.nvim/

 " Configuration
  " Begin default configuration
   syntax on
   "let g:python_host_prog += '/usr/local/bin/python2:'
   "let g:python_host_prog += '/usr/local/bin/python3:'

   "let g:solarized_termcolors=256
   let mapleader=","
   let g:EasyMotion_leader_key=',,'
   let g:easymotion_do_mapping=0
   let g:easymotion_startofline=0
   let g:jsx_ext_required = 0
   let g:markdown_composer_syntax_theme='monokai'
   let g:markdown_fenced_languages = ['html', 'javascript', 'vim', 'python', 'bash=sh']
   if filereadable(".eslintrc") != 0
     set tabstop=2
     set shiftwidth=2
     set expandtab
   endif
   "set smartindent
   set completeopt-=preview
   set backspace=indent,eol,start
   set vb t_vb=0
   set esckeys
   set lazyredraw
   set mouse=a
   set clipboard=unnamed
   set hlsearch
   set mat=2
   set autoread
   "set shortmess=F
   set number
   set wrap
   set linebreak
   set showbreak=>\ \ \
   set showmatch
   set lbr
   set tw=0
   set hidden
   set ignorecase
   set nofoldenable
   set wildignore+=*/.cache*/*,*/tmp/*,*/*node_modules/*,*.swp,*.zip,*.gz,*.tar,*.so,*.exe
   set statusline+=%#warningmsg#
   "set statusline+=%*
   set statusline+=%{fugitive#statusline()}
   set laststatus=2
   set cursorcolumn
   set cursorline
   set undofile
   set undodir=$HOME/.vim/tmp/undo
   set undolevels=5000
   set history=1000
   set incsearch
   set noerrorbells
   set backupdir=~/.nvim/tmp/backups
   set directory=~/.nvim/tmp/swaps

   call matchadd('ColorColumn', '\%81v', 100)
   ca ,, <esc>

  augroup myomnifuncs
    au!
    au FileType javascript,jsx setl omnifunc=tern#Complete
  augroup END

  let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
  let g:lexical#thesaurus_key = '<leader>rt'
  let g:lexical#spellfile = ['~/.vim/spell/en.utf-8.add',]
  let g:lexical#spell_key = '<leader>rs'
  let g:lexical#dictionary = ['/usr/share/dict/words',]
  let g:lexical#dictionary_key = '<leader>rd'
  augroup lexical
    autocmd!
    autocmd FileType markdown,mkd,md,textile,text call lexical#init()
  augroup END

  "augroup esformatter
    "au!
    "au! BufNewFile,BufReadPost *.md set filetype=markdown
  "augroup END
  augroup jsbeautify
    au!
    "au! FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
    au! FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
    au! FileType javascript,jsx vnoremap <buffer> <c-F> :call RangeJsxBeautify()<cr>
    au! FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
    au! FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
  augroup END
  augroup mygroup
    au!
    au! VimEnter * call SetGitDir()
    au! VimLeave,TermClose,BufHidden,BufWinLeave,BufLeave,BufFilePost,BufDelete,BufWipeout *.js lcl
    "Note: read in .spark files as html for syntax highlighting
    au! BufRead,BufNewFile *.spark set filetype=html
    "Note: run eslint when opening and writing js files
    "au! InsertChange,TextChanged *.js update | Neomake eslint
    au! BufEnter *.js call EnterNeomake()
    au! BufWritePost *.js call SaveNeomake()
    au! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  augroup END
" Begin plugin configuration
 " Airline
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline#extensions#tabline#show_close_button = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
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
  "let g:airline_section_y='%{strftime("%l:%M:%S %p, %a %b %d, %Y")}'

 " GitGutter
  let g:gitgutter_enabled = 0
  let g:gitgutter_sign_added = '='
  let g:gitgutter_sign_removed = '='
  let g:gitgutter_sign_modified = '❥~'
  let g:gitgutter_sign_modified_removed = '❥'

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

  " Deoplete
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#file#enable_buffer_path = 1
    let g:deoplete#data_directory = '~/.nvim/cache/deoplete'
    "let g:deoplete#disable_auto_complete = 1

  " SuperTab
    let g:SuperTabDefaultCompletionType = "<c-n>"

  " UltiSnips
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

  " Gundo/Mundo
    let g:mundo_preview_height = 20
    let g:mundo_close_on_revert = 1

  " NeoMake
    "if findfile('.eslintrc', '.;') ==# ''
      "let g:neomake_javascript_enabled_makers = ['standard']
    "else
      let g:neomake_javascript_enabled_makers = ['standard', 'eslint']
    "endif
    "if !executable("eslint")
    ""if g:eslint_path = ""
    "echo "It seems you don't have eslint installed. Let's just do that now..."
    "!npm install -g eslint
    ""endif
    "endif
    let g:neomake_verbose=1
    let g:neomake_open_list=2
    let g:neomake_list_height=10
    "let g:neomake_javascript_eslint_maker = {
        "\ 'args': ['--quiet', '-f', 'compact', '--stdin', '--stdin-filename', '%:p'],
        "\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        "\ '%W%f: line %l\, col %c\, Warning - %m'
        "\ }
    "\ 'args': ['--no-color', '--format', 'compact', '--from', 'vim'],
    "\ 'errorformat': '%f: line %l\, col %c\, %m',
    "\ }
    let g:neomake_logfile='/Users/daniwood/neomake.log'
    let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
    let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
    let g:neomake_warning_sign = {
          \ 'text': '✹',
          \ 'texthl': 'WarningMsg',
          \ }
    let g:neomake_error_sign = {
          \ 'text': '✖',
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
 " Tern for Vim
   let g:tern_show_argument_hints = 'on_hold'
   let g:tern_show_signature_in_pum =1
   au FileType javascript setlocal omnifunc=tern#Complete


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

function! ToggleGitGutter()
  execute ":GitGutterToggle"
  if g:gitgutter_enabled
    echo "Toggled GitGutter ON"
  else
    echo "Toggled GitGutter OFF"
  endif
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
  exe "Neomake eslint"
endfunction

function! SaveNeomake()
  " show the loc-list after saving
  let g:neomake_open_list=2
  exe "Neomake eslint"
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
  "nnoremap <silent> <f10> :TREPLSendFile<cr>
  "nnoremap <silent> <f9> :TREPLSend<cr>
  "vnoremap <silent> <f9> :TREPLSend<cr>

  " GitGutter Mappings
  nnoremap <silent> <leader>g :call ToggleGitGutter()<cr>

  " CuteTodoList Mapsilent
  nnoremap <silent> <F14> :silent exe "call TodoToggle()"<cr>
  nnoremap <silent> <leader>dt :silent exe "call TodoToggle()"<cr>
  nnoremap <leader>dg :Todog<cr>
  nnoremap <leader>do :Todo<cr>
  let g:is_todolist_open = 0
  function! TodoToggle()
    if (g:is_todolist_open)
      let g:is_todolist_open = 0
      echo g:is_todolist_open
      TodoClose
    else
      let g:is_todolist_open = 1
      echo g:is_todolist_open
      TodoOpen
    endif
  endfunction

  " EasyMotion Mappings
  map <leader> <plug>(easymotion-prefix)
  map <leader>b <plug>(easymotion-b)
  map <leader>h <plug>(easymotion-bl)
  map <leader>j <plug>(easymotion-j)
  map <leader>k <plug>(easymotion-k)
  map <leader>l <plug>(easymotion-wl)
  map <leader>w <plug>(easymotion-w)

  " run set test lib
  "nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
  "nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
  "nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
  "nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>

  " Useful maps
  " open terminal
  nnoremap <silent> <C-w>t      :call neoterm#open()<cr><C-w>ja
  nnoremap <silent> <C-w><C-t>  :call neoterm#open()<cr><C-w>ja
  " hide/close terminal
  tnoremap <silent> <C-w>t      <C-\><C-n>:call neoterm#toggle()<cr>
  tnoremap <silent> <C-w><C-t>  <C-\><C-n>:call neoterm#toggle()<cr>
  nnoremap <silent> <leader>th  :call neoterm#close()<cr>
  " clear terminal
  nnoremap <silent> <leader>tl  :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tc  :call neoterm#kill()<cr>
  tnoremap <silent> <C-w>c      <C-\><C-n>:call neoterm#kill()<cr>
  " backs out of terminal mode and switches windows up
  tnoremap <silent> <C-w>k      <C-\><C-n><C-w>k
  tnoremap <silent> <C-w><C-k>  <C-\><C-n><C-w>k

  " Basic Mappings
  noremap       ;               :
  noremap       <C-b>           :BufExplorer<CR>
  noremap       <C-f>           :NERDTreeToggle<CR>
  noremap               <leader><leader> <esc>
  nnoremap <silent> <C-w>e :lopen<cr>
  nnoremap <silent> <leader>x    :pcl<cr>
  nnoremap <silent> <C-w><C-e> :lclose<cr>
  nnoremap <silent> <F5> :call Tabbufp()<CR>
  nnoremap <silent> <F6> :call Tabbufn()<CR>
  nnoremap  <silent>     <F7> :MundoToggle<CR>
  nnoremap               <Nul>           :b#<CR>
  nnoremap               <leader>;       A;<esc>
  nnoremap  <silent>     ge              :ll<cr>
  nnoremap  <silent>     gn              :lnext<cr>
  nnoremap  <silent>     gp              :lprev<cr>
  nnoremap <silent> <C-i> "=nr2char(getchar())<cr>P
  nnoremap  <silent>    <expr> <CR>    Highlighting()
  nnoremap <silent> <leader>g :call ToggleGitGutter()<cr>
  nnoremap <silent> <C-a> <right>"=nr2char(getchar())<cr>P
  nnoremap  <silent>     <leader>p       :ClearCtrlPCache<CR>\|:CtrlP<CR>
  nnoremap       <silent> <C-c><C-c>      :call NERDComment(1, 'toggle')<cr>
  nnoremap       <silent> <C-c>c          :call NERDComment(1, 'toggle')<cr>
  nnoremap  <silent>     @s              :source<space>%<CR>:echom("Sourced Current File")<CR>
  nnoremap  <silent>     @ws             :w<CR>:source<space>%<CR>:echom("Saved & Sourced Current File")<CR>
  nnoremap <silent> <leader>tb   :TernDocBrowse<cr>
  nnoremap <silent> <leader>tm   :TernRename<cr>
  nnoremap <silent> <leader>tv   :TernDefSplit<cr>
  nnoremap <silent> <leader>tr   :TernRefs<cr>
  nnoremap <silent> <leader>tt   :TernType<cr>
  nnoremap <silent> <leader>td   :TernDoc<cr>
  nnoremap <silent> <leader>tf   :TernDef<cr>

 " Visual Mode Mappings
  vnoremap  <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
  vnoremap  <silent>    <leader><leader> <esc>
  vnoremap  <leader>ac  y:ag<space><C-R>0<space>-i
  vnoremap       <silent> <C-c><C-c>      :call NERDComment(2, 'toggle')<cr>
  vnoremap       <silent> <C-c>c          :call NERDComment(2, 'toggle')<cr>

 " Insert Mode Mappings
  inoremap               <leader><leader> <esc>
  " deoplete tab-complete
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

 " Complete Mappings
  ca ag Ag!
  ca ColorTable XtermColorTable
  ca showcolors XtermColorTable
  ca colors XtermColorTable

 "Custom Colors:
  hi CursorColumn ctermbg=16
  hi CursorLine ctermbg=16 cterm=none
  hi MatchParen ctermfg=93 ctermbg=154 cterm=bold
  hi search ctermfg=190 ctermbg=none cterm=bold,underline
  hi visual ctermfg=226 ctermbg=093
  hi SpellBad ctermfg=000 ctermbg=202
  hi SpellCap ctermfg=000 ctermbg=220
  hi Pmenu ctermbg=195 ctermfg=000 cterm=standout
  hi SignColumn ctermbg=none
  hi EasyMotionTarget1First ctermfg=160 cterm=bold
  hi EasyMotionTarget2First ctermfg=160 cterm=bold
  hi Cursor ctermfg=000
  hi iCursor ctermfg=000



  " Clean up excess .init after loading
  "silent !rm ~/.vim/.init.vim-rplugin~


nnoremap <leader>' A,<esc>
