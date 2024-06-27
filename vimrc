call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/git-messenger.vim'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'luochen1990/rainbow'
Plug 'SirVer/ultisnips'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'janko/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/chrisbra/Colorizer.git'
Plug 'vimwiki/vimwiki'
Plug 'aserebryakov/vim-todo-lists'
Plug 'mbbill/undotree'
" Plug 'jiangmiao/auto-pairs'
Plug 'pbrisbin/vim-mkdir'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/gv.vim'
" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" JavaScript/TypeScript
Plug 'https://github.com/posva/vim-vue.git'
Plug 'https://github.com/pangloss/vim-javascript.git'

" colorschemes
Plug 'mhartington/oceanic-next'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/lifepillar/vim-gruvbox8.git'
Plug 'https://github.com/ajh17/Spacegray.vim.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'https://github.com/sainnhe/sonokai.git'
Plug 'https://github.com/jnurmine/Zenburn.git'
Plug 'https://github.com/chriskempson/tomorrow-theme.git'
Plug 'https://github.com/dracula/vim.git'
Plug 'ayu-theme/ayu-vim'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material.git'
Plug 'https://github.com/nanotech/jellybeans.vim.git'
Plug 'Brettm12345/moonlight.vim'
Plug 'ghifarit53/tokyonight.vim'
Plug 'franbach/miramare'
Plug 'sainnhe/gruvbox-material'
Plug 'ntk148v/vim-horizon'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'fratajczak/one-monokai-vim'
Plug 'https://github.com/catppuccin/vim.git'
Plug 'https://github.com/rebelot/kanagawa.nvim'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
set backspace=indent,eol,start
set background=dark
set termguicolors

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab " enter spaces when tab is pressed
" set textwidth=120 " break lines when line length increases
set tabstop=2 " use 2 spaces to represent tab
set softtabstop=4
set shiftwidth=2 " number of spaces to use for auto indent
set autoindent " copy indent from current line when starting a new line

" set colorcolumn=120 "visually indicate lines longer than 120 characters
" --------------------------------------------------------------------------------
" Mappings
" --------------------------------------------------------------------------------
let mapleader = ","

imap <c-e> <c-o>$
imap <c-a> <c-o>^
nmap <silent> // :nohlsearch<CR>
nmap <Leader>s  :%s/
" nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent>ds :call CocAction('jumpDefinition')<CR>
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)
map <silent><Leader>af :ALEFix eslint<CR>
map <leader>aj :ALENext<cr>
map <leader>ak :ALEPrevious<cr>
map <leader>ar :ALEResetBuffer<cr>
vmap <leader>as :sort<cr>
map <leader>cs :colorscheme <SPACE>
nmap <leader>dt :diffthis<cr>
nmap <leader>do :diffoff<cr>
map <leader>es :UltiSnipsEdit<cr>
map <leader>gw :Gwrite<CR>
map <leader>gc :Gcommit -m ""<LEFT>
map <leader>gs :Gstatus<CR>
map <leader>gb :Git blame<CR>
map <leader>gd :Gdiffsplit<SPACE>
map <leader>gh :GBrowse<CR>
map <silent><leader>gp :GBrowse!<CR>
" diff against branch n commits back
map <leader>gdb :Gdiffs !~
map <leader>gdd :Gdiffsplit main<CR>
map <leader>gdm :Gdiffsplit master<CR>
map <leader>gdp :Gdiffsplit prod<CR>
map <leader>gds :Gdiffsplit<CR>
map <Leader>j ddp
map <Leader>k ddkP
map <leader>n :NERDTreeToggle <CR>
" open current buffer in new tab
map <leader>nt :tabedit %<CR>
" Optional chaining - replace all `.` with `?.`
map <leader>oc :s/\%V\./?./g<CR>
" toggle relative number since it confuses
" people when pairing
map <leader>rn :tabdo windo set relativenumber!<CR>
map <leader>r :%s///g<LEFT><LEFT><LEFT>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <leader>ss :setlocal spell!<CR>
map <Leader>sv :so $MYVIMRC<CR>
map <leader>tn :TestNearest<CR>
map <leader>tf :TestFile<CR>
map <leader>ts :TestSuite<CR>
map <leader>tl :TestLast<CR>
map <leader>tg :TestVisit<CR>
" open current file in new vertical buffer
nnoremap <leader>v <C-w>v
map <Leader>w <C-w>w
" nmap Y y$
map <leader>y ggVGy<cr>
map <leader>// :FZF<CR>
map <leader>/, :CtrlSF<SPACE>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
"map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <leader>h <C-w>s
" open vimrc/init.vim
nnoremap <silent> <leader>ev :e ~/.vimrc<CR>
" Jump to matching pairs easily, with Tab
" nnoremap <Tab> %

" increment numbers
noremap + <c-a>
noremap - <c-x>
" https://twitter.com/rixcy/status/1416848280101736454
" replace words with vim-abolish
vnoremap <C-r> "hy:%Subvert/<C-r>h//gc<left><left><left>
" jump to
" nnoremap <silent> <Space><Space> /++/<CR> ciw
nnoremap <silent> <Space><Space> /++/<CR>

" fat finger saving or quiting
" command W w " make :W behave like :w
" command Q q " make :Q behave like :q

map Q <Nop>
" command GGF GitGutterFold

" --------------------------------------------------------------------------------
" Autocmds
" --------------------------------------------------------------------------------
" Delete trailing spaces/whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" auto run python files on save
" autocmd BufWritePost *.py silent! bd \!python3\ * | vert term python3 %
"
" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
"
" set .snap files as jsx
autocmd BufNewFile,BufRead *.snap set filetype=jsx


autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" --------------------------------------------------------------------------------
" General settings
" --------------------------------------------------------------------------------
set number " enable line numbers
set relativenumber " enable relative number (numbers change based on where the cursor is)
set undofile " Persistent undo
set incsearch " search as characters are entered
set hlsearch " highlight matches
set guioptions= " Remove scrollbars in macvim
set splitbelow " open all horizontal buffers below current one
set splitright "open all vertical buffers to the right of the current one
" set cursorcolumn " highlight column of cursor
" set cursorline " highlight row of cursor
set showmatch " highlight matching brace/backet when cursor over
set scrolloff=5 " keep cursor away from top/bottom
set ignorecase " ignore case if search pattern is all lowercase
set smartcase " don't ignore case if start with capital
" same as above but apply to super star as well
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" set paste " don't auto indent pasted code
set guifont=Inconsolata\ Nerd\ Font:h14 " font-name:pxSize
set clipboard=unnamed " use system clipboard for copy/paste
set encoding=UTF-8
set showcmd " display incomplete commands
set lazyredraw " don't redraw screen during macros
set ttyfast " trying to improve nvim speed
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
" set termwinsize=20x0 " make term buffer size 20 rows tall
syntax enable " enable syntax highlighting

filetype plugin indent on " turns on plugin, indent, detection
set t_Co=256
colorscheme embark " colorscheme

" no swap files
set noswapfile
set noundofile
set nobackup
set nowb

" default diffs to vertical instead of horizontal
set diffopt+=vertical

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" --------------------------------------------------------------------------------
" Movement
" --------------------------------------------------------------------------------
" navigate buffers easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" navigate terminal buffers easier
tnoremap <C-h> <C-w>h
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-l> <C-w>l

" makes spacebar behave like <C-d>
" nnoremap <Space> <C-d>zz

" makes shift+spacebar behave like <C-u>
" nnoremap <S-Space> <C-u>zz

" no more skipping lines due to wrapping (doesn't work with relative number)
" nmap k gk
" nmap j gj

" --------------------------------------------------------------------------------
" Tagbar config
" --------------------------------------------------------------------------------
" not sure what this does lol
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 0
let g:tagbar_indent = 2
let g:tagbar_iconchars = ['+', '-']
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

set tags=tags " I _think_ this is for tagbar?

" --------------------------------------------------------------------------------
" Statusbar
" --------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
" let g:airline_theme= 'gruvbox'

set laststatus=2 "always display statusbar

" --------------------------------------------------------------------------------
" NERDTree config
" --------------------------------------------------------------------------------
" open folder/file with spacebar in NERDTree
let NERDTreeMapActivateNode='<space>'

" start nerdtree with minimalui
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face
let NERDTreeIgnore = ['.git$', '^node_modules']

" --------------------------------------------------------------------------------
" Limelight config
" --------------------------------------------------------------------------------
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240

" --------------------------------------------------------------------------------
" indent-guide config
" --------------------------------------------------------------------------------
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" --------------------------------------------------------------------------------
" FZF floating window for nvim
" --------------------------------------------------------------------------------
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(40) " 10 -> 20
  let width = float2nr(120) " 80
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" --------------------------------------------------------------------------------
" conflict-marker
" --------------------------------------------------------------------------------
" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

" --------------------------------------------------------------------------------
" Ultisnips
" --------------------------------------------------------------------------------
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" --------------------------------------------------------------------------------
" ctrlsf
" --------------------------------------------------------------------------------
let g:ctrlsf_auto_focus = {
    \ 'at': 'start',
    \ }

let g:ctrlsf_mapping = {
    \ "vsplit": "<C-v>",
    \ }

" --------------------------------------------------------------------------------
" vim-test config
" --------------------------------------------------------------------------------
" Experimenting replacing these with leader commands
" nmap <silent> t<C-n> :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

" --------------------------------------------------------------------------------
" CoC config.
" --------------------------------------------------------------------------------
let g:coc_global_extensions = ['coc-tsserver']

" Use <CR> to trigger completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" --------------------------------------------------------------------------------
" rainbow config
" --------------------------------------------------------------------------------
" enable rainbow parens
let g:rainbow_active = 1

" --------------------------------------------------------------------------------
" Misc.
" --------------------------------------------------------------------------------
" Ignore default colorschemes when tabbing through list
set wildignore+=blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,
      \elflord.vim,evening.vim,industry.vim,koehler.vim,morning.vim,murphy.vim,
      \pablo.vim,peachpuff.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim

set wildmode=list:longest,full
" Not sure why the below is recommended, should look into later
" set wildmenu
" set wildmode=list:longest,full

" no one should have to resize without a mouse
if has('mouse')
  set mouse=a
endif

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if has('nvim')
  augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert

    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  augroup END
endif

" bring the cursor in the middle of screen
" execute "normal M"

" bring back q to close fugitiveblame window
autocmd FileType fugitiveblame nmap <buffer> q gq
"
" same as above but apply to super star as well
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>


" Only highlight active buffer lines
augroup BgHighlight
autocmd!
autocmd WinEnter * set cul
autocmd WinLeave * set nocul
augroup END

" spell check and automatically wrap commit messages.
autocmd Filetype gitcommit setlocal spell textwidth=72

" autocompile .tex
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

" stop plugins from mucking with the `global` flag
set nogdefault

set rtp+=/usr/local/opt/fzf
