let g:tex_flavor='latex'
au BufNewFile,BufRead *.txt set filetype=text
au BufNewFile,BufRead *.py set filetype=python
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.tracwiki set filetype=tracwiki

let g:py_select_trailing_comments=0

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1

let g:vimim_shuangpin_microsoft=1
"let g:vimim_tab_for_one_key=1
imap <silent><C-L> <Plug>VimimChineseToggle

au InsertLeave * set timeoutlen=2000
au InsertEnter * set timeoutlen=20

set cursorline
if version > 700
    au InsertLeave * set nocursorcolumn
    au InsertEnter * set cursorcolumn
    " au InsertLeave * colorscheme desert256
    " au InsertEnter * colorscheme zenburn
endif


" Cannot set this in Terminal.APP, which will blink
if $TERM_PROGRAM != 'Apple_Terminal'
    set t_Co=256
endif

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

call pathogen#infect()

set paste
set ignorecase smartcase

set background=dark
colorscheme solarized

let NERDTreeIgnore=['\.meta$', '\.pyc$']
set wildignore+=*.meta

" Disable the automatic linebreak in markdown files
au FileType markdown set textwidth=0
" Disable all automatic linebreak
set textwidth=0

let g:plantuml_executable_script='plantuml-make'

" Multiple select plugin
" Not working yet
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='\<C-r>'
let g:multi_cursor_prev_key='\<C-l>'
let g:multi_cursor_skip_key='\<C-m>'
let g:multi_cursor_quit_key='\<Esc>'

" Use silver search over ack
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case --ignore=*.meta'

" for the window control of TabBar
let g:Tb_MaxSize = 0
" let g:Tb_MoreThanOne = 0
" let g:Tb_ModSelTarget = 1

" sync the nerdtree to current buffer if it's opened
" http://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
" returns true iff is NERDTree open/active
function! rc:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" returns true iff focused window is NERDTree window
function! rc:isNTFocused()
  return -1 != match(expand('%'), 'NERD_Tree')
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! rc:syncTree()
  if &modifiable && rc:isNTOpen() && !rc:isNTFocused() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufEnter * call rc:syncTree()

QuickfixsignsDisable

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    " set gfn=Anonymous\ Pro\ for\ Powerline:h20
    set gfn=Sauce\ Code\ Powerline:h20
  else
    " Do Linux stuff here
    let g:solarized_termcolors=16
    set gfn=Bitstream\ Vera\ Sans\ Mono\ 16
  endif
endif

"golint https://github.com/golang/lint
set rtp+=~/.go/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
