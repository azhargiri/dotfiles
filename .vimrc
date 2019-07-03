" See https://dougblack.io/words/a-good-vimrc.html

set nocompatible

" ## Colors
  syntax enable           " enable syntax processing
  set background=dark

" ## Leader shortcut
  let mapleader=","       " leader is comma

" ## Encoding
  " Let Vim use utf-8 internally, because many scripts require this
  set encoding=utf-8
  setglobal fileencoding=utf-8

" ## Spaces, Indent & Tabs
  set tabstop=4       " number of visual spaces per TAB
  set softtabstop=4   " number of spaces in tab when editing
  set shiftwidth=4    " number of space when autoindent use. i.e.: '>>' pressed
  set expandtab       " tabs are spaces
  set autoindent

  nnoremap <S-L> :tabnext<CR>
  nnoremap <S-H> :tabprevious<CR>

  cmap sh2 expandtab shiftwidth=2 softtabstop=2 autoindent smartindent 
  cmap sh4 expandtab shiftwidth=4 softtabstop=4 autoindent smartindent 

" ## UI config
  set number              " show line numbers
  set showcmd             " show command in bottom bar
  " set cursorline          " highlight current line
  filetype indent plugin on      " load filetype-specific indent files 
  filetype plugin on
  set wildmenu            " visual autocomplete for command menu
  set lazyredraw          " redraw only when we need to.
  set showmatch           " highlight matching [{()}]
  set modelines=1	      " modelines aware
  nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
  set laststatus=2  " Always display the status line

  if has('gui_running')
    set guioptions-=m       " remove menu
    set guioptions-=T       " remove toolber 
    set guioptions-=L       " remove scrollbar (recheck!)
    set guifont=Hack\ 9,
              \Inconsolata-g\ for\ Powerline\ 9,
              \Monaco\ 9,
              \Andale\ Mono\ Regular\ 9,
              \Menlo\ Regular\ 11,
              \Consolas\ Regular\ 12,
              \Courier\ New\ Regular\ 14
    set lines=45 columns=121                " 40 lines of text instead of 24
  else
    if &term == 'xterm' || &term == 'screen'
      set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    " set term=builtin_ansi       " Make arrow and other keys work
  endif

" ## Window/pane
  " resize split-window
  " nnoremap <silent> <Leader>= :resize +3<CR>
  " nnoremap <silent> <Leader>- :resize -3<CR>

  " change window width 
  nnoremap <Leader>] :vertical resize +1<CR> " increase window width
  nnoremap <Leader>[ :vertical resize -1<CR> " decrease window width

  " change window height
  nnoremap <Leader>- :resize -1<CR> " increase window height
  nnoremap <Leader>+ :resize +1<CR> " decrease window height 

  " set all window equal height and width
  nnoremap <Leader>= <C-w>=

  
  let g:choosewin_overlay_enable = 1
  nmap  -  <Plug>(choosewin)

" ## Searching
  set incsearch           " search as characters are entered
  set hlsearch            " highlight matches
  set ignorecase
  " turn off search highlight
  nnoremap <Leader><space> :nohlsearch<CR>

" ## Folding
  set foldenable          " enable folding
  set foldlevelstart=10   " open most folds by default
  set foldnestmax=10      " 10 nested fold max
  " space open/closes folds
  nnoremap <space> za
  " fold based on indent level.
  " possible value : indent, marker, manual, expr, syntax, diff
  set foldmethod=syntax

" ## Movement
  " move vertically by visual line. :help gj
  " nnoremap j gj
  " nnoremap k gk 

  " move to beginning/end of line
  nnoremap B ^
  nnoremap E $

  " " $/^ doesn't do anything
  " nnoremap $ <nop>
  " nnoremap ^ <nop>

  " highlight last inserted text
  nnoremap gV `[v`]

  " jump to other pane
  nnoremap <C-J> <C-W>j
  nnoremap <C-K> <C-W>k
  nnoremap <C-H> <C-W>h
  nnoremap <C-L> <C-W>l

" ## Tags
  set tags=./tags,tags

  " zz is escape
  nmap zz <Esc>
  imap zz <Esc>
  vmap zz <Esc>
  cmap zz <Esc>
  omap zz <Esc>

  nmap <Leader><Leader> <Esc>
  imap <Leader><Leader> <Esc>
  vmap <Leader><Leader> <Esc>
  cmap <Leader><Leader> <Esc>
  omap <Leader><Leader> <Esc>

  vnoremap <Leader>w :w<CR>

  " Run commands that require an interactive shell
  nnoremap <Leader>r :RunInInteractiveShell<space>

  " toggle gundo
  nnoremap <Leader>u :GundoToggle<CR>

  " edit vimrc/zshrc and load vimrc bindings
  nnoremap <Leader>ev :vsp $MYVIMRC<CR>
  " nnoremap <Leader>ez :vsp ~/.zshrc<CR>
  nnoremap <Leader>sv :source $MYVIMRC<CR>

  " save session
  nnoremap <Leader>s :mksession<CR>

  " undo/redo
  set undodir=~/.vimundo

" ## Vim Plug Plugin list
  if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
  else
    call plug#begin('~/.vim/plugged')
  endif
    " ### Misc
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-syntastic/syntastic'
    Plug 'simnalamburt/vim-mundo'
    Plug 'EinfachToll/DidYouMean'
    Plug 'blindFS/vim-colorpicker'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'rking/ag.vim'



    " Plug 'mileszs/ack.vim'
    "  let g:ackprg = 'ag --nogroup --nocolor --column'
    " or
    " let g:ackprg = 'ag --vimgrep'

    " Plug 'soywod/vim-keepeye' 
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] } " On-demand lazy load
    Plug 'editorconfig/editorconfig-vim'


    " ### P:roject Management
    " Plug 'ryanolsonx/ctrlp-projects.vim'
    Plug 'Vigemus/fzf-proj.vim'
        let g:fzf#proj#project_dir = "~/codes"

    " ### General debugger
    Plug 'vim-vdebug/vdebug'
    Plug 'carlosrocha/vim-chrome-devtools', { 'do': 'npm install && npm run build' }

    " ### Git
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'

    " ### Appearance
    Plug 'trevordmiller/nova-vim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/solarized'
    Plug 'chriskempson/tomorrow-theme'
    Plug 't9md/vim-choosewin'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'moll/vim-bbye'
    Plug 'chriskempson/base16-vim'
    Plug 'eiiches/vim-rainbowbrackets'

    " # alternative to comfortable-motion.vim
    " Plug 'yonchu/accelerated-smooth-scroll'	
    "   nmap <silent> <C-j> <C-d> 
    "   nmap <silent> <C-k> <C-u> 
    "   xmap <silent> <C-j> <C-d> 
    "   xmap <silent> <C-k> <C-u> 

    " ### General
    if executable('ctags')
      Plug 'majutsushi/tagbar'
      Plug 'vim-scripts/taglist.vim'

      " Plug 'xolox/vim-easytags'
      "   let g:easytags_cmd = '/usr/bin/ctags'
      "   let g:easytags_async = 1
      "   let g:easytags_dynamic_files = 1
      "   let g:easytags_ctags_version = '0'
      "   let g:easytags_skip_check_ctags_version = 1
      "   let g:easytags_auto_update = 0
      "   let g:easytags_suppress_report = 1
        " be verbose. messages by executing :messages or :call xolox#easytag#why_so_slow()
    endif

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
      set pyxversion=3 
    endif
    let g:deoplete#enable_at_startup = 1

    Plug 'honza/vim-snippets'
    Plug 'vim-scripts/Align' " SQLUtilities depends this

    " ### PHP
    Plug 'spf13/PIV'
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'beyondwords/vim-twig'
    Plug 'stephpy/vim-php-cs-fixer'

    " ### Python
    Plug 'yssource/python.vim'

    " ### Ruby
    Plug 'tpope/vim-rails'
    let g:rubycomplete_buffer_loading = 1

    " ### Node / Javascript
    Plug 'kchmck/vim-coffee-script'
    Plug 'pangloss/vim-javascript'
    Plug 'elzr/vim-json'

    " ### HTML / CSS
    Plug 'heracek/HTML-AutoCloseTag', { 'name': 'HTML-AutoCloseTag2' }
    Plug 'hail2u/vim-css3-syntax'
    Plug 'mattn/emmet-vim'

    " ### Go
    Plug 'fatih/vim-go'

    " ### Bash

    " ### Rust
    Plug 'rust-lang/rust.vim'

    " ### Markdown
    Plug 'tpope/vim-markdown'
    Plug 'spf13/vim-preview'

    " ### SQL
    Plug 'vim-scripts/SQLUtilities'
    Plug 'vim-scripts/dbext.vim'

    " ### General utilities
    Plug 'Shougo/denite.nvim'
    Plug 'chemzqm/todoapp.vim'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/goyo.vim'   " distraction-free mode

    " ### Productivity
    Plug 'wakatime/vim-wakatime'

  call plug#end()

" ## Autogroup
  augroup configgroup
    autocmd!
    " autocmd VimEnter * highlight clear SignColumn
    " autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal nocursorline 
    autocmd FileType php setlocal commentstring=//\ %s
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh,*.vimrc* setlocal tabstop=2
    autocmd BufEnter *.sh,*.vimrc* setlocal shiftwidth=2
    " autocmd VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    " autocmd VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
    autocmd BufEnter *.sh,*.vimrc* setlocal softtabstop=2
    autocmd BufEnter *.* set syntax=on
  augroup END

" ## Backup
  set backup
  set backupdir=~/.vim-backup,/tmp
  set backupskip=/tmp/*,/private/tmp/*
  set directory=~/.vimswap,/tmp
  set writebackup

" Airline
  let g:airline_powerline_fonts = 0

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " powerline symbols
  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  " let g:airline_right_sep = ''
  " let g:airline_right_alt_sep = ''
  " let g:airline_symbols.branch = ''
  " let g:airline_symbols.readonly = ''
  " let g:airline_symbols.linenr = ''


  let g:airline_left_sep = '|'
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = '|'
  let g:airline_right_alt_sep = '|'
  let g:airline_symbols.branch = '(Y)'
  let g:airline_symbols.readonly = 'ro'
  let g:airline_symbols.linenr = 'n/r'
  
  " Airline Theme
  let g:airline_theme='gruvbox'

" ## Buffer
  set autowrite           " autosave

  " http://vim.wikia.cmm/wiki/Fix_indentation
  " To format and return the same line where you were
  map <Leader><F7> mzgg=G`z

  nnoremap bl :ls<CR>
  map <Leader>d :bd<CR>
  map <Leader>d! :bd!<CR>
  map <Leader>q :q<CR>
  map <Leader>w :w<CR>

  " pressing qqq in command will force exit
  cmap qqq qa!

  " automatically reload .vimrc if any .vimrc* file changed
  autocmd! bufwritepost ~/.vimrc* source ~/.vimrc

  cnoremap bdall :bufdo bdelete<CR>

  " When your file need sudo but you forgot, just do :w!!
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" ## Misc
  if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
      set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
      set clipboard=unnamed
    endif
  endif

  set backspace=indent,eol,start
  set pastetoggle=<F10>          " https://linuxrunway.wordpress.com/2017/02/06/paste-dengan-indent-berlebih-di-vim/

  nnoremap <Leader>\l :set background=light<CR>
  nnoremap <Leader>\d :set background=dark<CR>

  nnoremap <Leader>so :set syntax=on<CR> " useful if syntax highlighting is broken (usually after scrolling)

  " Add bracket at begin and end of selected text
  " see http://vim.wikia.com/wiki/Making_Parenthesis_And_Brackets_Handling_Easier
  " part "Late" bracketing of text
  " Sounds very similar with vim-surround
  vnoremap _( <Esc>`>a)<Esc>`<i(<Esc>w
  vnoremap _{ <Esc>`>a}<Esc>`<i{<Esc>w
  vnoremap _[ <Esc>`>a]<Esc>`<i[<Esc>w
  vnoremap _" <Esc>`>a"<Esc>`<i"<Esc>w
  vnoremap _' <Esc>`>a'<Esc>`<i'<Esc>w
  
" ## CtrlP

  " nnoremap mb :CtrlPBuffer<CR>
  " nnoremap mr :CtrlPMRUFiles<CR>
  " nnoremap mt :CtrlPBufTag<CR>
  " nnoremap mc :CtrlPProjects<CR>

  " ref: https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6
  " let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ## CtrlP Project
  " Enables ctrlp-projects.vim for use within ctrl-p
  " let g:ctrlp_extensions = ['projects']
  " let g:ctrlp_projects = { }   " use ~/.project file

  " nnoremap <Leader>c :CtrlPProjects<CR>

" ## FZF
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'
    \}

  nnoremap <Leader>f :Files<CR>
  nnoremap FF :Files<CR>
  "nnoremap <C-p> :Files<CR>
  nnoremap <Leader>g :GFiles<CR>
  nnoremap <Leader>b :Buffers<CR>
  nnoremap BB :Buffers<CR>
  nnoremap <Leader>h :History<CR>
  nnoremap <Leader>t :BTags<CR>
  nnoremap <Leader>T :Tags<CR>

" ## PHP
  let g:php_cs_fixer_path="~/.config/composer/vendor/bin/php-cs-fixer"
  " autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" ## Comfortable scroll
  let g:comfortable_motion_scroll_down_key = "j"
  let g:comfortable_motion_scroll_up_key = "k"
  nmap <c-j> <c-d>
  nmap <c-k> <c-u>

" ## Ag
  " open ag.vim
  " need install Silver Search (https://github.com/ggreer/the_silver_searcher.git)
  " and Ag.vim Plugin (https://github.com/rking/ag.vim.git)
  nnoremap <Leader>a :Ag

" ## Colorscheme
  colorscheme gruvbox

" ## Vdebug
  let g:vdebug_options = {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : 'xdebug-php',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾',
    \    "continuous_mode" : 0,
    \}

  let g:vdebug_keymap = {
    \    "run" : "<F5>",
    \    "run_to_cursor" : "<F9>",
    \    "step_over" : "<F8>",
    \    "step_into" : "<F7>",
    \    "step_out" : "<shift><F8>",
    \    "close" : "<F6>",
    \    "detach" : "<shift><F7>",
    \    "set_breakpoint" : "<F12>",
    \    "get_context" : "<F11>",
    \    "eval_under_cursor" : "<F10>",
    \    "eval_visual" : "<Leader>e",
    \}

" ## NERDTree
  nnoremap <Leader>e :NERDTreeToggle<CR>

" KeepEye
  " let g:keepeye_message = '-- BREAK TIME --'
  " let g:keepeye_system_bell = 1
  " let g:keepeye_system_notification = 1
  " highlight User1 guifg=#ffffff guibg=#ff0000
  " let g:keepeye_message_hl_user = 1
  " nnoremap <Leader>k :KeepEye<CR>


" dbext
  let g:dbext_default_profile_local = 'type=MYSQL:user=<user>:passwd=<passwd>:dbname=<dbname>'

" ## base16 color
  " if filereadable(expand("~/.vimrc_background"))
  "   let base16colorspace=256
  "   source ~/.vimrc_background
  " endif

" Rainbow bracket
let g:rainbowbrackets_colors =
			\ [
			\   'ctermfg=9',
			\   'ctermfg=10',
			\   'ctermfg=33',
			\   'ctermfg=190'
			\ ]
let g:rainbowbrackets_enable_round_brackets = 1
let g:rainbowbrackets_enable_curly_brackets = 1
let g:rainbowbrackets_enable_square_brackets = 1
let g:rainbowbrackets_enable_angle_brackets = 1

" Vim Notes
let g:notes_directories = ['~/Documents/Notes' ]

augroup vimrc-rainbowbrackets
	autocmd!
	autocmd FileType * let b:rainbowbrackets_enable_curly_brackets = 1
augroup END

" Goyo
"" integrate Goyo with LimeLight to provide block-focused on distraction-free mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ## Custom function

  " strips trailing whitespace at the end of files. this
  " is called on buffer write in the autogroup above.
  function! <SID>StripTrailingWhitespaces()
      " save last search & cursor position
      let _s=@/
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      let @/=_s
      call cursor(l, c)
  endfunction

  " Append modeline after last line in buffer.
  " Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
  " files.
  function! AppendModeline()
      " vi: fen foldmethod=indent shiftwidth=2 tabstop=2 expandtab autoindent :
      let l:modeline = printf(" vim: set fen foldmethod=indent ts=%d sw=%d tw=%d %set autoindent :",
                  \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
      let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
      call append(line("$"), '')
      call append(line("$"), l:modeline)
  endfunction
" vim: set sw=2 ts=2 sts=2 et tw=78 foldlevel=0 foldmethod=syntax spell:
