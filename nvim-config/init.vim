let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug '~/code/nvim-project-tasks'
"Plug '~/code/nvim-codellama'

" Appearance
Plug '~/code/vim-gotham'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'shaunsingh/nord.nvim'
"Plug 'NLKNguyen/papercolor-theme'

Plug 'nvim-lualine/lualine.nvim'

" Syntax
Plug 'ziglang/zig.vim'
Plug 'rust-lang/rust.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'vim-perl/vim-perl'
Plug 'vim-scripts/applescript.vim'
Plug 'peterhoeg/vim-qml'

" Tools
Plug 'adigitoleo/haunt.nvim'
Plug 'johnfrankmorgan/whitespace.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'github/copilot.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.13.1'}
Plug 'mhinz/vim-startify'
"Plug 'Bekaboo/dropbar.nvim'
Plug 'hedyhli/outline.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'OXY2DEV/markview.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'olimorris/codecompanion.nvim'
Plug 'nvimtools/none-ls-extras.nvim'

Plug 'nvimtools/none-ls.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'} "
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'


call plug#end()

lua require('init')

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'double' } }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'FloatBorder'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:startify_lists = [
      \{ 'type': 'bookmarks' , 'header': ['Bookmarks']},
      \{ 'type': 'sessions' , 'header': ['Sessions']},
      \]
let g:startify_bookmarks = [ '~/code/neovim-ui/nvim-ui-double-width/',
                            \ '~/code/nvim-project-tasks/',
                            \ '~/code/nvim-codellama/',
                            \ '~/code/vim-gotham/',
                            \ '~/.config/nvim/',
                            \ '~/code/neovim-ui/nvim-ui/']
let g:startify_enable_unsafe = 1

"start an autocmd group for vimrc and clear it, so that you can
"source your vimrc after you've changed it. And not have your
"autocmd's defined multiple times.
augroup vimrc_group
  autocmd!
augroup END

" from Valloric's vimrc
" cindent is a bit too smart for its own good and triggers in text files when
" you're typing inside parens and then hit enter; it aligns the text with the
" opening paren and we do NOT want this in text files!
" from me, wrapped in an augroup
augroup vimrc_group
  autocmd FileType text,markdown,gitcommit set nocindent
augroup END

let g:python3_host_prog = '/usr/bin/python3'
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

if !has('nvim')
  set ttymouse=xterm2
  set backspace=indent,eol,start
  set encoding=utf-8
endif

set listchars=multispace:\|\\x20
set list
"set clipboard+=unnamedplus

"set foldmethod=indent
"set foldnestmax=3
" Enable highlighting of the current line
set cursorline
" Set the GUI font (useful in GUIs or terminal emulators that support it)
set guifont=Hasklug\ Nerd\ Font\ Mono:h12
let g:ui_font_multiplier_height = 2
let g:ui_font_multiplier_width = 1.0
" Allow switching buffers without saving the current one
set hidden
" Keep a history of 1000 commands and search entries
set history=1000
" Show search matches as you type
set incsearch
" Always show the status line
set laststatus=2
" Do not create backup files
set nobackup
" Do not display the mode (e.g., -- INSERT --), useful if you use a plugin like airline
set noshowmode
" Show absolute line numbers on the left
set number
" Do not use swap files
set noswapfile
" Do not wrap long lines
set nowrap
" Show the cursor position in the bottom right corner
"set ruler
" Keep 5 lines visible above/below the cursor when scrolling
set scrolloff=5
" Use smart case-sensitive search (case-insensitive unless uppercase letters are used)
set smartcase
" Enable automatic indentation
set autoindent
" Save undo history to an undo file
set undofile
" Enable command-line completion with a visual menu
set wildmenu
" Use 4 spaces for a tab, but softtab/shiftwidth to 2 for indentation
set tabstop=4 softtabstop=2 shiftwidth=2 expandtab
" Set the window title to the file name
set title
" Define the title string format
set titlestring=%f
" Enable mouse support in all modes
"set mouse=a


" 1. Define your custom highlight group for the normal mode cursor
" "    Replace 'White' and 'SteelBlue' with your desired colors.
"
" " 2. Tell Neovim to use this highlight group for the cursor in normal mode
" ('n')
" "    This will make Neovim send the hl_id for MyNormalCursor
" "    when in normal mode.
"set guicursor=n:MyNormalCursor
"
" " You can also customize other modes. For example, for insert mode:
" " highlight MyInsertCursor guifg=Black guibg=LightGreen
"set guicursor+=,i:MyInsertCursor-ver25 " ver25 creates a vertical bar

if has('autocmd')
  function! OpenHelpWindowOnTop()
    if !exists('w:help_is_moved') || w:help_is_moved !=# 'right'
      " Move help window to the right if it's not already there
      "wincmd L
      " Try to close the window below, if there is one
      let l:current_win = win_getid()
      wincmd j
      if win_getid() != l:current_win
        " Only close if there *was* a window below
        close
      endif
      " Return to original help window
      call win_gotoid(l:current_win)
      let w:help_is_moved = 'right'
    endif
  endfunction

  augroup vimrc_group
    autocmd!
    "autocmd FileType help call OpenHelpWindowOnTop()
  augroup END
endif

augroup vimrc_group
  au BufRead,BufNewFile *.applescript set filetype=applescript
augroup END

if !has('gui_running')
  "disable 'Background color erase'
  "set t_ut=
  "set t_Co=256

  "set termencoding=utf-8
  " Pressing F3 enables paste mode (disables auto-indent, etc., while pasting)
  "set pastetoggle=<F3>
  "set notermguicolors
  " The cursorline colors
  "highlight CursorLine ctermbg=234
  augroup vimrc_group
    "autocmd InsertEnter * highlight CursorLine ctermbg=17
    "autocmd InsertLeave * highlight CursorLine ctermbg=234
  augroup END

  "Change cursor shape between insert and normal mode in iTerm2.app
  if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  endif
endif

set background=dark

colorscheme catppuccin

" Apply custom JavaScript syntax highlighting overrides
augroup MyJavaScriptOverrides
  autocmd!
  autocmd FileType * call OverrideHighlights()
  autocmd FileType javascript call MyOverrideJSHighlighting()
augroup END

function! OverrideHighlights() abort
  hi clear WinSeparator
  hi WinSeparator guifg=#eeeeee gui=bold
  hi FloatBorder guifg=#eeeeee gui=bold
  hi Float guibg=#333b47
  hi clear Number
  hi link Number String
  hi link Statement Normal
  hi link Identifier Special
  hi link Constant String
  hi link Title Special
  hi link Type String
  hi link Function Special
  hi link PreProc Special
  hi link DiagnosticSignHint DiagnosticSignWarn
  hi link DiagnosticVirtualTextHint DiagnosticVirtualTextWarn
endfunction

function! MyOverrideJSHighlighting() abort
  hi clear Operator
  hi link Operator Special
  hi link javaScriptOperator Keyword
  hi link javaScriptNull String
  call CopyHighlightAttributes('PreProc', 'javaScriptBraces', 'bold')
  call CopyHighlightAttributes('Boolean', 'javaScriptParens', 'bold')
  hi link javaScriptBoolean String
endfunction

function! CopyHighlightAttributes(srcGroup, targetGroup, extraAttrs) abort
  " Get highlight attributes of the source group
  let l:attrs = execute('highlight ' . a:srcGroup)

  " Extract guifg, guibg, gui from the output
  let l:fg = matchstr(l:attrs, 'guifg=\zs#[0-9A-Fa-f]\+')
  let l:bg = matchstr(l:attrs, 'guibg=\zs#[0-9A-Fa-f]\+')
  let l:gui = matchstr(l:attrs, 'gui=\zs\S\+')

  " Fallbacks if not defined
  if l:fg == ''
    let l:fg = 'NONE'
  endif
  if l:bg == ''
    let l:bg = 'NONE'
  endif
  if l:gui == ''
    let l:gui = 'NONE'
  endif

  " Append extra attributes if provided
  if a:extraAttrs != ''
    let l:gui .= ',' . a:extraAttrs
  endif

  " Apply the highlight
  execute 'highlight ' . a:targetGroup . ' guifg=' . l:fg . ' guibg=' . l:bg . ' gui=' . l:gui
endfunction

set guioptions-=T  "remove toolbar
set guioptions-=t  "remove toolbar
set guioptions-=R  "remove right-hand scroll bar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions-=l  "remove left-hand scroll bar

highlight Cursor guifg=#000000 guibg=#db5cd1
" Customize the GUI cursor for normal, visual, and replace modes
set guicursor=n-v-r:block-blinkon300-blinkoff300-blinkwait300
" Customize the GUI cursor for insert mode (vertical bar)
set guicursor+=i:ver25-blinkon300-blinkoff300-blinkwait300

augroup vimrc_group
  autocmd Filetype codecompanion TSBufEnable highlight
augroup END

inoremap <C-d> <delete>
nnoremap <BS> :

tnoremap <Esc> <C-\><C-n>

let mapleader = "\<SPACE>"
let maplocalleader = "\<tab>"
nnoremap \ :b#<CR>

"<leader> mappings
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab
nnoremap <leader>l <C-l>
nnoremap <leader>q :wqa<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :wincmd p<CR>
nnoremap <leader>x :bd!<CR>

nnoremap <localleader>a :ActivateProject<CR>
nnoremap <localleader>o zO
" Comment a line in the filetype's apropriate way
augroup vimrc_group
  autocmd FileType applescript nnoremap <buffer> <localleader>c I--<esc>
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
  autocmd FileType vim     nnoremap <buffer> <localleader>c I"<esc>
  autocmd FileType lua     nnoremap <buffer> <localleader>c I--<esc>
augroup END

let g:copilot_no_tab_map = v:true
inoremap <F1> <Plug>(copilot-accept-word)
inoremap <silent><script><expr> <F2> copilot#Accept("")

nnoremap <F4> :HauntTerm -t scratch<CR>
nnoremap <f5> :RunProjectTask run<CR>
nnoremap <F8> :UpdateRemotePlugins<CR>

nnoremap <F13> :NvimTreeToggle<CR>

nnoremap <F14> :OutlineOpen<CR>
augroup vimrc_group
  autocmd FileType outline nnoremap <buffer> <silent> <F14> :OutlineClose<CR>
augroup END

nnoremap <F15> :Files<CR>

nnoremap <F16> :CodeCompanionChat Add<CR>
nnoremap <F17> :CodeCompanionChat Toggle<CR>

"CONTROL-KEY MOVEMENT"
cnoremap <C-j> <down>
cnoremap <C-k> <up>

inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" electric mappings
nnoremap <D-q> :QuitUI<CR>
nnoremap <D-n> :NewGuiWindow<CR>
" Map Cmd+C to yank selected text in visual mode
vnoremap <D-c> "+y

" Map Cmd+V to paste from system clipboard in insert and normal mode
inoremap <D-v> <C-r>+
nnoremap <D-v> "+gP

" Abbreviations
augroup vimrc_group
  autocmd FileType python     :iabbrev <buffer> iff if:<left>
  autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup END
