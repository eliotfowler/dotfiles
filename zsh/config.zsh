export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# Script for ensuring only one instance of gpg-agent is running
# and if there is not one, start an instance of gpg-agent.
if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
	GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
	SSH_AUTH_SOCK=`cat $HOME/.ssh-auth-sock`
	SSH_AGENT_PID=`cat $HOME/.ssh-agent-pid`
	export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID
else
	#eval `gpg-agent --daemon`
	echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
	echo $SSH_AUTH_SOCK > $HOME/.ssh-auth-sock
	echo $SSH_AGENT_PID > $HOME/.ssh-agent-pid
fi
# Imperative that this environment variable always reflects the output
# of the tty command.
#GPG_TTY=`tty`
#export GPG_TTY
