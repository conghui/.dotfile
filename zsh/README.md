The zsh configuration is a framework for setting up the zsh environment. It employs `antigen` to manage plugins.

## Philosophy
Generally speaking, you don't need to modified `zshrc.zsh` for daily work. Keeping `zshrc.zsh` simple and clean is a good habit and will improve the efficiency.

The `zshrc.zsh` will automatically source all the `.zsh` files in `custom/` folder. This is the place that you can put your own machine-dependent settings. All `.zsh` files in `custom/` folder will be ignored by git, thus adding the machine-dependent scripts here will not make the repo dirty.


