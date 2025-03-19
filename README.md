## 🔧 Installation

### 📥 1. Clone the repository
First, clone the repository to your system:

````bash
git clone https://github.com/nardo75/ZSH_Config_Arch-Debian.git
cd ZSH_Config_Arch-Debian
````

🔑 2. Make the installation script executable
Run the following command to make the script executable:
````bash
chmod +x install.sh
````

🚀 3. Run the installation script
Start the installation with:
````bash
./install.sh
````
---
⚙️ Manual installation for missing AUR helpers (Arch Linux only)
If your system does not have an AUR helper (pikaur, trizen, paru, yay), install one manually:
````bash
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm
git clone https://aur.archlinux.org/trizen.git && cd trizen && makepkg -si --noconfirm
git clone https://aur.archlinux.org/pikaur.git && cd pikaur && makepkg -si --noconfirm
````

(Or just use the installation script)

---

🐳 Docker installation (Optional)
If you need Docker, enable and start it with:
````bash
systemctl enable --now docker
````
To add your user to the Docker group (so you can use Docker without sudo):
````bash
sudo usermod -aG docker $USER
````
---
🎯 Usage after installation  
Once the installation is complete, restart your terminal to apply the configuration.

To configure Powerlevel10k, run:
````bash
p10k configure
````
---

🛠️ Troubleshooting  
❓ "Zsh is not set as the default shell?"  
If your default shell has not changed, set it manually with:
````bash
chsh -s $(which zsh)
````
---
❓ "Fonts look broken?"  
If your terminal displays incorrect symbols, make sure you are using a Nerd Font or Powerline Font.  
You can download them here:  
https://www.nerdfonts.com/font-downloads  

---

📜 License  
This project is licensed under the MIT License.

---

🤓 Happy Coding!  
Made with ❤️ by Nardo75
