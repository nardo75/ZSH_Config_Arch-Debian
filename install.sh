#!/bin/bash

set -e  # Exit script on error

echo "🔄 Updating system..."
if [[ -f /etc/arch-release ]]; then
    sudo pacman -Syu --noconfirm
elif [[ -f /etc/debian_version ]]; then
    sudo apt update && sudo apt upgrade -y
else
    echo "❌ Unsupported Linux distribution!"
    exit 1
fi

echo "📦 Installing essential packages..."
if [[ -f /etc/arch-release ]]; then
    sudo pacman -S --noconfirm zsh git curl wget fastfetch cmatrix asciiquarium neofetch net-tools speedtest-cli fzf
elif [[ -f /etc/debian_version ]]; then
    sudo apt install -y zsh git curl wget fastfetch cmatrix asciiquarium neofetch net-tools speedtest-cli fzf
fi

echo "🐧 Installing Oh My Zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "🎨 Installing Powerlevel10k..."
if [[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

echo "🔌 Installing Zsh plugins..."
PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$PLUGINS_DIR"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR/zsh-autosuggestions"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$PLUGINS_DIR/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/zsh-users/zsh-completions "$PLUGINS_DIR/zsh-completions"
git clone --depth=1 https://github.com/ajeetdsouza/zsh-extract "$PLUGINS_DIR/extract"
git clone --depth=1 https://github.com/Tarrasch/zsh-autoenv "$PLUGINS_DIR/autoenv"

echo "🐧 Installing AUR helpers (Arch only)..."
if [[ -f /etc/arch-release ]]; then
    sudo pacman -S --noconfirm yay paru

    echo "📥 Installing yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si

    echo "📥 Installing auracle..."
    yay -S auracle
    
    echo "📥 Installing pikaur..."
    git clone https://aur.archlinux.org/pikaur.git /tmp/pikaur
    cd /tmp/pikaur && makepkg -si --noconfirm
    cd ~ && rm -rf /tmp/pikaur

    echo "📥 Installing trizen..."
    git clone https://aur.archlinux.org/trizen.git /tmp/trizen
    cd /tmp/trizen && makepkg -si --noconfirm
    cd ~ && rm -rf /tmp/trizen

    echo "📥 Installing pacaur..."
    git clone https://aur.archlinux.org/pacaur.git /tmp/pacaur
    cd /tmp/pacaur && makepkg -si --noconfirm
    cd ~ && rm -rf /tmp/pacaur

    echo "📥 Installing aura..."
    git clone https://aur.archlinux.org/aura-bin.git /tmp/aura
    cd /tmp/aura && makepkg -si --noconfirm
    cd ~ && rm -rf /tmp/aura
fi

echo "🐳 Installing Docker..."
if [[ -f /etc/arch-release ]]; then
    sudo pacman -S --noconfirm docker
elif [[ -f /etc/debian_version ]]; then
    sudo apt install -y docker.io
fi
sudo systemctl enable --now docker

echo "✅ Installation complete!"
echo "ℹ️ Restart your terminal and run 'zsh' to switch to your new setup."
