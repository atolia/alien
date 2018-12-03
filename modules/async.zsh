#!/usr/bin/env zsh

function alien_dummy(){}

function alien_lprompt_complete() {

  if [[ $(alien_is_git) == 1 ]]; then
#    PROMPT='
#%(?.%K{$color0}%F{$color1}%f%k.%K{$color0}%F{$color1r}%f%k)%K{$color0}%F{$color2} $(alien_date_time_info) $(alien_battery_stat)$(kube_ps1) %f%k%K{$color3}%F{$color0}%f%k%K{$color3}%F{$color4} $_user %f%k%K{$color5}%F{$color3}%f%k%K{$color5}%F{$color6} %d %f%k%F{$color5}%K{$color7}%k%f%K{$color7}%F{$color9}`alien_git_branch`%f%k%K{$color10}%F{$color7}%f%k%K{$color10}%F{$color11}$(alien_git_lr) %f%k%K{$color12}%F{$color10}%f%k%K{$color12}%F{$color13}$(alien_git_dirty) %f%k%F{$color12}%f '
    PROMPT=$PROMPT'`alien_git_branch`%f%k%K{$color12}%F{$color13}$(alien_git_dirty)%F{$color6}$(alien_git_lr) %f%k%F{$color12} '
#  else
#    PROMPT='
#%(?.%K{$color0}%F{$color1}%f%k.%K{$color0}%F{$color1r}%f%k)%K{$color0}%F{$color2} $(alien_date_time_info) $(alien_battery_stat)$(kube_ps1) %f%k%K{$color3}%F{$color0}%f%k%K{$color3}%F{$color4} $_user %f%k%K{$color5}%F{$color3}%f%k%K{$color5}%F{$color6} %d %f%k%F{$color5}%f '
#    PROMPT='
#$(alien_date_time_info)$(kube_ps1)%~'
  fi
  zle && zle reset-prompt
  async_stop_worker lprompt -n
}


alien_async_prompt(){
  async_init
  async_start_worker lprompt -n
  async_register_callback lprompt alien_lprompt_complete
  async_job lprompt alien_dummy
}
