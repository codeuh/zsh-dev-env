
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{#FF4971}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#B52A5B}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX="%F{#F18FB0}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%f "

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%F{#B52A5B}#%f"; else echo $; fi
}

PROMPT='%(?, ,%F{#B52A5B}FAIL%f
)
%F{#8897F4}%n%f@%F{#E9729D}%m%f: %F{#bd93f9}%~%f$(git_prompt_info) $(virtualenv_prompt_info)%F{#f1c4e0}[%*]%f
$(prompt_char) '

RPROMPT=''
