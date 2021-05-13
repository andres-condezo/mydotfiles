# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/adrs/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"
#Set spacship prompt
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_USER_SHOW=always
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_DIR_TRUNC=0

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	zsh-autosuggestions
	colored-man-pages
	zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration


#---------------------------------------------------------------
#------------------- VIM MODE ----------------------------------

# vi mode
bindkey -v
export KEYTIMEOUT=20

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -M viins 'ii' vi-cmd-mode

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# bindkey jj vi-cmd-mode
# bindkey -s jj '\e'

# VIM_MODE_VICMD_KEY='^D'

# ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, di{ etc..
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

#------------------- FIN VIM MODE ----------------------------------
#---------------------------------------------------------------

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"



#---------------------------------------------------------------
#------------------- ALIAS ----------------------------------

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias c:="cd /mnt/c"
alias d:="cd /mnt/d"
alias e:="cd /mnt/e"
alias cl="clear; ls"
alias clr="clear"
alias webdev="/mnt/d/webDevelopment"
alias proyectos="/home/adrs/proyectos"
alias pz="/mnt/d/Documentos/platzi"
alias lv="nvim -c':e#<1'"
alias vrc="nvim ~/.vimrc"
alias zrc="nvim ~/.zshrc"
alias brc="nvim ~/.bashrc"
alias x=exit
alias cli="clip.exe"
alias clip="tr -d '\n' | clip.exe && echo 'copied to clipboard'"
alias cpwd="pwd | tr -d '\n' | clip.exe && echo 'pwd copied to clipboard'"
alias gdf='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias v="nvim"
alias e="emacs"
alias nf='neofetch'
alias docd='/mnt/d/Documentos'
alias py='python3'
alias ipy='ipython3'
alias hol='cd /mnt/d/Documentos/Holberton'
alias rng='ranger'

#---------------------------------------------------------------
#------------------- FUNCTIONS ----------------------------------

c(){
folder="compilers/"
  if [[ ! -d $folder   ]]; then
    mkdir $folder
  fi
  entry=$(echo "$1" | sed 's/\(\w\)\(\.c\)/\1/g')
  cc -o $entry $1
  mv $entry $folder
  ./$folder/$entry
}

ctrlz() {
  if [[ $#BUFFER == 0 ]]; then
    fg >/dev/null 2>&1 && zle redisplay
  else
    zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz

# Use ranger to switch directories and bind it to ctrl-p
rngcd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        # [ --datadir "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^p' 'rngcd\n'

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# overload-tab () {
# if (( CURSOR < 1 ))
# then zle your-new-widget
# else zle expand-or-complete
# fi
# }
# zle -N overload-tab
# bindkey $'\t' overload-tab

#----------------------------------------------------------------
#-------------------  BINDKEYS ----------------------------------

bindkey -M menuselect '^M' .accept-line
bindkey '^ ' autosuggest-accept

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#---------------------------------------------------------------
#-------------------  EXPORTS ----------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR='nvim'
export VISUAL='nvim'

LS_COLORS=$LS_COLORS:'tw=01;35:ow=01;35:' ;
export LS_COLORS

export LD_PRELOAD="/home/adrs/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
