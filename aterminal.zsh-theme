local ret_status=" %(?:%{$fg[cyan]%}:%{$fg_bold[red]%})%c%{$reset_color%}"

PROMPT='${ret_status} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[161]"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%} ! "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} "

ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"

# Ruby info
ruby_prompt_info() {
  if which ruby >/dev/null; then
    RUBY_VERSION=$(ruby -v | awk '{print $2}')
    ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}ruby"
    ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_RUBY_PROMPT_PREFIX$RUBY_VERSION$ZSH_THEME_RUBY_PROMPT_SUFFIX"
  else
    echo '';
  fi
}

local ruby_info='$(ruby_prompt_info)'

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

# Elixir info
exl_prompt_info() {
  if which elixir >/dev/null; then
    EXL_VERSION=$(elixir -v | grep Elixir | awk '{print $2}')
    ZSH_THEME_EXL_PROMPT_PREFIX="$FG[135]elixir"
    ZSH_THEME_EXL_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_EXL_PROMPT_PREFIX$EXL_VERSION$ZSH_THEME_EXL_PROMPT_SUFFIX"
  else
    echo '';
  fi
}

local exl_info='$(exl_prompt_info)'

# NVM info
local nvm_info='$(nvm_prompt_info)'
ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}node"
ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"

RPROMPT="${nvm_info}  ${gvm_info}  ${exl_info}  ${ruby_info}"