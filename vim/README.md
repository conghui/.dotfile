Personal vim configuration

Installation
============
As all plugins are handled by
[NeoBundle](https://github.com/Shougo/neobundle.vim), you have to install
*NeoBundle* at the first place with the following command:

    git submodule init && git submodule update

Other plugins will be installed when you launch vim.

Update Submodules
=============
Run `:NeoBundleUpdate` to update plugins in vim.

Install C-family completion for YouCompleteMe
===
It is always a good idea to remove the whole repo and reinstall
`youcompleteme` in a clean repo.

### Installation on CentOS
1. Install llvm-clang-3.3. This step can be boosted by the script
   ~/.dotfile/build/build-llvm-clang-3.3.sh
2. Compile and build youcompleteme: this step can be also boosted by the
   script ~/.dotfile/build/build-youcompleteme.sh

### Installation on Mac
1. extract `clang+llvm-3.3-x86_64-apple-darwin12.tar.gz` to install llvm and
   clang. Make a soft link named `llvm` to it.
2. compile and build youcompleteme with script
   `~/.dotfile/build/build-youcompleteme-mac.sh`
