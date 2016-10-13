local ret_status=" %(?:%{$fg[cyan]%}:%{$fg_bold[red]%})%c%{$reset_color%}"

PROMPT='${ret_status} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[161]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} ! "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} "

ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

#RVM info
local rvm_info='$(rvm_prompt_info)'
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_RVM_PROMPT_SUFFIX="%{$reset_color%}"

# GVM info
gvm_prompt_info() {
  if which go >/dev/null; then
    GO_VERSION=$(go version | awk '{print $3}')
    ZSH_THEME_GVM_PROMPT_PREFIX=""
    ZSH_THEME_GVM_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_GVM_PROMPT_PREFIX$GO_VERSION$ZSH_THEME_GVM_PROMPT_SUFFIX"
  else
    echo '';
  fi
}

local gvm_info='$(gvm_prompt_info)'

# NVM info
local nvm_info='$(nvm_prompt_info)'
ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}node"
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"

RPROMPT="${nvm_info}  ${gvm_info}  ${rvm_info}"