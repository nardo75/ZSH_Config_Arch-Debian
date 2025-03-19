#!/bin/bash

set -e  # Script bricht bei Fehler ab

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
    sudo pacman -S --noconfirm yay paru pikaur trizen pacaur aura
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
