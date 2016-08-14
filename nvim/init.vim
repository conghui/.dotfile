" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

"dein setup -----------------------------"{{{
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=$DOTFILE_BUNDLE_ROOT/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('$DOTFILE_BUNDLE_ROOT'))

" Required:
filetype plugin indent on

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
"}}}
" functions {{{
  function! s:get_cache_dir(suffix) "{{{
    return resolve(expand(s:cache_dir . '/' . a:suffix))
  endfunction "}}}
  function! EnsureExists(path) "{{{
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path))
    endif
  endfunction "}}}
  function! Preserve(command) "{{{
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    execute a:command
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction "}}}
  function! StripTrailingWhitespace() "{{{
    call Preserve("%s/\\s\\+$//e")
  endfunction "}}}
"}}}
" default settings {{{
  let s:settings                     = {}
  let s:cache_dir                    = "~/.cache/vim"
  let s:is_macvim                    = has('gui_macvim')
  let s:settings.default_indent      = 2
  let s:settings.enable_colorcolumn  = 0
  let s:settings.max_column          = 120
  let s:settings.enable_cursorcolumn = 0
"}}}
" base configuration {{{
  syntax on
  set timeoutlen=300                                  "mapping timeout
  set ttimeoutlen=50                                  "keycode timeout

  set mouse=a                                         "enable mouse
  set mousehide                                       "hide when characters are typed
  set history=1000                                    "number of command lines to remember
  set ttyfast                                         "assume fast terminal connection
  set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
  set encoding=utf-8                                  "set encoding for text
  set fencs=utf-8,gbk
  if exists('$TMUX')
    set clipboard=
  else
    set clipboard=unnamed                             "sync with OS clipboard
  endif
  set hidden                                          "allow buffer switching without saving
  set autoread                                        "auto reload if file saved externally
  set fileformats+=mac                                "add mac to auto-detection of file format line endings
  set nrformats-=octal                                "always assume decimal numbers
  set showcmd
  set tags=tags;/
  set showfulltag
  set modeline
  set modelines=5
  set completeopt-=preview

  if $SHELL =~ '/fish$'
    " VIM expects to be run from a POSIX shell.
    set shell=sh
  endif

  set noshelltemp                                     "use pipes

  " whitespace
  set backspace=indent,eol,start                      "allow backspacing everything in insert mode
  set autoindent                                      "automatically indent to match adjacent lines
  set expandtab                                       "spaces instead of tabs
  set smarttab                                        "use shiftwidth to enter tabs
  let &tabstop=s:settings.default_indent              "number of spaces per tab for display
  let &softtabstop=s:settings.default_indent          "number of spaces per tab in insert mode
  let &shiftwidth=s:settings.default_indent           "number of spaces when indenting
  set list                                            "highlight whitespace
  set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
  set shiftround
  set linebreak
  let &showbreak='↪ '

  set scrolloff=1                                     "always show content after scroll
  set scrolljump=5                                    "minimum number of lines to scroll
  set display+=lastline
  set wildmenu                                        "show list for autocomplete
  set wildmode=list:full
  set wildignorecase

  "set splitbelow
  set splitright

  " disable sounds
  set noerrorbells
  set novisualbell
  set t_vb=

  " set text width
  set tw=0

  " searching
  set hlsearch                                        "highlight searches
  set incsearch                                       "incremental searching
  set ignorecase                                      "ignore case for searching
  set smartcase                                       "do case-sensitive if there's a capital letter
  if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
  endif
  if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
  endif

  " vim file/folder management {{{
    " persistent undo
    if exists('+undofile')
      set undofile
      let &undodir = s:get_cache_dir('undo')
    endif

    " backups
    set backup
    let &backupdir = s:get_cache_dir('backup')

    " swap files
    let &directory = s:get_cache_dir('swap')
    set noswapfile

    call EnsureExists(s:cache_dir)
    call EnsureExists(&undodir)
    call EnsureExists(&backupdir)
    call EnsureExists(&directory)
  "}}}

  let mapleader = ","
  let g:mapleader = ","
"}}}
" ui configuration {{{
  set background=dark
  colorscheme solarized
  set showmatch                                       "automatically highlight matching braces/brackets/etc.
  set matchtime=2                                     "tens of a second to show matching parentheses
  set number
  set lazyredraw
  set laststatus=2
  set noshowmode
  set foldenable                                      "enable folds by default
  set foldlevelstart=99                               "open all folds by default

  set cursorline
  autocmd WinLeave * setlocal nocursorline
  autocmd WinEnter * setlocal cursorline

  if s:settings.enable_colorcolumn
    let &colorcolumn=s:settings.max_column
  endif

  if s:settings.enable_cursorcolumn
    set cursorcolumn
    autocmd WinLeave * setlocal nocursorcolumn
    autocmd WinEnter * setlocal cursorcolumn
  endif

  if has('conceal')
    set conceallevel=1
    "set listchars+=conceal:Δ
  endif

  if has('gui_running')
    if s:is_macvim
      set guifont=Meslo_LG_S_DZ_Regular_for_Powerline:h13
    elseif has('gui_gtk')
      set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 13
    endif
  else
    if $COLORTERM == 'gnome-terminal'
      set t_Co=256 "why you no tell me correct colors?!?!
    endif
    if $TERM_PROGRAM == 'iTerm.app'
      " different cursors for insert vs normal mode
      if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
      endif
    endif
  endif
"}}}
" Plugin: syntax  & colorscheme"{{{
  call dein#add('tpope/vim-markdown')
  call dein#add('vim-scripts/scons.vim')
  call dein#add('artoj/qmake-syntax-vim')
  call dein#add('vim-scripts/STL-Syntax')
  call dein#add('vim-scripts/gnuplot.vim')
  call dein#add('vim-scripts/wombat256.vim')
  call dein#add('vim-scripts/DoxyGen-Syntax')
  call dein#add('ekalinin/Dockerfile.vim')
  call dein#add('vim-scripts/fortran.vim')
  call dein#add('altercation/vim-colors-solarized') "{{{
  "let g:solarized_termcolors=256
  "let g:solarized_termtrans=1
  "}}}
"}}}
" Plugin: better user experience"{{{
    call dein#add('matchit.zip')
    call dein#add('powerline/fonts')
    call dein#add('tpope/vim-endwise')
    call dein#add('vim-scripts/makeprgs')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('nacitar/terminalkeys.vim')
    call dein#add('DoxygenToolkit.vim') "{{{
      au BufNewFile,BufRead *.doxygen setfiletype doxygen
      let g:doxygen_enhanced_color=0
      let g:doxygen_my_rendering=0
      let g:doxygen_javadoc_autobrief=1
      let g:doxygen_end_punctuation='[.]'
      let g:doxygenErrorComment=0
      let g:doxygenLinkError=0
      let g:DoxygenToolkit_authorName="Conghui He"
      map <F9> :Dox<cr>
      imap <F9> <Esc>:Dox<cr>
    "}}}
"}}}
" Add or remove your plugins here:
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('honza/vim-snippets')
    call dein#add('Valloric/ListToggle')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('terryma/vim-expand-region')
    call dein#add('thinca/vim-quickrun')
    call dein#add('vim-scripts/BufOnly.vim')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('lfv89/vim-interestingwords')
    call dein#add('SirVer/ultisnips') "{{{
      let g:UltiSnipsExpandTrigger="<tab>"
      let g:UltiSnipsJumpForwardTrigger="<tab>"
      let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
      let g:UltiSnipsSnippetsDir='~/.vim/snippets'
    "}}}
    call dein#add('junegunn/vim-easy-align') "{{{
      " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
      vmap <Enter> <Plug>(EasyAlign)
      " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
      nmap <Leader>a <Plug>(EasyAlign)
    "}}}
    call dein#add('MattesGroeger/vim-bookmarks') "{{{
      let g:bookmark_auto_close = 1
      let g:bookmark_save_per_working_dir = 1
      let g:bookmark_auto_save = 1
    "}}}
    call dein#add('Shougo/deoplete.nvim', {'if': 'has("nvim")'}) "{{{
    let g:deoplete#enable_at_startup = 1
    "}}}
    call dein#add('Shougo/neocomplete.vim',{'if': 'has("lua")'} ) "{{{
    let g:neocomplete#enable_at_startup = 1
    "}}}
    call dein#add('jcf/vim-latex') "{{{
      set shellslash
      set grepprg=grep\ -nH\ $*

      let g:tex_flavor                 = 'latex'
      let g:Tex_DefaultTargetFormat    = 'pdf'
      let g:Tex_CompileRule_pdf        = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
      let g:Tex_MultipleCompileFormats = 'pdf,bib,pdf'

      " It's a Mac!
      if has("unix") && match(system("uname"),'Darwin') != -1
        let g:Tex_ViewRule_pdf = 'Skim'
      endif
    "}}}
    call dein#add('jiangmiao/auto-pairs') "{{{
      au Filetype * let b:AutoPairs = {'{':'}'}
    "}}}
    call dein#add('justinmk/vim-sneak') "{{{
      let g:sneak#streak = 1
    "}}}
    call dein#add('bling/vim-airline') "{{{
      call dein#add('vim-airline/vim-airline-themes')
      let g:airline_powerline_fonts = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '¦'
      let g:airline#extensions#tabline#buffer_idx_mode = 1
      nmap <leader>1 <Plug>AirlineSelectTab1
      nmap <leader>2 <Plug>AirlineSelectTab2
      nmap <leader>3 <Plug>AirlineSelectTab3
      nmap <leader>4 <Plug>AirlineSelectTab4
      nmap <leader>5 <Plug>AirlineSelectTab5
      nmap <leader>6 <Plug>AirlineSelectTab6
      nmap <leader>7 <Plug>AirlineSelectTab7
      nmap <leader>8 <Plug>AirlineSelectTab8
      nmap <leader>9 <Plug>AirlineSelectTab9
    "}}}
    call dein#add('nathanaelkane/vim-indent-guides') "{{{
      let g:indent_guides_start_level=1
      let g:indent_guides_guide_size=1
      let g:indent_guides_enable_on_vim_startup=0
      let g:indent_guides_color_change_percent=3
      if !has('gui_running')
        let g:indent_guides_auto_colors=0
        function! s:indent_set_console_colors()
          hi IndentGuidesOdd ctermbg=235
          hi IndentGuidesEven ctermbg=236
        endfunction
        autocmd VimEnter,Colorscheme * call s:indent_set_console_colors()
      endif
    "}}}
    call dein#add('tpope/vim-fugitive') "{{{
      nnoremap <silent> <leader>gs :Gstatus<CR>
      nnoremap <silent> <leader>gd :Gdiff<CR>
      nnoremap <silent> <leader>gc :Gcommit<CR>
      nnoremap <silent> <leader>gb :Gblame<CR>
      nnoremap <silent> <leader>gl :Glog<CR>
      nnoremap <silent> <leader>gp :Git push<CR>
      nnoremap <silent> <leader>gw :Gwrite<CR>
      nnoremap <silent> <leader>gr :Gremove<CR>
      autocmd BufReadPost fugitive://* set bufhidden=delete
    "}}}
    call dein#add ('gregsexton/gitv', {'on_cmd':'Gitv'}) "{{{
      nnoremap <silent> <leader>gv :Gitv<CR>
      nnoremap <silent> <leader>gV :Gitv!<CR>
    "}}}
    call dein#add('derekwyatt/vim-fswitch') "{{{
      nmap <silent> <Leader>of :FSHere<cr>
      nmap <silent> <Leader>oh :FSSplitLeft<cr>
      nmap <silent> <Leader>ol :FSSplitRight<cr>
      nmap <silent> <Leader>ok :FSSplitAbove<cr>
      nmap <silent> <Leader>oj :FSSplitBelow<cr>
    "}}}
    call dein#add('Shougo/unite.vim') "{{{
      call dein#add('thinca/vim-unite-history')
      call dein#add('Shougo/neomru.vim')
      call dein#add('Shougo/unite-outline')
      call dein#add('Shougo/unite-help')
      call dein#add('Shougo/neoyank.vim')
      call dein#add('ujihisa/unite-colorscheme')

      call unite#filters#matcher_default#use(['matcher_fuzzy'])
      call unite#filters#sorter_default#use(['sorter_rank'])
      call unite#custom#profile('default', 'context', {
            \ 'start_insert': 1
            \ })

      let g:unite_data_directory=s:get_cache_dir('unite')
      let g:unite_source_history_yank_enable=1
      let g:unite_source_rec_max_cache_files=200

      if executable('ag')
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_recursive_opt = ''
      elseif executable('ack')
        let g:unite_source_grep_command='ack'
        let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
        let g:unite_source_grep_recursive_opt=''
      endif

      function! s:unite_settings()
        nmap <buffer> <esc> <plug>(unite_exit)
        imap <buffer> <esc> <plug>(unite_exit)
        imap <buffer> <C-j> <Plug>(unite_select_next_line)
        imap <buffer> <C-k> <Plug>(unite_select_previous_line)
      endfunction
      autocmd FileType unite call s:unite_settings()

      nmap <space> [unite]
      nnoremap [unite] <nop>

      nnoremap <silent> [unite]r :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
      nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file<cr><c-u>
      nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
      nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
      nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
      nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
      nnoremap <silent> [unite]/ :<C-u>Unite -auto-resize -buffer-name=search grep:.<cr>
      nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
      nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
      nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands -default-action=execute history/command command<CR>
      nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
      nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>

  "}}}
 " mappings {{{
  if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
  endif

  noremap    <c-a>   ggVG
  inoremap    <c-v>   <c-o>:set paste<cr><c-r>+<c-o>:set nopaste<cr>
  xnoremap    <c-c>   "+y
  xnoremap    <c-x>   "+x

  " [Basically you press * or # to search for the current selection !! Really useful]
  vnoremap    <silent> *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
  vnoremap    <silent> #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

  " [CTRL-hjkl to browse command history and move the cursor]
  cnoremap    <c-k>   <up>
  cnoremap    <c-j>   <down>
  cnoremap    <c-h>   <left>
  cnoremap    <c-l>   <right>

  " [Easy indent in visual mode]
  xnoremap    <   <gv
  xnoremap    >   >gv

  " [Up down move]
  nnoremap    j       gj
  nnoremap    k       gk
  nnoremap    gj      j
  nnoremap    gk      k

  " [Misc]
  nnoremap    J       gJ
  nnoremap    gJ      J
  nnoremap    -       _
  nnoremap    _       -

  " no Highlight search"
  nmap <leader>, :nohlsearch<cr>

  " [Spell checking]"
  map <leader>se :setlocal spell spelllang=en_us<cr>
  map <leader>sn :setlocal nospell<cr>

"}}}
" Autocmd: "{{{
  " go back to previous position of cursor if any
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \  exe 'normal! g`"zvzz' |
    \ endif

  autocmd FileType markdown setlocal nolist
  autocmd FileType vim setlocal fdm=indent keywordprg=:help

  " scons filetype
  autocmd BufRead,BufNewFile SConstruct    set filetype=python
  autocmd BufRead,BufNewFile SConscript    set filetype=python

  " cuda filetype file
  au BufRead,BufNewFile *.cu,*.cuda   set filetype=cpp

  " maxj file type
  autocmd BufRead,BufNewFile *.maxj    set filetype=java

  autocmd BufRead,BufNewFile gitconfig set filetype=gitconfig

  " remove (strip) whitespace at the end of lines when saving
  autocmd! BufWritePre <buffer> :call StripTrailingWhitespace()
"}}}
" install on vim startup "{{{
if dein#check_install()
  call dein#install()
endif
"}}}
" remove unused plugins"{{{
"call map(dein#check_clean(), "delete(v:val, 'rf')")
"}}}
"End dein Scripts-------------------------"{{{
call dein#end()
"}}}
