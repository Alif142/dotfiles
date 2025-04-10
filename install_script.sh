#!/bin/bash

# Function to display the installation logo
show_logo() {
    echo -e "\033[1;36m"
    cat << "EOF"
   _____  _____ _______ ______ _____  
  / ____|/ ____|__   __|  ____|  __ \ 
 | (___ | |       | |  | |__  | |__) |
  \___ \| |       | |  |  __| |  _  / 
  ____) | |____   | |  | |____| | \ \ 
 |_____/ \_____|  |_|  |______|_|  \_\
EOF
    echo -e "\033[0m"
    echo -e "\033[1;34mArch Linux Package Installer\033[0m"
    echo -e "\033[1;33m--------------------------------\033[0m"
    echo ""
}

# Function to check if running as root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "\033[1;31mError: This script must be run as root\033[0m"
        exit 1
    fi
}

# Function to update system
update_system() {
    echo -e "\033[1;34mUpdating system packages...\033[0m"
    pacman -Syu --noconfirm
    echo -e "\033[1;32mSystem update complete.\033[0m"
}

# Function to install package
install_package() {
    local package=$1
    echo -e "\033[1;32mInstalling $package...\033[0m"
    
    if pacman -Qs "$package" > /dev/null ; then
        echo -e "\033[1;33m$package is already installed.\033[0m"
    else
        if pacman -S --noconfirm "$package"; then
            echo -e "\033[1;32mSuccessfully installed $package\033[0m"
        else
            echo -e "\033[1;31mFailed to install $package\033[0m"
            return 1
        fi
    fi
}

# Function to display package list
show_package_list() {
    echo -e "\033[1;35mThe following packages will be installed:\033[0m"
    echo -e "\033[1;33m+-------------------------------+"
    echo -e "| No. | Package Name            |"
    echo -e "|-----|-------------------------|"
    
    local count=1
    for pkg in "${packages[@]}"; do
        printf "| %-3s | %-23s |\n" "$count" "$pkg"
        ((count++))
    done
    
    echo -e "+-------------------------------+"
    echo ""
}

# Main function
main() {
    show_logo
    check_root
    
    # Define your packages here (no categories needed)
    declare -a packages=(
        "nvim"
        "firefox"
        "git"
        "python3"
        "tmux"
        "wget"
        "openssh"
        "base-devel"
        "nemo"
        "vlc"
        "qbittorrent"
        "picom"
        "lxappearance"
    )
    
    # Show package list
    show_package_list
    
    # Ask for confirmation
    read -p $'\033[1;36mDo you want to proceed with installation? (y/n): \033[0m' -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "\033[1;31mInstallation aborted by user.\033[0m"
        exit 0
    fi
    
    # Update system first
    update_system
    
    # Install all packages
    echo -e "\033[1;35mStarting package installation...\033[0m"
    for pkg in "${packages[@]}"; do
        install_package "$pkg"
    done
    
    echo -e "\033[1;32m\nAll packages installed successfully!\033[0m"
}

# Execute main function
main
