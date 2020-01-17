local return_code="%(?..%{$bg[red]%}↵%?%{$reset_color%})"

PROMPT='%{$bg[black]$fg[white]%}[%*]%{$reset_color%}\
%(!.%{$fg[red]%}#.%{$fg[black]%}>)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$bg[blue]$fg[white]%}%~%{$bg[red]%}@$(hostname)$(git_prompt_info)%{$reset_color%}${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}%{$bg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✹%{$fg[black]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$reset_color%}%{$bg[blue]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%{$reset_color%} "
