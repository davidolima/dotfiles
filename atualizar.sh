#!/usr/bin/env bash

## .config
# Atualizar fish
rm -r ./.config/fish
rm -r ./.config/omf
cp -r ~/.config/fish/ ./.config/
cp -r ~/.config/omf/ ./.config/

#Atualizar plank
rm -r ./.config/plank
cp -r ~/.config/plank ./.config/
## home
# Atualizar alacritty e bash_profile
rm ./.alacritty.yml
rm ./.bash_profile
cp -r ~/.alacritty.yml .
cp -r ~/.bash_profile .

# Atualizar doom
rm -r ./.doom.d
cp -r ~/.doom.d .
