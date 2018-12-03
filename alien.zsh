#!/usr/bin/env zsh

THEME_ROOT=${0:A:h}

source "${THEME_ROOT}/modules/init.zsh"

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/theme.zsh"
source "${THEME_ROOT}/modules/system.zsh"
source "${THEME_ROOT}/modules/git.zsh"
#source "${THEME_ROOT}/modules/hg.zsh"
#source "${THEME_ROOT}/modules/svn.zsh"
source "${THEME_ROOT}/modules/async.zsh"
#source "${THEME_ROOT}/modules/python.zsh"

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst
  alien_load_theme

  RPROMPT=''
  if [[ "${DEFAULT_USER}" == "${USER}" ]]; then
    _user=''
  else
    _user=`whoami`
  fi

#  PROMPT='
#%(?.%K{$color0}%F{$color1}%f%k.%K{$color0}%F{$color1r}%f%k)%K{$color0}%F{$color2} $(alien_date_time_info)$(alien_battery_stat) $(kube_ps1) %f%k%K{$color3}%F{$color0}%f%k%K{$color3}%F{$color4} $_user %f%k%K{$color5}%F{$color3}%f%k%K{$color5}%F{$color6} %d %f%k%F{$color5}%f '
  PROMPT='$(alien_date_time_info) %d
$(kube_ps1):'

  alien_async_prompt
}

#kube_ps1 alien_venv