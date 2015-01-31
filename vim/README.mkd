Personal vim configuration 

Installation
============
As all plugins are handled by 
[Vundle](https://github.com/gmarik/Vundle.vim), you have to install 
*Vundle* at the first place with the following command:

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

To install plugins, please run the command `:VundleInstall` in vim. It will 
download the latest plugins for you.

Update Submodules
=============
The submodules are handled by *Vundle* plugin. You can update all the 
submodlues with the command `:PluginUpdate` in vim


Youcompleteme
===
The completion in vim is handled by 
[Youcompleteme](https://github.com/Valloric/YouCompleteMe). You have to 
install it manually by running the scripts `install.sh` in 
`~/.vim/bundle/Youcompleteme/`.
