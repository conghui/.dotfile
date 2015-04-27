## Install dotfile

run the following command to install dotfiles
```
git submodule init && git submodule update
source zsh/vars.sh
vim +NeoBundleInstall +qall -u ./install.vim
```

If the bundles are not ready, you may execute `vim +NeoBundleInstall +qall
-u ./install.vim` multiple times.

## Install Vim
please refer to [vim readme](./vim/README.md).
