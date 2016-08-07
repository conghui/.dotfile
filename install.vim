" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

" setup"{{{
set nocompatible
set all& "reset everything to their defaults
set rtp+=~/.dotfile/gundle/neobundle.vim
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
  "echomsg "[OK]: linking " . expand(a:true) . " to " . expand(a:soft)
  call system("rm -f " . expand(a:soft))
  call system("ln -s " . expand(a:true) . " " . expand(a:soft))
endfunction
"}}}
function! LinkFile(true, soft) "{{{
  if filereadable(expand(a:true))
    call MakeSoftLink(a:true, a:soft)
  elseif isdirectory(expand(a:true))
    call MakeSoftLink(a:true, a:soft)
  else
    echoerr "[Error]: " . expand(a:true) . " doesn't exist"
  endif
endfunction
"}}}
"}}}

let linking_files = [
    \     ['git/gitconfig',     '.gitconfig'],
    \     ['vim/vimrc',         '.vimrc'],
    \     ['tmux/tmux.conf',   '.tmux.conf'],
    \     ['zsh/vars.sh',       '.vars.sh'],
    \     ['zsh/localvars.sh',  '.localvars.sh'],
    \]

" make sure zsh/localvars.sh exist
call system('touch zsh/localvars.sh')

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
NeoBundle      'coolwanglu/guake-colors-solarized'
NeoBundle      'seebi/dircolors-solarized'
NeoBundle      'conghui/iterm2-color-solarized'
NeoBundle      'Anthony25/gnome-terminal-colors-solarized'
NeoBundle      'bssthu/tunet_py'
NeoBundle      'houtianze/bypy'

" terminator-solarized"{{{
NeoBundle      'ghuntley/terminator-solarized'
  call EnsureExists('~/.config/terminator')
  call LinkFile('$DOTFILE_BUNDLE_ROOT/terminator-solarized/config','~/.config/terminator/config')
"}}}
" zprezto & zsh"{{{
NeoBundle      'sorin-ionescu/prezto', {'name' : 'zprezto', 'build':'git submodule update --init --recursive'}
  call LinkFile('$DOTFILE_BUNDLE_ROOT/zprezto', '~/.zprezto')

  let old_wig = &wig
  set wig=*.md,zshrc,zpreztorc

  for f in split(globpath('~/.zprezto/runcoms', '*'), '\n')
    let soft = expand("~/." . substitute(f, ".*/", "", ""))
    call LinkFile(f, soft)
  endfor

  set wig=&old_wig

  call LinkFile('$ZSH_ROOT/zpreztorc', '~/.zpreztorc')
  call LinkFile('$ZSH_ROOT/zshrc.zsh', '~/.zshrc')
"}}}

" finish"{{{
call neobundle#end()
NeoBundleCheck
"}}}
