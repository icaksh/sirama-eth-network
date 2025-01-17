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

# Download and execute the Docker installation script
curl -fsSL https://get.docker.com | bash
sudo sh get-docker.sh

# Set Permission Docker
sudo chmod 666 /var/run/docker.sock