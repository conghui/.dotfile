## Install dotfile

run the following command to install dotfiles
```
git submodule init && git submodule update
source zsh/vars.sh
vim +NeoBundleInstall +qall -u ./install.vim
```

If the bundles are not ready, you may execute `vim +NeoBundleInstall +qall
-u ./install.vim` multiple times.

## Install nvim
```
# download dein and install
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $DOTFILE_BUNDLE_ROOT && rm -rf installer.sh
```
You may need to make link to ./vim/vimrc based on your own requirements.
