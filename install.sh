# Put 'chrome' folder in firefox profile
# Put 'nvim' folder in .config profile


# symlinks
dot_dir = ~/dotfiles
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

ln -sf $dot_dir/.vim ~/.vim
ln -sf $dot_dir/.zshrc ~/.zshrc
ln -sf $dot_dir/.tmux ~/.tmux
ln -sf $dot_dir/.tmux.conf ~/.tmux.conf
ln -sf $dot_dir/.gitconfig ~/.gitconfig
ln -sf $dot_dir/.themes ~/.themes
ln -sf $dot_dir/.p10k.zsh ~/.p10k.zsh
