# # Links
# ln -s "$PWD"/nvim/ ~/.config
# ln -s "$PWD"/.tmux.conf ~/.tmux.conf
# ln -s "$PWD"/zshrc ~/.zshrc
# ln -s "$PWD"/yardenrc ~/.yardenrc
# ln -s "$PWD"/kitty/ ~/.config

# # Git configuration
# git config --global core.editor "vim"

# # Install terminal packages
# sudo apt install kitty vim tmux zsh bat curl xclip net-tools
# sudo snap install nvim --classic
# # Zoxide
# curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
# eval "$(zoxide init zsh)"

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

# # Install Java
# curl -s "https://get.sdkman.io" | bash
# source "~/.sdkman/bin/sdkman-init.sh"

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
# curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.54.2
# go install honnef.co/go/tools/cmd/staticcheck@latest
# go install github.com/mgechev/revive@latest
# go install golang.org/x/tools/cmd/goimports@latest
# git clone https://github.com/golang/vscode-go
# cd ~/go
# cd vscode-go/extension
# npm install
# npm run compile
# cd -
# ### Python
# curl https://pyenv.run | bash
# sudo apt install python3.10-venv
# ### Java
# wget https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.29.0/jdt-language-server-1.29.0-202310261436.tar.gz -O jdtls.tar.gz
# mkdir /opt/jdtls
# sudo tar -xvf jdtls.tar.gz -C /opt/jdtls
# sudo cp jdt-langauge-server
# sudo apt install clang-format
# ### C
# sudo apt install clangd
# ### HTML
# wget https://github.com/htacg/tidy-html5/releases/download/5.8.0/tidy-5.8.0-Linux-64bit.deb
# sudo dpkg -i tidy-5.8.0-Linux-64bit.deb
# rm tidy-5.8.0-Linux-64bit.deb
# ### asm
# cargo install asm-lsp

# # Docker
# ## Add Docker's official GPG key:
# sudo apt-get update
# sudo apt-get install ca-certificates curl gnupg
# sudo install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# sudo chmod a+r /etc/apt/keyrings/docker.gpg
# ## Add the repository to Apt sources:
# echo \
#   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
#   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# ## Install docker
# sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# ## Add current user to docker group
# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker

# # GCloud
# sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo
# sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
# echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc
# sudo apt-get update && sudo apt-get install google-cloud-cli

# # Kubernetes
# ## kubectl
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# ## minikube
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
# sudo dpkg -i minikube_latest_amd64.deb

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

# # For Rookout
# sudo apt install -y fuse libffi-dev zlib1g-dev libedit-dev libc++-13-dev libc++abi-13-dev

# # Further instructions
# echo
# echo
# echo
# echo "What Now?"
# echo "	* Set git email and username"
# echo "	* Create github GHP key and place it in GITHUB_GHP_KEY environment variable (in ~/.sensitiverc)"
# echo "    * Install WebApp manager: http://packages.linuxmint.com/pool/main/w/webapp-manager/"
# echo "    * Add startup applications"
# echo "	* Restart machine to apply all new settings"
