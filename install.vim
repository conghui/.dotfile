" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" setup"{{{
set nocompatible
set all& "reset everything to their defaults
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.dotfile/gundle/'))
"}}}
" functions"{{{
function! EnsureExists(path) "{{{
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction
"}}}
function! MakeSoftLink(true, soft) "{{{
  echomsg "[Done]: linking " . expand(a:true) . " to " . expand(a:soft)
  call system("rm -f " . expand(a:soft))
  call system("ln -s " . expand(a:true) . " " . expand(a:soft))
endfunction
"}}}
function! LinkFile(true, soft) "{{{
  try
    let succeeded = 1
    if filereadable(expand(a:true))
      call MakeSoftLink(a:true, a:soft)
    elseif isdirectory(expand(a:true))
      call MakeSoftLink(a:true, a:soft)
    else
      echoerr "Error: " . expand(a:true) . " doesn't exist"
    endif
  finally
  endtry
endfunction
"}}}
"}}}

let linking_files = [
    \     ['git/gitconfig',     '.gitconfig'],
    \     ['vim',               '.vim'],
    \     ['vim/vimrc',         '.vimrc'],
    \     ['/tmux/tmux.conf',   '.tmux.conf'],
    \     ['zsh/aliases.sh',    '.aliases.sh'],
    \     ['zsh/vars.sh',       '.vars.sh'],
    \     ['python/pystartup',  '.pystartup'],
    \]

" link linking_files for loop "{{{
for file in linking_files
  let true = '$DOTFILE_ROOT/' . file[0]
  let soft = '~/' . file[1]

  call LinkFile(true, soft)

endfor
"}}}

" add your plugin here
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle      'tmux-plugins/tmux-yank'
NeoBundle      'seebi/dircolors-solarized'
NeoBundle      'conghui/iterm2-color-solarized'
NeoBundle      'Anthony25/gnome-terminal-colors-solarized'

" vimproc "{{{
NeoBundle       'Shougo/vimproc.vim', {
  \ 'build': {
    \ 'mac': 'make -f make_mac.mak',
    \ 'unix': 'make -f make_unix.mak',
    \ 'cygwin': 'make -f make_cygwin.mak',
    \ 'windows': '"C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\nmake.exe" make_msvc32.mak',
  \ },
\ }
"}}}
" gdb"{{{
NeoBundle      'gdbinit/Gdbinit'
  call LinkFile('$DOTFILE_BUNDLE_ROOT/Gdbinit/gdbinit', '~/.gdbinit')
"}}}
" ssh"{{{
for f in split(globpath('$DOTFILE_ROOT/ssh', '*'), '\n')
  let soft = expand("~/.ssh/" . substitute(f, ".*/", "", ""))

  call system('chmod 600 ' . f)
  call system('chmod 700 ~/.ssh')
  call LinkFile(f, soft)
endfor
"}}}
" terminator-solarized"{{{
NeoBundle      'ghuntley/terminator-solarized'
  call EnsureExists('~/.config/terminator')
  call LinkFile('$DOTFILE_BUNDLE_ROOT/terminator-solarized/config','~/.config/terminator/config')
"}}}
" zprezto & zsh"{{{
NeoBundle      'sorin-ionescu/prezto', {'name' : 'zprezto'}
  call LinkFile('$DOTFILE_BUNDLE_ROOT/zprezto', '~/.zprezto')
  call LinkFile('$ZSH_ROOT/zpreztorc', '~/.zpreztorc')

  let old_wig = &wig
  set wig=*.md,zshrc

  for f in split(globpath('~/.zprezto/runcoms', '*'), '\n')
    let soft = expand("~/." . substitute(f, ".*/", "", ""))
    call LinkFile(f, soft)
  endfor

  set wig=&old_wig

  call LinkFile('$ZSH_ROOT/zshrc.zsh', '~/.zshrc')
"}}}


" finish"{{{
call neobundle#end()
NeoBundleCheck
"}}}
