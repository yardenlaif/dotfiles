#!/bin/bash
set -eo pipefail
IFS=$'\n\t'

# Desktop configuration
## Autohide dock
desktop() {
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true && gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false && gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
}

# Git configuration
git-conf() {
	git config --global core.editor "vim"
	git config --global core.excludesFile '~/.gitignore'
	git config --global user.email "ylaifenfeld@gmail.com"
	git config --global user.name "Yarden Laifenfeld"
	git config --global alias.ca 'commit --amend --no-edit'
}

# # Install terminal packages
base() {
	sudo apt install kitty vim tmux zsh bat curl xclip net-tools playerctl ripgrep gcc
	sudo snap install nvim --classic
	mkdir -p ~/utils
}

# Install Rust
rust() {
	curl https://sh.rustup.rs -sSf | sh
	source ~/.cargo/env
}

# Install go
go() {
	curl -sL https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | bash
	export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"
	gobrew install latest
}

# Install nodejs
nodejs() {
	sudo apt install dirmngr gpg curl gawk
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf install nodejs latest
	asdf global nodejs latest
}

# Install Java
java() {
	curl -s "https://get.sdkman.io" | bash
	source ~/.sdkman/bin/sdkman-init.sh
	sdk install java 22.0.1-open
}

# Install pip
pip() {
	sudo apt install python3-pip pipx python-is-python3
}

# Install nvim packages
## General
## Language specific
### Shell
nvim_shell() {
	sudo snap install beautysh --classic
	curl -sS https://webi.sh/shfmt | sh
	source ~/.config/envman/PATH.env
	cargo install shellharden
}
### Go
nvim_go() {
	go install golang.org/x/tools/cmd/goimports@latest
	go install golang.org/x/tools/gopls@latest
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin v1.54.2
	go install honnef.co/go/tools/cmd/staticcheck@latest
	go install github.com/mgechev/revive@latest
}

### Java
nvim_java() {
	wget https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.29.0/jdt-language-server-1.29.0-202310261436.tar.gz -O jdtls.tar.gz
	mkdir ~/utils/jdtls
	sudo tar -xvf jdtls.tar.gz -C ~/utils/jdtls
	sudo apt install clang-format
}
### C
nvim_c() {
	sudo apt install clangd
}
### HTML
nvim_html() {
	wget https://github.com/htacg/tidy-html5/releases/download/5.8.0/tidy-5.8.0-Linux-64bit.deb
	sudo dpkg -i tidy-5.8.0-Linux-64bit.deb
	rm tidy-5.8.0-Linux-64bit.deb
}
### asm
nvim_asm() {
	sudo apt install pkg-config libssl-dev
	cargo install asm-lsp
}
### Rust
nvim_rust() {
	rustup component add rust-analyzer
	cargo install ra-multiplex
	echo "
	[Unit]
	Description=Rust analyzer multiplex server

	[Service]
	User=$USER
	Type=simple
	ExecStart=/home/$USER/.cargo/bin/ra-multiplex server
	Environment=PATH=/home/$USER/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

	[Install]
	WantedBy=default.target
	" > ./ra-mux.service
	sudo mv ra-mux.service /etc/systemd/system
	sudo systemctl enable ra-mux.service
	sudo service ra-mux start
}

## Docker
### Add Docker's official GPG key:
docker() {
	sudo apt-get update
	sudo apt-get install ca-certificates curl gnupg
	sudo install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	## Add the repository to Apt sources:
	echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	## Install docker
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	## Add current user to docker group
	sudo usermod -aG docker $USER
	newgrp docker
}

# GCloud
gcloud() {
	sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo
	# TODO: Why doesn't this work?
	#sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
	#echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	#curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc
	#sudo apt-get update && sudo apt-get install google-cloud-cli
}

## Kubernetes
### kubectl
kubectl() {
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
}
### minikube
minikube() {
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
	sudo dpkg -i minikube_latest_amd64.deb
}

## Zsh themes and plugins
zsh() {
	mkdir -p ~/.config/zsh
	sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
	git clone https://github.com/sindresorhus/pure.git ~/.config/zsh/pure
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	chsh -s "$(which zsh)"
	echo 2 | sudo update-alternatives --config x-terminal-emulator
}

## Tmux theme and plugins
tmux() {
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

## Font
font() {
	mkdir -p ~/.fonts/
	cd ~/.fonts/
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip
	unzip UbuntuMono.zip
	fc-cache -fv
	cd -
}

wiz() {
	if ! command -v twingate; then
		curl -s https://binaries.twingate.com/client/linux/install.sh | sudo bash
		sudo twingate setup
		twingate desktop-start
	fi
	sudo snap install task --classic
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt update
	sudo apt install lld libelf-dev libssl-dev flex bison clang-15 pipenv python3.10-dev ssh-askpass ca-certificates curl wget gnupg lsb-release
	curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	# Install Docker repo
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	# Install packages
	sudo apt update && sudo apt install git docker-ce docker-ce-cli containerd.io
        sudo snap install aws-cli --classic
}

pwndbg() {
	ORIGINALWD=$PWD
	cd ~/utils
	git clone https://github.com/pwndbg/pwndbg
	cd pwndbg
	./setup.sh
	cd $ORIGINALWD
}

# Links
link() {
	ln -s "$PWD"/nvim/ ~/.config
	ln -s "$PWD"/.tmux.conf ~/.tmux.conf
	ln -s "$PWD"/zshrc ~/.zshrc
	ln -s "$PWD"/kitty/ ~/.config/
	ln -s "$PWD"/scripts ~/.scripts
	ln -s "$PWD"/gitignore ~/.gitignore
	touch ~/.sensitiverc
}

windows-sensor() {
	rustup target add x86_64-pc-windows-gnu
	sudo apt install mingw-w64 nasm
	echo "You need docker username and pass for this next step:"
	docker login wiziosensor.azurecr.io
}

case "$1" in
	"")
		desktop
		base
		git-conf
		rust
		go
		nodejs
		java
		pip
		nvim_shell
		nvim_go
		nvim_java
		nvim_c
		nvim_html
		nvim_asm
		docker
		gcloud
		kubectl
		minikube
		zsh
		font
		tmux
		echo "DONE FULL INSTALL"
		;;
	"nvim")
		nvim_shell
		nvim_go
		nvim_java
		nvim_c
		nvim_html
		nvim_asm
		;;
	"rust")
		rust;;
	"git-conf")
		git-conf;;
	"link")
		link;;
	"pwndbg")
		pwndbg;;
	"wiz")
		wiz;;
	"docker")
		docker;;
	"gcloud")
		echo "fix gcloud!";;
	"kubernetes")
		kubectl
		minikube
		;;
	"kubectl")
		kubectl;;
	"minikube")
		minikube;;
	"zsh")
		zsh;;
	"font")
		font;;
	"tmux")
		tmux;;
	*)
esac
