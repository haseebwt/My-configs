# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously


# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
#HISTSIZE=1000000
#SAVEHIST=1000000
#HISTFILE="$XDG_CACHE_HOME/.zsh_history" # move histfile to cache
#HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved
#
# fzf setup
# source <(fzf --zsh) # allow for fzf history widget


# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word
# ctrl J & K for going up and down in prev commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward
bindkey '^R' fzf-history-widget


# open fff file manager with ctrl f
# openfff() {
#  fff <$TTY
#  zle redisplay
#}
#zle -N openfff
#bindkey '^f' openfff

# Git vairables:
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#111111} ☂%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{#111111} ✭%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{#111111} ☀%f"

# set up prompt
NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#FDF435}%F{#111111} $(date +%_I:%M%P) %K{#FCFCFC}%F{#111111} %n %K{#9d59d2}%F{#111111} %~ %K{#2c2c2c}%F{#e1d9c6}${git_current_branch} %f%k ❯ " # nonbinary theme
# PROMPT="${NEWLINE}%K{#2E3440}%F{#E5E9F0}$(date +%_I:%M%P) %K{#3b4252}%F{#ECEFF4} %n %K{#4c566a} %~ %f%k ❯ " # nord theme
# PROMPT="${NEWLINE}%K{#32302f}%F{#d5c4a1} $0 %K{#3c3836}%F{#d5c4a1} %n %K{#504945} %~ %f%k ❯ " # warmer theme
# PROMPT="${NEWLINE}%K{$COL0}%F{$COL1}$(date +%_I:%M%P) %K{$COL0}%F{$COL2} %n %K{$COL3} %~ %f%k ❯ " # pywal colors, from postrun script

# putting a variable?
WELC=$'hello :3'

echo -e "${NEWLINE}\033[48;2;255;226;238;38;2;35;35;35m ${WELC} \033[0m\033[48;2;255;182;215;38;2;35;35;35m $(uptime -p | cut -c 4-) \033[0m\033[48;2;254;141;192;38;2;35;35;35m $(uname -r) \033[0m" # nord theme
# echo -e "${NEWLINE}\x1b[38;5;137m\x1b[48;5;0m it's$(date +%_I:%M%P) \x1b[38;5;180m\x1b[48;5;0m $(uptime -p | cut -c 4-) \x1b[38;5;223m\x1b[48;5;0m $(uname -r) \033[0m" # warmer theme

# autosuggestions
# requires zsh-autosuggestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
# requires zsh-syntax-highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
