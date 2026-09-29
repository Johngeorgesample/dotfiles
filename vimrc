call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/git-messenger.vim'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'luochen1990/rainbow'
Plug 'SirVer/ultisnips'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'janko/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/chrisbra/Colorizer.git'
Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier'
Plug 'junegunn/gv.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'mbbill/undotree'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ellisonleao/glow.nvim'

" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" JavaScript/TypeScript
Plug 'https://github.com/posva/vim-vue.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'herringtondarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
" Elixir
Plug 'elixir-editors/vim-elixir'

" LaTeX
Plug 'lervag/vimtex'

" jsonnet
Plug 'google/vim-jsonnet'

" colorschemes
Plug 'Luxed/ayu-vim'
Plug 'haishanh/night-owl.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material.git'
Plug 'junegunn/seoul256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/catppuccin/vim'
Plug 'https://github.com/rebelot/kanagawa.nvim'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" Show concealed markup using replacement characters (for example, VimTeX symbols).
set conceallevel=1
let g:tex_conceal='abdmg'

let g:coc_disable_startup_warning = 1

" fix ultisnips from sucking
:let g:python3_host_prog = expand('~/.venvs/nvim/bin/python3')

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab " enter spaces when tab is pressed
set textwidth=120 " break lines when line length increases
set tabstop=4 " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4 " number of spaces to use for auto indent
set autoindent " copy indent from current line when starting a new line
set backspace=indent,eol,start
set background=dark
set termguicolors

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
map <leader>aa :botright new \| terminal claude<cr>i
nnoremap <leader>cc :silent !tmux split-window -h -l 25\% "claude"<CR>
" nnoremap <leader>cf :call system('echo ' . expand('%:p') . ' > /tmp/vim_current_file') \| silent !tmux split-window -h -l 25\% "claude \"@$(cat /tmp/vim_current_file)\""<CR>
" nnoremap <leader>cf :call system('tmux split-window -h -l 25% claude \; send-keys -l ' . shellescape('@' . expand('%:p') . ' '))<CR>
" Copy the current buffer’s path to your clipboard
nmap <silent>cp :let @+ = expand('%:p')<CR>
nmap <silent>gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent>ds :call CocAction('jumpDefinition')<CR>
" nmap <silent>ds <Plug>(coc-definition)
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
" diff against the PR's base branch, falling back to the repo default branch
function! GdiffBaseBranch()
  let base = trim(system('gh pr view --json baseRefName --jq .baseRefName 2>/dev/null'))
  if v:shell_error || empty(base)
    let base = substitute(trim(system('git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null')), '^origin/', '', '')
  endif
  if empty(base)
    let base = 'main'
  endif
  call system('git rev-parse --verify --quiet ' . shellescape(base))
  if v:shell_error
    let base = 'origin/' . base
  endif
  execute 'Gdiffsplit ' . base
endfunction
nnoremap <silent> <leader>gdb :call GdiffBaseBranch()<CR>
map <leader>gdd :Gdiffsplit main<CR>
map <leader>gdm :Gdiffsplit main<CR>
map <leader>gdp :Gdiffsplit prod<CR>
map <leader>gds :Gdiffsplit<CR>
map <Leader>j ddp
map <Leader>k ddkP
map <leader>n :NERDTreeToggle <CR>
map <leader>nt :tabedit %<CR>
" Optional chaining - replace all `.` with `?.`
map <leader>oc :s/\%V\./?./g<CR>
map <leader>r :%s///g<LEFT><LEFT><LEFT>
map <leader>ss :setlocal spell!<CR>
map <leader>sj :syntax=javascript<CR>
map <Leader>sv :so $MYVIMRC<CR>
" Replacing with t prefix tree
" map <leader>t :TestFile<CR>
map <leader>tn :TestNearest<CR>
map <leader>tf :TestFile<CR>
map <leader>ts :TestSuite<CR>
map <leader>tl :TestLast<CR>
map <leader>tg :TestVisit<CR>

" open current file in new vertical buffer
nnoremap <leader>v <C-w>v
nmap Y y$

map <leader>// :GFiles<CR>
map <leader>/f :FZF<CR>
map <leader>/, :CtrlSF<SPACE>
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
"map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" open vimrc in new buffer
nnoremap <silent> <leader>ev <C-w>v :e ~/.vimrc<CR>

" open claude.md in new buffer
nnoremap <silent> <leader>ec <C-w>v :e ~/.claude/CLAUDE.md<CR>

map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>w <C-w>w
map <leader>y ggVGy<cr>
nnoremap <leader>h <C-w>s

" Jump to matching pairs easily, with Tab
nnoremap <Tab> %

" fat finger saving or quiting
command W w " make :W behave like :w
command Q q " make :Q behave like :q

map Q <Nop>

command GGF GitGutterFold

" Toggle the gutter's diff base between `main` (whole-branch changes) and the
" default HEAD/index (uncommitted changes, with hunk staging available).
function! ToggleGitGutterBase()
  if get(g:, 'gitgutter_diff_base', '') ==# 'main'
    let g:gitgutter_diff_base = ''
    echo 'GitGutter: diffing against HEAD/index'
  else
    let g:gitgutter_diff_base = 'main'
    echo 'GitGutter: diffing against main'
  endif
  GitGutterAll
endfunction
nnoremap <silent> <leader>gg :call ToggleGitGutterBase()<CR>
" --------------------------------------------------------------------------------
" Autocmds
" --------------------------------------------------------------------------------
" Delete trailing spaces/whitespace on save
" autocmd BufWritePre * %s/\s\+$//e

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
"set guifont=Inconsolata\ Nerd\ Font:h14 " font-name:pxSize
set guifont=Berkeley\ Mono
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
colorscheme hybrid_reverse


autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

autocmd FileType typescript.tsx setlocal commentstring={/*\ %s\ */}

" no swap files
set noswapfile
set noundofile
set nobackup
set nowb

" default diffs to vertical instead of horizontal
set diffopt+=vertical

" Display extra whitespace
set list listchars=tab:»·,trail:·
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
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" Ignore default colorschemes when tabbing through list
set wildignore+=blue.vim,darkblue.vim,default.vim,delek.vim,desert.vim,
      \elflord.vim,evening.vim,industry.vim,koehler.vim,morning.vim,murphy.vim,
      \pablo.vim,peachpuff.vim,ron.vim,shine.vim,slate.vim,torte.vim,zellner.vim

let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! AddGrafanaStyle()
  " Prompt for the style name
  let styleName = input('Style name: ')
  if empty(styleName)
    return
  endif

  " Save current position
  let curPos = getpos('.')

  " Insert className at cursor
  execute "normal! i className={styles." . styleName . "}"

  " Search backwards for getStyles and find the closing });
  let getStylesLine = search('const getStyles', 'bnW')
  if getStylesLine == 0
    echo "\nCouldn't find getStyles"
    return
  endif

  " Find the closing }); of getStyles by searching for => ({ and matching
  call cursor(getStylesLine, 1)
  call search('=> ({', 'W')
  normal! f(
  normal! %

  " We're now on the closing }); - go up one line and add the new style
  let insertLine = line('.') - 1

  " Build the new style block
  let indent = '  '
  let newStyle = [
    \ indent . styleName . ": css({",
    \ indent . indent . "",
    \ indent . "}),"
    \ ]

  " Insert the new style
  call append(insertLine, newStyle)

  " Position cursor inside the new css block for immediate editing
  call cursor(insertLine + 2, len(indent . indent) + 1)
  startinsert
endfunction

nnoremap <leader>as :call AddGrafanaStyle()<CR>

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


let test#strategy = "neovim"
let test#javascript#runner = 'vitest'
let test#javascript#vitest#enabled = 1
let test#javascript#vitest#pattern = '\v.*\.test\.(tsx|ts)$'

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
" Glow
" --------------------------------------------------------------------------------
" glow.nvim pipes glow's output into the preview; without this, glow sees a
" non-tty and strips its styling
let $CLICOLOR_FORCE = 1
lua require('glow').setup({ style = vim.env.HOME .. '/.config/glow/nvim-style.json' })

" --------------------------------------------------------------------------------
" life with Claude
" --------------------------------------------------------------------------------

" automatically reload when file changes on disk
set autoread
au FocusGained,BufEnter * checktime

" autocmd BufWritePre * silent! execute '!cp ' . expand('%:p') . ' ' . expand('%:p') . '.bak'
" map <leader>gdl :vert diffsplit %:p.bak<CR>

" --------------------------------------------------------------------------------
" Misc.
" --------------------------------------------------------------------------------
set wildmode=list:longest,full

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

" Only highlight active buffer lines
augroup BgHighlight
autocmd!
autocmd WinEnter * set cul
autocmd WinLeave * set nocul
augroup END

" spell check and automatically wrap commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" autocompile .tex
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

" stop plugins from mucking with the `global` flag
set nogdefault


function! ClaudeCurrentFile() abort
    let l:mention = shellescape('@' . expand('%:p') . ' ')
    let l:cmd = 'pane=$(tmux split-window -h -l 25% -P -F "#{pane_id}" claude); '
          \ . '(for i in $(seq 1 100); do '
          \ .   'tmux capture-pane -t $pane -p 2>/dev/null | grep -q "❯" && break; sleep 0.1; '
          \ . 'done; '
          \ . 'tmux send-keys -t $pane -l ' . l:mention . ') >/dev/null 2>&1 &'
    call system(l:cmd)
  endfunction
  nnoremap <leader>cf :call ClaudeCurrentFile()<CR>


 function! PiCurrentFile() abort
     let l:mention = shellescape('@' . expand('%:p') . ' ')
     let l:cmd = 'pane=$(tmux split-window -h -l 25% -P -F "#{pane_id}" pi); ' .
           \ '(for i in $(seq 1 100); do ' .
           \   'tmux capture-pane -t $pane -p 2>/dev/null | grep -q "." && break; sleep 0.1; ' .
           \ 'done; sleep 0.2; ' .
           \ 'tmux send-keys -t $pane -l ' . l:mention . ') >/dev/null 2>&1 &'
     call system(l:cmd)
   endfunction
   nnoremap <leader>pf :call PiCurrentFile()<CR>
