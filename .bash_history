pwd
cd $HOME
pwd
ls -la
exit
~
cd ~
pwd
ls -la
git clone --bare https://github.com/FewCM/dotfiles ~/.local/share/dotfiles/home
git --git-dir=$HOME/.local/share/dotfiles/home --work-tree=$HOME checkout -f
ls -la
exit
ls -la
whoami
lsblk
pwd
cd ~
pwd
ls -la
su nano /root/scripts/first_boot_root.sh 
nano /root/scripts/first_boot_root.sh 
pwd
nano pkglist.txt
nano /root/scripts/first_boot_root.sh 
yay -Syu --needed --noconfirm - < pkglist.txt
nano /root/scripts/first_boot_root.sh 
yay -Syu --needed --noconfirm - < foreignpkglist.txt && rustup toolchain install stable && rustup default stable
nano /root/scripts/first_boot_root.sh 
exit
mv .cache .cache.tmp 
btrfs sub create .cache
mv .cache.tmp/* .cache.tmp/.??* .cache
rmdir .cache.tmp/*
rmdir .cache.tmp
exit
export DOTFILES_TREE="$HOME"
export DOTFILES_DIR="$HOME/.local/share/dotfiles/home"
export DOTFILES_BACKUP_DIR="$HOME/.local/share/dotfiles/home/home_backup"
echo $DOTFILES_DIR
export DOTFILES_TREE="$HOME"
export DOTFILES_DIR="$HOME/.local/share/dotfiles/home"
export DOTFILES_BACKUP_DIR="$HOME/.local/share/dotfiles/home/home_backup"
export DOTFILES_REMOTE_URL="https://github.com/FewCM/dotfiles.git"
rm -rf $DOTFILES_DIR
if [[ -d "${DOTFILES_DIR}" ]]; then 		echo "Directory exists"; 		exit 1; else 		cd "${DOTFILES_TREE}"; 		git init --bare "${DOTFILES_REMOTE_URL}" "${DOTFILES_DIR}"; fi
if [[ -d "${DOTFILES_DIR}" ]]; then 		echo "Directory exists"; 		exit 1; else 		cd "${DOTFILES_TREE}"; 		git clone --bare "${DOTFILES_REMOTE_URL}" "${DOTFILES_DIR}"; fi
sudo pacman -S git-filter-repo
cd Git/
git clone https://github.com/FewCM/dotfiles 
git subtree
git clone --depth=1 https://github.com/Bash-it/bash-it.git .config/bash_it
pwd
printenv
starship
pwd
~
cd ~

echo $DOTBARE_TREE
rm -rf /home/fewcm/Git/.config/bash_it
pwd
git clone --depth=1 https://github.com/Bash-it/bash-it.git .config/bash_it
ls .config/
.config/bash_it/install.sh 
echo $BASH_IT
source ~/.bashrc
bash-it show aliases 
cd /home/fewcm/.config/bash_it
./uninstall.sh 
echo $BASH_IT_THEME
.config/bash_it/install.sh --interactive
source ~/.bashrc
bash-it show aliases
bash-it show plugins 
bash-it help plugins
bash-it help themes
source ~/.bashrc
source ~/.bashrc
cd Git/dotfiles/
source ~/.bashrc
egrep
shellcheck /home/fewcm/Git/my_arch/first_boot.sh
shellcheck /home/fewcm/Git/my_arch/first_boot.sh
echo $DOTFILES_TREE
git init --bare "${DOTFILES_REMOTE_URL}" "${DOTFILES_DIR}"
zsh
