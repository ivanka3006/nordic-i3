#!/bin/bash


sudo pacman -S --no-confirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


yay -S maim xlip firefox alacritty cava i3 picom polybar rofi feh flameshot dunst pavucontrol nwg-look ttf-jetbrains-mono ttf-nerd-fonts-symbols papirus-icon-theme


read -rep $'Install extra software? (y, n) ' ANSWER
if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
    yay -S telegram-desktop vlc discord steam qbittorrent thunar micro
elif [[ $ANSWER == "N" || $ANSWER == "n" ]]; then
    echo "Skipping extasoft install..."
else
    echo "Error! type 'y' or 'n' Exit..."
fi


read -rep $'Install ly? (y, n) ' ANSWER
if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
    yay -S ly
    systemctl enable ly.service
elif [[ $ANSWER == "N" || $ANSWER == "n" ]]; then
    echo "Skipping ly install..."
else
    echo "Error! type 'y' or 'n' Exit..."
fi


read -rep $'Install configs? (y, n) ' ANSWER
if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
    cp -R ~/nordic-i3/.config/* ~/.config/
elif [[ $ANSWER == "N" || $ANSWER == "n" ]]; then
    echo "Skipping configs install..."
else
    echo "Error! type 'y' or 'n' Exit..."
fi



read -rep $'Installation was successful. reboot? (y, n) ' ANSWER
if [[ $ANSWER == "Y" || $ANSWER == "y" ]]; then
    reboot
elif [[ $ANSWER == "N" || $ANSWER == "n" ]]; then
    echo "Skipping reboot..."
else
    echo "Error! type 'y' or 'n' Exit..."
fi



