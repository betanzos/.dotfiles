# This theme is inspired by https://github.com/tobyjamesthomas/pi


# Build the prompt
PROMPT=' ${return_status}${hostname}${pwd} %{$reset_color%}$(git_prompt_info)${prompt_suffix} '

local return_status="%(?:%{$fg_bold[green]%}β:%{$fg_bold[red]%}β)"

local hostname="%{$fg[yellow]%} [@$(hostname -s)]"

local pwd="%{$fg[cyan]%} %c"

local prompt_suffix="%{$fg[magenta]%}❯%{$reset_color%}"


# Override ZSH environment variables for Git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✓"
