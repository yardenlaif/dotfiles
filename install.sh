# # Links
# ln -s "$PWD"/nvim/ ~/.config
# ln -s "$PWD"/.tmux.conf ~/.tmux.conf
# ln -s "$PWD"/zshrc ~/.zshrc
# ln -s "$PWD"/yardenrc ~/.yardenrc
# ln -s "$PWD"/kitty/ ~/.config

# # Install terminal packages
# sudo apt install kitty vim tmux zsh bat curl
# sudo snap install nvim --classic

# # Install Rust
# curl https://sh.rustup.rs -sSf | sh
# source ~/.cargo/env

# # Install go
# curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh
# gobrew install latest

# # Install nodejs
# sudo apt install dirmngr gpg curl gawk
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf
# asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# asdf install nodejs latest
# asdf global nodejs latest

# # Install pip
# cd /tmp
# wget https://bootstrap.pypa.io/get-pip.py
# python3 get-pip.py
# cd -

# # Install nvim packages
# ## General
# sudo apt install ripgrep fzf
# ## Language specific
# ### Lua
# cargo install stylua
# cd /tmp
# wget https://github.com/LuaLS/lua-language-server/releases/download/3.7.0/lua-language-server-3.7.0-linux-x64.tar.gz
# tar -xvf lua-language-server-3.7.0-linux-x64.tar.gz
# sudo cp bin/lua-language-server /usr/bin
# cd -
# ### Shell
# sudo snap install beautysh --classic
# curl -sS https://webi.sh/shfmt | sh
# source ~/.config/envman/PATH.env
# cargo install shellharden
# ### Go
# go install golang.org/x/tools/gopls@latest
# ### Python
# curl https://pyenv.run | bash

# # Zsh themes and plugins
# mkdir ~/.config/zsh
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/zsh-snap
# git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/pure

# # Tmux theme and plugins
# mkdir -p ~/.tmux/plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# # Update defaults
# chsh -s "$(which zsh)"
# echo 2 | sudo update-alternatives --config x-terminal-emulator

# # Further instructions
# echo
# echo
# echo
# echo "What Now?"
# echo "	* Create github GHP key and place it in GITHUB_GHP_KEY environment variable (in ~/.sensitiverc)"
# echo "    * Install WebApp manager: http://packages.linuxmint.com/pool/main/w/webapp-manager/"
# echo "    * Add startup applications"
# echo "	* Restart machine to apply all new settings"
