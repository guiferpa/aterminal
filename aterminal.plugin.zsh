# Docker info
docker_prompt_info() {
  if which docker 2>/dev/null 1>/dev/null && [ -f "./Dockerfile" ] ; then
    DOCKER_VERSION=`docker -v | awk '{print substr($3, 0, length($3))}'`
    ZSH_THEME_DOCKER_PROMPT_PREFIX="%{$fg[cyan]%}docker"
    ZSH_THEME_DOCKER_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_DOCKER_PROMPT_PREFIX$DOCKER_VERSION$ZSH_THEME_DOCKER_PROMPT_SUFFIX"
  fi
}

local docker_info='$(docker_prompt_info)'

# NPM info
npm_prompt_info() {
  if which npm 2>/dev/null 1>/dev/null && [ -f "./package.json" ] ; then
    NPM_VERSION=`npm -v`
    ZSH_THEME_NPM_PROMPT_PREFIX="%{$fg[red]%}npm"
    ZSH_THEME_NPM_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_NPM_PROMPT_PREFIX$NPM_VERSION$ZSH_THEME_NPM_PROMPT_SUFFIX"
  fi
}

local npm_info='$(npm_prompt_info)'

# Node info
node_prompt_info() {
  if which node 2>/dev/null 1>/dev/null && [ ! -z `ls | grep \.js$ | head -1` ]; then
    NODE_VERSION=`node -v | awk '{print substr($1,2); }'`
    ZSH_THEME_NODE_PROMPT_PREFIX="%{$fg[green]%}node"
    ZSH_THEME_NODE_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_NODE_PROMPT_PREFIX$NODE_VERSION$ZSH_THEME_NODE_PROMPT_SUFFIX"
  fi
}

local node_info='$(node_prompt_info)'

# Python info
python_prompt_info() {
  if which python 2>/dev/null 1>/dev/null && [ ! -z `ls | grep \.py$ | head -1` ]; then
    PYTHON_VERSION=`python -c 'import platform; print(platform.python_version())'`
    ZSH_THEME_PYTHON_PROMPT_PREFIX="%{$fg[yellow]%}python"
    ZSH_THEME_PYTHON_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_PYTHON_PROMPT_PREFIX$PYTHON_VERSION$ZSH_THEME_PYTHON_PROMPT_SUFFIX"
  fi
}

local python_info='$(python_prompt_info)'

# GVM info
go_prompt_info() {
  if which go 2>/dev/null 1>/dev/null && [ ! -z `ls | grep \.go$ | head -1` ]; then
    GO_VERSION=`go version | awk '{print $3}'`
    ZSH_THEME_GVM_PROMPT_PREFIX=""
    ZSH_THEME_GVM_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_GVM_PROMPT_PREFIX$GO_VERSION$ZSH_THEME_GVM_PROMPT_SUFFIX"
  fi
}

local go_info='$(go_prompt_info)'

# Elixir info
exl_prompt_info() {
  if which elixir 2>/dev/null 1>/dev/null && [ ! -z `ls | grep \.ex$ | head -1` ] || [ ! -z `ls | grep \.exs$ | head -1` ] ; then
    EXL_VERSION=`elixir -v | grep Elixir | awk '{print $2}'`
    ZSH_THEME_EXL_PROMPT_PREFIX="$FG[135]elixir"
    ZSH_THEME_EXL_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_EXL_PROMPT_PREFIX$EXL_VERSION$ZSH_THEME_EXL_PROMPT_SUFFIX"
  fi
}

local exl_info='$(exl_prompt_info)'

# Erlang info
erl_prompt_info() {
  if which erl 2>/dev/null 1>/dev/null && [ ! -z `ls | grep \.erl$ | head -1` ] || [ ! -z `ls | grep \.escript$ | head -1` ]; then
    ERL_VERSION=`erl -eval 'io:format("~s~n", [erlang:system_info(otp_release)]), halt().' -noshell`
    ZSH_THEME_ERL_PROMPT_PREFIX="$FG[124]erlang"
    ZSH_THEME_ERL_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_ERL_PROMPT_PREFIX$ERL_VERSION$ZSH_THEME_ERL_PROMPT_SUFFIX"
  fi
}

local erl_info='$(erl_prompt_info)'

# Ruby info
ruby_prompt_info() {
  if which ruby 2>/dev/null 1>/dev/null && [ ! -z `ls | grep \.rb$ | head -1` ]; then
    RUBY_VERSION=`ruby -v | awk '{print $2}'`
    ZSH_THEME_RUBY_PROMPT_PREFIX="%{$FG[161]%}ruby"
    ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$reset_color%}"
    echo "$ZSH_THEME_RUBY_PROMPT_PREFIX$RUBY_VERSION$ZSH_THEME_RUBY_PROMPT_SUFFIX"
  fi
}

local ruby_info='$(ruby_prompt_info)'

RPROMPT="${docker_info} ${npm_info}  ${node_info}  ${python_info}  ${go_info}  ${exl_info}  ${erl_info}  ${ruby_info} "
