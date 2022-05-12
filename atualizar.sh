#!/usr/bin/env bash

# deletar antigos
sudo rm -r ./fish-shell
sudo rm -r ./i3
sudo rm -r ./rofi
sudo rm -r ./polybar
sudo rm -r ./alacritty
sudo rm -r ./bash
sudo rm -r ./doom-emacs

# criar pastas
mkdir fish-shell
mkdir fish-shell/.config/
mkdir i3
mkdir i3/.config
mkdir rofi
mkdir rofi/.config
mkdir polybar
mkdir polybar/.config
mkdir gtk
mkdir bash
mkdir emacs
mkdir doom-emacs
mkdir doom-emacs/.config

# atualizar
## .config
# fish / omf
cp -r ~/.config/fish/ ./fish-shell/.config/
cp -r ~/.config/omf/ ./fish-shell/.config/

# i3
cp -r ~/.config/i3/ ./i3/.config/

# rofi
cp -r ~/.config/rofi/ ./rofi/.config/

# polybar
cp -r ~/.config/polybar/ ./polybar/.config/

## home
# Atualizar alacritty e bash_profile
cp -r ~/.bash_profile ./bash
cp -r ~/.bashrc ./bash
cp -r ~/.alacritty.yml ./alacritty

# Atualizar doom
cp -r ~/.config/doom ./doom-emacs/.config/

echo "Atualizado!"
