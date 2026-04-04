
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[157]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[210]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX="%{$FG[218]%}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%{$reset_color%} "

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$FG[210]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT='%(?, ,%{$FG[210]%}FAIL%{$reset_color%}
)
%{$FG[183]%}%n%{$reset_color%}@%{$FG[216]%}%m%{$reset_color%}: %{$FG[153]%}%~%{$reset_color%}$(git_prompt_info) $(virtualenv_prompt_info)%{$FG[228]%}[%*]%{$reset_color%}
$(prompt_char) '

RPROMPT=''
