```md
# 🚀 Ultimate Zsh Setup Script

This script automates the installation and configuration of Zsh with all necessary dependencies and plugins, ensuring an optimized terminal experience.

## 📜 Features
- Installs **Zsh**, **Oh My Zsh**, and popular plugins
- Supports both **Arch Linux (Pacman + AUR)** and **Debian-based (APT) systems**
- Configures **Powerlevel10k** theme
- Installs **Zsh Autosuggestions**, **Syntax Highlighting**, and **Zsh Completions**
- Supports multiple AUR helpers for Arch users
- Backs up existing `.zshrc` before applying new configurations

---

## 📦 Dependencies

| **Package**         | **Arch (Pacman/AUR)** | **Debian (APT)**  |
|---------------------|----------------------|--------------------|
| **Zsh**            | ✅ `pacman -S zsh`   | ✅ `apt install zsh` |
| **Oh My Zsh**      | ✅ Auto-installed    | ✅ Auto-installed  |
| **Powerlevel10k**  | ✅ AUR/GitHub        | ✅ GitHub Install  |
| **Zsh Plugins**    | ✅ GitHub            | ✅ GitHub          |
| **AUR Helpers**    | ✅ Manual Install    | ❌ Not applicable  |

---

## 🔧 Installation

### 🏗️ Clone the repository
```bash
git clone https://github.com/nardo75/ZSH_Config_Arch-Debian/.git
cd ZSH_Config_Arch-Debian
chmod +x install.sh
```

### 🚀 Run the install script
```bash
./install.sh
```

---

## ⚙️ Manual Installation for Missing AUR Helpers

For **Arch Linux**, if your system is missing some AUR helpers (e.g., `pikaur`, `trizen`, `pacaur`, `aura`), install them manually:

```bash
git clone https://aur.archlinux.org/pikaur.git && cd pikaur && makepkg -si --noconfirm
git clone https://aur.archlinux.org/trizen.git && cd trizen && makepkg -si --noconfirm
git clone https://aur.archlinux.org/pacaur.git && cd pacaur && makepkg -si --noconfirm
git clone https://aur.archlinux.org/aura.git && cd aura && makepkg -si --noconfirm
```

---

## 🐳 Docker Installation (Optional)
This script can also install and enable Docker:

```bash
systemctl enable --now docker
```
To add your user to the `docker` group (to run Docker without `sudo`):

```bash
sudo usermod -aG docker $USER
```

---

## 💡 Usage

After installation, restart your terminal and enjoy your fully configured **Zsh** environment! 🎉

To apply Powerlevel10k configuration, run:
```bash
p10k configure
```

---

## 🛠️ Troubleshooting

### **Zsh is not the default shell**
Run:
```bash
chsh -s $(which zsh)
```
Then **log out and back in**.

### **Fonts not displaying correctly in Powerlevel10k**
Make sure you have a **Nerd Font** installed, such as `MesloLGS NF`. You can download it from:
[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

---

## ⭐ Contribute
Feel free to fork, improve, or open an issue on GitHub! 🔥

---

## 📜 License
This project is licensed under the MIT License.

---
👨‍💻 **Happy Coding!**  
🚀 Made with ❤️ by Nardo75  

