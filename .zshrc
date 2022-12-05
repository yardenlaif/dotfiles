# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yarden/.oh-my-zsh"

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
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git tmux)
ZSH_TMUX_AUTOSTART=false

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
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
function netpid() {
	lsof -n -i4TCP:$1
}
export PATH=/Users/yarden/.nuget/NuGet:/usr/local/share/dotnet:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yarden/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yarden/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yarden/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yarden/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$PATH:/usr/local/opt/binutils/bin
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Yarden Configuration
# Rust
. "$HOME/.cargo/env"
export PATH="$PATH:~/.cargo/bin"
export PATH="$PATH:~/.cargo/bin:~/go/bin"

alias vim="nvim"
alias editbash="nvim /Users/yarden/.zshrc && source /Users/yarden/.zshrc"
alias loadbash=". /Users/yarden/.zshrc"
alias editmappings="nvim /Users/yarden/.config/nvim/lua/user/mappings.lua"
alias editnvim="nvim /Users/yarden/.config/nvim/init.lua"
alias editplugins="nvim /Users/yarden/.config/nvim/lua/user/plugins.lua"
alias edittmux="vim ~/.tmux.conf && tmux source-file ~/.tmux.conf"

function copyfile { cat $1 | pbcopy }
function gvm {
	export PATH=/Users/yarden/go/go$1:$PATH
	export PATH=/Users/yarden/go/go$1/bin:$PATH
	export PATH=/Users/yarden/go/go$1/pkg/tool/darwin_amd64:$PATH
}
function hex { python3 -c "print(hex($1))" }
function dec { python3 -c "print($1)" }
function xor { python3 -c "print(hex($1 ^ $2))" }

source /Users/yarden/.rookout_env
