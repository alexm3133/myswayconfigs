
#!/bin/bash

# Ensure the system is updated
sudo pacman -Syu --noconfirm

# Install essential tools if not already installed
if ! command -v git &> /dev/null; then
    echo "Git not found, installing Git..."
    sudo pacman -S --noconfirm git
else
    echo "Git is already installed"
fi

if ! command -v yay &> /dev/null; then
    echo "yay not found, installing yay..."
    sudo pacman -S --needed --noconfirm base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "yay is already installed"
fi

# Install NVIDIA drivers and dependencies
echo "Installing NVIDIA drivers and dependencies..."
sudo pacman -S --noconfirm \
    nvidia \
    nvidia-utils \
    lib32-nvidia-utils \
    libxcb \
    mesa \
    libglvnd \
    lib32-libglvnd \
    egl-wayland \
    xorg-xwayland \
    libdrm \
    vulkan-tools

# Install Sway and related packages
echo "Installing Sway and related packages..."
yay -S --noconfirm \
    sway-git \
    waybar \
    wlroots-eglstreams

# Install additional applications
echo "Installing additional applications..."
sudo pacman -S --noconfirm neovim rofi kitty

# Install SDDM
echo "Installing SDDM..."
sudo pacman -S --noconfirm sddm

# Enable SDDM to start on boot
sudo systemctl enable sddm

# Configure SDDM to use Wayland
echo "Configuring SDDM to use Wayland..."
sudo bash -c 'echo -e "[General]\nDisplayServer=wayland" > /etc/sddm.conf'

# Create a Sway session file for SDDM
echo "Creating Sway session file for SDDM..."
sudo bash -c 'cat <<EOF > /usr/share/wayland-sessions/sway.desktop
[Desktop Entry]
Name=Sway
Comment=An i3-compatible Wayland compositor
Exec=sway
Type=Application
DesktopNames=Sway
EOF'

# Clone the configuration repository
echo "Cloning the configuration repository..."
git clone https://github.com/alexm3133/myswayconfigs.git

# Create necessary directories
echo "Creating necessary directories..."
mkdir -p ~/.config
mkdir -p ~/.local/share
mkdir -p ~/wallpapers

# Copy configuration files to the appropriate locations
echo "Copying configuration files..."
cp -r myswayconfigs/nvim ~/.config/
cp -r myswayconfigs/sway ~/.config/
cp -r myswayconfigs/rofi ~/.config/
cp -r myswayconfigs/waybar ~/.config/
cp -r myswayconfigs/kitty ~/.config/
cp -r myswayconfigs/local ~/.local/share/
cp myswayconfigs/wallpapers/1.jpg ~/wallpapers/

# Clean up
rm -rf myswayconfigs

# Reboot to apply all changes
echo "Installation complete. Rebooting..."
sudo reboot
