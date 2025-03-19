# Set Oh My Zsh path
export ZSH="$HOME/.oh-my-zsh"

# Set Powerlevel10k as theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins for maximum productivity
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  fzf
  sudo
  history-substring-search
  extract
  rand-quote
  emoji
)

source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 🖥️ Auto system info on start
fastfetch  # or alternatively cmatrix, neofetch, asciiquarium

# ⚡ ALIASES – for ultra-fast commands ⚡

# System aliases
alias cls="clear"
alias update="sudo pacman -Syu"
alias upgrade="yay -Syu"
alias remove="sudo pacman -Rns"
alias cleanup="sudo pacman -Rns $(pacman -Qdtq)"
alias fixpac="fix_pacman"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias home="cd ~"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias projects="cd ~/Projects"

# Package management
alias install="sudo pacman -S"
alias search="pacman -Ss"
alias list="pacman -Q"
alias aursearch="yay -Ss"
alias aurinstall="yay -S"
alias aurremove="yay -Rns"
alias pacman-update="sudo pacman -Syu"
alias yay-update="yay -Syu"
alias paru-update="paru -Syu"
alias pikaur-update="pikaur -Syu"
alias trizen-update="trizen -Syu"
alias pacaur-update="pacaur -Syu"
alias aura-update="aura -Ayu"

# 🚀 **Full System Update Function**
fullupdate() {
    echo "🚀 Starting full system update..."
    
    # 1️⃣ Update system & AUR packages
    echo "📦 Updating Pacman..."
    sudo pacman -Syu
    
    echo "📦 Updating AUR packages with yay..."
    yay -Syu
    
    echo "📦 Updating AUR packages with paru..."
    paru -Syu
    
    echo "📦 Updating AUR packages with pikaur..."
    pikaur -Syu
    
    echo "📦 Updating AUR packages with trizen..."
    trizen -Syu
    
    echo "📦 Updating AUR packages with pacaur..."
    pacaur -Syu
    
    echo "📦 Updating AUR packages with aura..."
    aura -Ayu
    
    # 2️⃣ Remove unneeded packages
    echo "🗑️ Removing orphaned packages..."
    sudo pacman -Rns $(pacman -Qdtq)
    
    # 3️⃣ Update Pacman keyring (if needed)
    echo "🔑 Updating Pacman keyring..."
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    
    # 4️⃣ Clean package cache
    echo "🧹 Clearing old Pacman cache..."
    sudo pacman -Sc
    sudo pacman -Scc
    
    # 5️⃣ Clean temporary files & logs
    echo "🗑️ Removing old logs and temporary files..."
    sudo journalctl --vacuum-time=3d
    sudo rm -rf /var/tmp/*
    
    echo "✅ Full update completed!"
}

# Network analysis
alias myip="curl ifconfig.me"
alias ports="sudo netstat -tulpen"
alias speedtest="speedtest-cli"
alias pingg="ping -c 5 google.com"

# Docker & Portainer
alias dps="docker ps"
alias dimages="docker images"
alias dstart="docker start"
alias dstop="docker stop"
alias drm="docker rm"
alias dlogs="docker logs"
alias portainer="docker start portainer"

# Git aliases
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"
alias gcl="git clone"

# File handling
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias mkdir="mkdir -p"

# Quick access to configs
alias zshrc="nano ~/.zshrc"
alias p10k="nano ~/.p10k.zsh"

# Cool tools shortcuts
alias matrix="cmatrix -C red"
alias fish="asciiquarium"
alias neofetch="fastfetch"

# 🔥 ADVANCED FUNCTIONS 🔥

# 📦 Quickly clean Pacman cache
clear_pacman_cache() {
    echo "🧹 Cleaning old Pacman packages..."
    sudo pacman -Sc
    sudo pacman -Scc
}

# 🔧 Fix Pacman
fix_pacman() {
    echo "🔧 Fixing Pacman..."
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
    sudo pacman -Syy
}

# 🕵️‍♂️ List open ports
check_ports() {
    sudo netstat -tulpen
}

# 🌍 Ping test multiple servers
ping_test() {
    echo "🌐 Testing connections..."
    ping -c 5 google.com
    ping -c 5 github.com
    ping -c 5 archlinux.org
}

# 📂 Create a tar.gz backup of a directory
backup_dir() {
    if [ -z "$1" ]; then
        echo "❌ Please provide a directory name."
        return 1
    fi
    tar -czvf "$1-backup-$(date +%Y%m%d).tar.gz" "$1"
    echo "✅ Backup of $1 created!"
}

# 🔄 Restore backup
restore_backup() {
    if [ -z "$1" ]; then
        echo "❌ Please provide the backup filename."
        return 1
    fi
    tar -xzvf "$1"
    echo "✅ Backup $1 restored!"
}

# 🐳 List and filter Docker containers
docker_list() {
    if [ -z "$1" ]; then
        docker ps -a
    else
        docker ps -a | grep "$1"
    fi
}

# 🔥 Delete ALL Docker containers and images
docker_nuke() {
    echo "🚨 WARNING: All containers and images will be deleted!"
    read -p "Are you sure? (y/N): " confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        docker stop $(docker ps -aq)
        docker rm $(docker ps -aq)
        docker rmi $(docker images -q)
        echo "✅ All Docker data deleted!"
    else
        echo "❌ Canceled."
    fi
}

# 🕒 Show last x commands in history
historyx() {
    if [ -z "$1" ]; then
        history | tail -n 20
    else
        history | tail -n "$1"
    fi
}

# 📜 Show 10 largest files in the current directory
biggest_files() {
    du -ah . | sort -rh | head -n 10
}

# 🔎 Recursively search for a file
findfile() {
    if [ -z "$1" ]; then
        echo "❌ Please provide a filename."
        return 1
    fi
    find . -name "$1"
}

# 🖥️ Show processes with highest CPU and RAM usage
top_processes() {
    echo "🔥 Top CPU usage processes:"
    ps aux --sort=-%cpu | head -n 10
    echo ""
    echo "🧠 Top RAM usage processes:"
    ps aux --sort=-%mem | head -n 10
}

# 🎛️ Display system info
sysinfo() {
    echo "📊 System information:"
    uname -a
    fastfetch
}

# 🔄 Set restart timer (e.g., restart_in 5m)
restart_in() {
    if [ -z "$1" ]; then
        echo "❌ Please provide a time (e.g., 5m, 1h)."
        return 1
    fi
    echo "🔄 Restarting system in $1..."
    sleep "$1" && sudo reboot
}

# 🔌 List all USB devices
usb_devices() {
    lsusb
}

# Switch to Zsh shell
#chsh -s $(which zsh)

# End of file
