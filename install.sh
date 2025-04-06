#!/bin/bash

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                                                                                         ┃
# ┃      _________              __   .__                                 ____  ___          ┃
# ┃     /   _____/ ____   ____ |  | _|__|           ________ ____   ____ \   \/  /          ┃
# ┃     \_____  \_/ __ \ /    \|  |/ /  |   ______  \___   // __ \ /    \ \     /           ┃ 
# ┃     /        \  ___/|   |  \    <|  |  /_____/   /    /\  ___/|   |  \/     \           ┃ 
# ┃    /_______  /\___  >___|  /__|_ \__|           /_____ \\___  >___|  /___/\__\          ┃
# ┃                                                                                         ┃
# ┃                                                                                         ┃
# ┃                                                                                         ┃
# ┃     Arch Linux Installation Script                                                      ┃
# ┃     Author: Senat Selimoski                                                             ┃
# ┃                                                                                         ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


# Update and install base-devel
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm base-devel git

# Install yay (Yet Another Yaourt)
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Install packages
yay -S --needed --noconfirm feh python-pywal i3-gaps kitty alacritty neovim picom polybar rofi thunar obs-studio google-chrome openrgb
sudo pacman -S --needed --noconfirm gparted

# Install zsh and oh-my-zsh
if ! command -v zsh &> /dev/null; then
    sudo pacman -S --needed --noconfirm zsh
    chsh -s $(which zsh)
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check for existing Nvidia drivers and install if not present
if ! pacman -Qs nvidia > /dev/null; then
    sudo pacman -S --needed --noconfirm nvidia nvidia-utils nvidia-settings
else
    echo "Nvidia drivers are already installed."
fi

# Run the setup.sh script for symlinks
if [ -f "$HOME/.dotfiles/setup.sh" ]; then
    echo "Creating symlinks"
    bash $HOME/.dotfiles/setup.sh
else
    echo "setup.sh script not found in ~/.dotfiles"
fi

# Check and install fonts
install_font() {
    local font_name=$1
    local package_name=$2
    if ! fc-list | grep -qi "$font_name"; then
        echo "Installing $font_name..."
        sudo pacman -S --needed --noconfirm "$package_name"
    else
        echo "$font_name is already installed."
    fi
}

install_font "Nerd Fonts" "nerd-fonts"
install_font "Jetbrains" "ttf-jetbrains-mono"
install_font "Noto" "noto-fonts noto-fonts-cjk noto-fonts-emoji"
install_font "Font Awesome" "ttf-font-awesome"

yay -S --needed --noconfirm ttf-icomoon-feather-git
fc-cache -fv

echo "Installation and setup complete! Please reboot your system for the Nvidia drivers to take effect."

