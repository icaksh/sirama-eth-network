#!/bin/bash
# 
# This project was a thesis project for PP2712801
# at Sebelas Maret University
#
# The copyright holder grant the freedom to copy, modify, 
# convey, adapt, and/or redistribute this work
# under the terms of the BSD 3-Clause License.
#
# Palguno Wicaksono <hello@icaksh.my.id>
#
#

printf "Installing All Dependencies...\n";
sudo apt-get install gcc jq clang curl wget llvm chrony g++ -y

# Clone the asdf repository
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# Add asdf to the current shell session
. "$HOME/.asdf/asdf.sh" >> $HOME/.bashrc
. "$HOME/.asdf/completions/asdf.bash" >> $HOME/.bashrc

# Source the updated .bashrc
source $HOME/.bashrc

# Display a message indicating successful installation
echo "asdf-vm installed successfully."

# Download Golang binary using asdf-vm
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.21.3
asdf global golang 1.21.3

# Installing eth2-val-tools to adding new mnemonics
go install github.com/protolambda/eth2-val-tools@latest
go install github.com/wealdtech/ethereal@latest
go install github.com/protolambda/eth2-testnet-genesis@latest

# Move eth2-val-tools
sudo mv $HOME/.asdf/installs/golang/1.21.3/packages/bin/eth2-val-tools /usr/local/bin
sudo mv $HOME/.asdf/installs/golang/1.21.3/packages/bin/ethereal /usr/local/bin
sudo mv $HOME/.asdf/installs/golang/1.21.3/packages/bin/eth2-testnet-genesis /usr/local/bin
