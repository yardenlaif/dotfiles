if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u -2
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

plugins=(git sdk golang asdf kubectl zsh-autosuggestions zsh-syntax-highlighting)

export PATH=$PATH:/usr/local/opt/binutils/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$HOME/.nuget/NuGet:/usr/local/share/dotnet:$PATH
export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$HOME/go/bin:$PATH"
export LC_ALL='en_IN.UTF-8'
export LANG="en_IN.UTF-8"


# Rust
if [ -f "$HOME/.cargo/env" ];
then
	. "$HOME/.cargo/env"
	export PATH="$PATH:~/.cargo/bin"
	export PATH="$PATH:~/.cargo/bin:~/go/bin"
fi

alias vim="nvim"
alias editbash="nvim $HOME/.zshrc && source $HOME/.zshrc"
alias loadbash=". $HOME/.zshrc"
alias editmappings="nvim $HOME/.config/nvim/lua/user/mappings.lua"
alias editnvim="nvim $HOME/.config/nvim/init.lua"
alias editplugins="nvim $HOME/.config/nvim/lua/user/plugins.lua"
alias edittmux="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"

export GCM_CREDENTIAL_STORE=plaintext

if [ $(uname -s) = "Linux" ]
then
	function copyfile {
		cat $argv[1] | xclip -selection clipboard
	}
elif [ $(uname -s) = "Darwin" ]
then
	function copyfile { cat $1 | pbcopy }
	function netpid() {
		lsof -n -i4TCP:$1
	}
fi

function hex { python3 -c "print(hex($1))" }
function dec { python3 -c "print($1)" }
function xor { python3 -c "print(hex($1 ^ $2))" }
function gh-action {
	gh run list -b `git branch --show-current` --limit 1
}

alias cat="batcat"
alias bgrep="batgrep"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
unsetopt share_history

source ~/.sensitiverc

zstyle ':autocomplete:*' insert-unambiguous no
# no:  Tab inserts the top completion.
# yes: Tab first inserts a substring common to all listed completions, if any.

zstyle ':autocomplete:*' fzf-completion yes
# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# ⚠️ NOTE: This setting can NOT be changed at runtime and requires that you
# have installed Fzf's shell extensions.
zstyle ':autocomplete:*' widget-style complete-word
# complete-word: (Shift-)Tab inserts the top (bottom) completion.
# menu-complete: Press again to cycle to next (previous) completion.
# menu-select:   Same as `menu-complete`, but updates selection in menu.
# ⚠️ NOTE: This setting can NOT be changed at runtime.

LESSOPEN="|/usr/local/bin/batpipe %s";
export LESSOPEN;
unset LESSCLOSE;
LESS="$LESS -R";
BATPIPE="color";
export LESS;
export BATPIPE;
export PATH=$PATH:~/utils/jdtls/bin:/home/yarden/utils/idea/bin:/home/yarden/.asdf/bin
alias dis="cstool -d x64"

function rsed {
	find . -type f -exec sed -i $1 {} +
}
export JAVA_11=~/.sdkman/candidates/java/11.0.12-open
export JAVA_12=~/.sdkman/candidates/java/17.0.6-oracle
export JAVA_8=~/.sdkman/candidates/java/8.0.302-open
export JAVA_9=~/.sdkman/candidates/java/11.0.12-open
export JAVA_HOME_11=~/.sdkman/candidates/java/11.0.12-open
export JAVA_HOME_12=~/.sdkman/candidates/java/17.0.6-oracle
export JAVA_HOME_17=~/.sdkman/candidates/java/17.0.6-oracle
export JAVA_HOME_8=~/.sdkman/candidates/java/8.0.302-open
export JAVA_HOME_7=~/.sdkman/candidates/java/7.0.352-zulu
export JAVA_HOME_6=~/.sdkman/candidates/java/6.0.119-zulu
export JAVA_HOME_9=~/.sdkman/candidates/java/11.0.12-open
export JAVA_HOME_21=~/.sdkman/candidates/java/21-open
export GRADLE_USER_HOME=$GRADLE_HOME
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
setopt NO_BEEP
export PRESET=linux-x86-64-debug
export DT_ENABLE_TEST_TRACING_FOR_DEV=true
export PATH=~/utils/cmake/bin:~/utils/protoc/bin:$PATH

function vm() {
	mv $2 $1
}

export PATH=$PATH:~/projects/dotfiles/scripts/:~/.local/bin/

export PATH=~/utils/depot_tools:~/utils/lua-language-server/bin:$PATH

alias diff=nvim -d
alias chmox="chmod +x"
function suid {
	sudo chown -R root:root $1
	sudo chmod +s $1
}
function unsuid {
	sudo chown -R yarden:yarden $1
	sudo chmod -s $1
}

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
eval "$(task --completion zsh)"

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

fpath+=($HOME/.config/zsh/pure)
autoload -U promptinit; promptinit
prompt pure
