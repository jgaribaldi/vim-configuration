# vim-configuration
Personal configuration for vim

# First time installation
1. Clone project in home folder
2. Install Vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
3. Install powerline fonts (https://github.com/powerline/fonts)
4. Configure font in iTerm2: 12pt Meslo LG S DZ Regular for Powerline
5. Run `vim` and execute `PluginInstall`
6. Fix git: `git config --global core.editor /usr/bin/vim`

# On Linux
1. Make sure to install `vim-gui-common`, `vim-runtime` and `vim-nox` packages:
- `sudo apt-get install vim-gui-common`
- `sudo apt-get install vim-runtime`
- `sudo apt-get install vim-nox`
2. Powerline fonts can be installed with:
- `sudo apt-get install fonts-powerline`
