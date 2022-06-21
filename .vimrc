" See https://dougblack.io/words/a-good-vimrc.html

set nocompatible

" ## Colors
  syntax enable           " enable syntax processing
  set background=dark

" ## Leader shortcut
  let mapleader=","       " Leader is comma

" ## Encoding
  " Let Vim use utf-8 internally, because many scripts require this
  set encoding=utf-8
  setglobal fileencoding=utf-8

" ## Spaces, Indent & Tabs
  set tabstop=4       " number of visual spaces per TAB
  set softtabstop=4   " number of spaces in tab when editing
  set shiftwidth=4    " number of space when autoindent use. i.e.: '>>' pressed
  set noexpandtab     " tabs are not spaces
  set autoindent smartindent
  set linespace=3
  set scrolloff=8
  set signcolumn=yes

  nnoremap <S-L> :tabnext<CR>
  nnoremap <S-H> :tabprevious<CR>
  nnoremap <S-T>T :tabnew<CR>


  cmap sh2 expandtab shiftwidth=2 softtabstop=2 autoindent smartindent
  cmap sh4 expandtab shiftwidth=4 softtabstop=4 autoindent smartindent

" Netrw
  let g:netrw_banner       = 1
  let g:netrw_keepdir      = 1
  let g:netrw_liststyle    = 2 " or 3
  let g:netrw_sort_options = 'i'
  let g:netrw_browse_split = 4
  let g:netrw_winsize = 25

" ## UI config
  set number              " show line numbers
  set relativenumber      " show line number relatively
  set showcmd             " show command in bottom bar
  " set cursorline          " highlight current line
  filetype indent plugin on      " load filetype-specific indent files
  filetype plugin on
  set wildmenu            " visual autocomplete for command menu
  set lazyredraw          " redraw only when we need to.
  set showmatch           " highlight matching [{()}]
  set modelines=1	      " modelines aware
  nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
  set laststatus=1        " Always display the status line

  set noeb vb t_vb=  " disable errorbell & visualbell

  if has('gui_running')
    set guioptions-=m       " remove menu
    set guioptions-=T       " remove toolber
    set guioptions-=L       " remove scrollbar (recheck!)
    set guifont=\
              \Agave\ 10,
              \SF\ Mono\ Medium\ 10,
              \Cascadia\ Code\ 10,
              \Monolisa\ 9,
              \Fantasque\ Sans\ Mono\ 11,
              \Menlo\ Regular\ 10,
              \Hack\ 9,
              \Monaco\ 9,
              \Inconsolata\ for\ Powerline\ \Medium\ 11,
              \Andale\ Mono\ Regular\ 9,
              \Consolas\ Regular\ 10,
              \Courier\ New\ Regular\ 14
    set lines=30 columns=115                " 40 lines of text instead of 24

  elseif exists('gnvim')
    set guifont=Cascadia\ Code:h10
    set lines=25 columns=80                " 40 lines of text instead of 24

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
    " increase window width
  nnoremap <Leader>] :vertical resize +1<CR>
    " decrease window width
  nnoremap <Leader>[ :vertical resize -1<CR>

  " change window height
    " increase window height
  nnoremap <Leader>- :resize -1<CR>
    " decrease window height
  nnoremap <Leader>+ :resize +1<CR>

  " set all window equal height and width
  nnoremap <Leader>= <C-w>=


  nnoremap <Leader>~ <Esc><Insert>`


  let g:choosewin_overlay_enable = 1
  nmap  -  <Plug>(choosewin)

" ## Searching
  set incsearch           " search as characters are entered
  set nohlsearch            " highlight matches
  set ignorecase
  " turn off search highlight
  nnoremap <Leader><space> :nohlsearch<CR>

" ## Autocompletion
  " use Ctrl + space for omnicompletion
  inoremap <C-Space> <C-X><C-O>

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

  " put this character on-ward to new line
  nnoremap <CR><CR> <Insert><CR><Esc>
  " insert char i immediately after entering insert mode
  nnoremap ii <Insert>i
  " insert space before current char
  nnoremap i<Space><Space> i<Space><Esc>

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
  nnoremap <Leader>u :MundoToggle<CR>

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
    Plug 'tpope/vim-vinegar'
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

    if has('nvim')
      Plug 'nvim-lua/plenary.nvim'
    endif

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
        let g:fzf#proj#project_dir = "~/workspace"
        let g:fzf#proj#max_project_depth = 5
        let g:fzf#proj#open_new_tab = 1
        let g:fzf#proj#fancy_separator = " "

    " ### General debugger
    Plug 'vim-vdebug/vdebug'
    Plug 'carlosrocha/vim-chrome-devtools', { 'do': 'npm install && npm run build' }

    " ### Git
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
	" bitbucket support
    " Plug 'tommcdo/vim-fubitive'

	" ### Appearance
    Plug 'trevordmiller/nova-vim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'altercation/solarized'
    " Plug 'chriskempson/tomorrow-theme'
    Plug 't9md/vim-choosewin'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'moll/vim-bbye'
    " Plug 'chriskempson/base16-vim'
    Plug 'eiiches/vim-rainbowbrackets'
    Plug 'dracula/vim'

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

      Plug 'xolox/vim-easytags'
        let g:easytags_cmd = '/usr/bin/ctags'
        let g:easytags_file = './tags'
        let g:easytags_async = 1
        let g:easytags_dynamic_files = 1
        let g:easytags_ctags_version = '0'
        let g:easytags_skip_check_ctags_version = 1
        let g:easytags_auto_update = 0
        let g:easytags_suppress_report = 1
        let g:easytags_by_filetype = 1
        let g:easytags_events = ['BufWritePost']
        " be verbose. messages by executing :messages or :call xolox#easytag#why_so_slow()
    endi
    Plug 'zackhsi/fzf-tags'

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
      set pyxversion=3
    endif
    let g:deoplete#enable_at_startup = 1
    set completeopt+=noselect
    " call deoplete#custom#option('ignore_sources', {'php': ['omni']})

    Plug 'honza/vim-snippets'
    Plug 'vim-scripts/Align' " SQLUtilities depends this

    " ### PHP
    " Plug 'spf13/PIV'
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'beyondwords/vim-twig'
    Plug 'stephpy/vim-php-cs-fixer'
    " Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

      " let g:phpcd_php_cli_executable = 'symfony php'

    " ### Drupal
    Plug 'https://git.drupal.org/project/vimrc.git', { 'branch': '8.x-1.x', 'rtp': 'bundle/vim-plugin-for-drupal' }

    " ### Python
    Plug 'yssource/python.vim'

    " ### Ruby
    Plug 'tpope/vim-rails'
    let g:rubycomplete_buffer_loading = 1

    " ### Node / Javascript
    Plug 'kchmck/vim-coffee-script'
    Plug 'pangloss/vim-javascript'
    Plug 'elzr/vim-json'

    " ### Svelte
    " Plug 'leafOfTree/vim-svelte-plugin'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    " let g:vim_svelte_plugin_load_full_syntax = 1

    " ### HTML / CSS
    Plug 'heracek/HTML-AutoCloseTag', { 'name': 'HTML-AutoCloseTag2' }
    " Plug 'hail2u/vim-css3-syntax'
    Plug 'mattn/emmet-vim'

    " ### Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " ### Bash

    " ### Rust
    Plug 'rust-lang/rust.vim'

    " ### Markdown
    Plug 'tpope/vim-markdown'
    Plug 'spf13/vim-preview'

    " ### SQL
    Plug 'vim-scripts/SQLUtilities'
    Plug 'vim-scripts/dbext.vim'

    " ### Language server
    " Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    " ### General utilities
    Plug 'Shougo/denite.nvim'
    Plug 'chemzqm/todoapp.vim'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'
    Plug 'simplenote-vim/simplenote.vim'
      source ~/.simplenoterc
    " create screenshot from selected lines to install silicon
    " cargo install silicon
    Plug 'segeljakt/vim-silicon'
    Plug 'sindrets/diffview.nvim'

  call plug#end()

  call deoplete#custom#option('omni_patterns', {
    \ 'go': '[^. *\t]\.\w*',
    \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
    \ 'java': '[^. *\t]\.\w*',
    \ 'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
    \ })

" ## Autogroup
  augroup configgroup
    autocmd!
    " autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
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
  " let g:airline_extensions = []  " disable extensions

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  let g:airline_symbols.branch = '⎇'

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
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  " Airline Theme
  let g:airline_theme='gruvbox'
  let g:airline#extensions#hunks#enabled=0

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
  " autocmd! BufWritePost ~/.vimrc* source ~/.vimrc

  cnoremap bdall :bufdo bdelete<CR>
  nnoremap DD :bufdo bdelete<CR>
  nnoremap <Leader>x :bunload<CR>
  nnoremap <Leader>X :bdelete<CR>

  " cnoremap q bdelete<CR>

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

  nnoremap <Leader>so :syntax on<CR> " useful if syntax highlighting is broken (usually after scrolling)

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

  " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded' } }
  let g:fzf_layout = { 'down': '~30%' }
  let g:fzf_preview_window = 'right'

  " let g:fzf_tags_prompt = " "
  nmap <C-]> <Plug>(fzf_tags)
  nmap g] <Plug>(fzf_tags)


  " FZF for tag jumping
  nnoremap <Leader>g] :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

  nnoremap <Leader>f :Files<CR>
  nnoremap FF :Files<CR>
  nnoremap <space><space> :Files<CR>
  "nnoremap <C-p> :Files<CR>
  nnoremap <Leader>g :GFiles<CR>
  nnoremap <Leader>b :Buffers<CR>
  nnoremap BB :Buffers<CR>
  nnoremap <Leader>h :History<CR>
  nnoremap <Leader>t :BTags<CR>
  nnoremap <Leader>T :Tags<CR>
  nnoremap <Leader>tb :TagBarToggle<CR>
  nnoremap <Leader>p :Projects<CR>

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
  highlight Normal ctermbg=NONE

" ## Vdebug
  let g:vdebug_options = {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'close',
    \    "break_on_open" : 1,
    \    "ide_key" : 'xdebug-php',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "watch_window_style" : 'compact',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾',
    \    "continuous_mode" : 1,
    \    "auto_start" : 1,
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
  let g:dbext_default_profile_supreme = 'type=MYSQL:user=root:passwd=root:dbname=databasename'

" copy file path
  " relative path
  nnoremap <Leader>cp :call CopyFilePath(expand('%'))<CR>
  " absolutepath
  nnoremap <Leader>cP :call CopyFilePath(expand('%:p'))<CR>

  function! CopyFilePath(path)
    let @+=a:path
    echo "Path copied"
  endfunction

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

" vim silicon
let g:silicon = {
  \   'theme':                 'Nord',
  \   'font':              'Monolisa',
  \   'background':         '#AAAAFF',
  \   'shadow-color':       '#555555',
  \   'line-pad':                   2,
  \   'pad-horiz':                 80,
  \   'pad-vert':                 100,
  \   'shadow-blur-radius':         0,
  \   'shadow-offset-x':            0,
  \   'shadow-offset-y':            0,
  \   'line-number':           v:true,
  \   'round-corner':          v:true,
  \   'window-controls':       v:true,
  \   'output': '~/Pictures/silicon-{time:%Y-%m-%d-%H%M%S}.png',
  \ }

augroup vimrc-rainbowbrackets
	autocmd!
	autocmd FileType * let b:rainbowbrackets_enable_curly_brackets = 1
augroup END

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

  function! IPhpInsertUse()
      call PhpInsertUse()
      call feedkeys('a',  'n')
  endfunction
  autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>PhpSortUse<CR>
  autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>PhpSortUse<CR>

  function! IPhpExpandClass()
      call PhpExpandClass()
      call feedkeys('a', 'n')
  endfunction
  autocmd FileType php inoremap <Leader>pe <Esc>:call IPhpExpandClass()<CR>PhpSortUse<CR>
  autocmd FileType php noremap <Leader>pe :call PhpExpandClass()<CR>PhpSortUse<CR>

" vim: set sw=2 ts=2 sts=2 et tw=78 foldlevel=0 foldmethod=syntax spell:
