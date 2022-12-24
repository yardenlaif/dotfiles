if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

function trySource {
	if [ -f $1 ]
	then
		source $1
	fi
}

export PATH=$HOME/.nuget/NuGet:/usr/local/share/dotnet:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# The next line updates PATH for the Google Cloud SDK.
trySource "$HOME/google-cloud-sdk/path.zsh.inc" 

# The next line enables shell command completion for gcloud.
trySource "$HOME/google-cloud-sdk/completion.zsh.inc" 
export PATH=$PATH:/usr/local/opt/binutils/bin
if [ -f "/usr/local/bin/kubectl" ]; then source <(kubectl completion zsh); fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Yarden Configuration
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

if [ `uname -s` = "Linux" ]
then
	function copyfile {
		cat $argv[1] | xclip -selection clipboard
	}
elif [ `uname -s` = "Darwin" ]
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
