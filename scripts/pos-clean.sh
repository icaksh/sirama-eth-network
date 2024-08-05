#!/bin/bash -e
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

# pruning and clean docker images and dangling images
docker system prune -a

# delete all data files
sudo rm -rf ./pos/consensus/*
sudo rm -rf ./pos/data/*