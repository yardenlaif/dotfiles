if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux -u -2
fi

plugins=(git sdk golang asdf)

function trySource {
	if [ -f "$1" ]
	then
		source $1
	fi
}


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# The next line updates PATH for the Google Cloud SDK.
trySource "$HOME/google-cloud-sdk/path.zsh.inc" 

# The next line enables shell command completion for gcloud.
trySource "$HOME/google-cloud-sdk/completion.zsh.inc" 
export PATH=$PATH:/usr/local/opt/binutils/bin
if [ -f "/usr/local/bin/kubectl" ]; then source <(kubectl completion zsh); fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$HOME/.nuget/NuGet:/usr/local/share/dotnet:$PATH
export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$HOME/go/bin:$PATH"
export LC_ALL='en_IN.UTF-8'
export LANG="en_IN.UTF-8"
export TERM="tmux-256color"


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

trySource $HOME/.rookout_env


# Download Znap, if it's not there yet.
[[ -f ~/.config/zsh/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/.config/zsh/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

alias cat="batcat"
alias bgrep="batgrep"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
unsetopt share_history

source ~/.sensitiverc

zstyle ':autocomplete:*' insert-unambiguous yes
# no:  Tab inserts the top completion.
# yes: Tab first inserts a substring common to all listed completions, if any.

zstyle ':autocomplete:*' fzf-completion yes
# no:  Tab uses Zsh's completion system only.
# yes: Tab first tries Fzf's completion, then falls back to Zsh's.
# ⚠️ NOTE: This setting can NOT be changed at runtime and requires that you
# have installed Fzf's shell extensions.
zstyle ':autocomplete:*' widget-style menu-select
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
export PATH=$PATH:/home/yarden/.local/share/nvim/lsp_servers/jdtls/bin:/home/yarden/.pyenv/bin:/home/yarden/utils/idea/bin:/home/yarden/utils/protoc-3.11.2/bin/:/home/yarden/.asdf/bin
alias dis="cstool -d x64"


export PYENV_ROOT="$HOME/.pyenv"                                                               
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"                             
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
function rsed {
	find . -type f -exec sed -i $1 {} +
}
export ROOKOUT_LABELS=env:yarden
export JAVA_11=~/.sdkman/candidates/java/11.0.12-open
export JAVA_12=~/.sdkman/candidates/java/17.0.6-oracle
export JAVA_8=~/.sdkman/candidates/java/8.0.302-open
export JAVA_9=~/.sdkman/candidates/java/11.0.12-open
