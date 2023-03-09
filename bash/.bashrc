#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export QT_QPA_PLATFORMTHEME=kde
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
