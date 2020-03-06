#!/usr/bin/env zsh

alien_venv(){
  __venv="`plib_venv`"
  if [[ ${__venv} != "" ]]; then
    echo -ne "`plib_venv` "
  fi
  if [[ ${CONDA_DEFAULT_ENV} != "base" ]]; then
    echo -ne "($CONDA_DEFAULT_ENV) "
  fi
}
