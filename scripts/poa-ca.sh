#!/bin/sh
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

create_account(){
    first_rand=$(date | md5sum | sha256sum)
    sec_rand=$(date +s% | sha256sum)
    last_rand=$(echo "$first_rand uns $sec_rand" | sha256sum)
    pass="UNS-$last_rand"
    echo $pass >> ./poa/password.txt
    account=$(docker run -it --rm -v $(pwd)/poa:/app etclabscore/core-geth:version-1.12.14 account new --datadir /app/data --password /app/password.txt)
    # account=$(geth account new --datadir /chain/data --password /chain/password)
    echo $account | grep -oE '0x[0-9a-fA-F]{40}' >> ./poa/account.txt
}

main(){
    create_password
    create_account
    account=$(cat ./poa/account.txt)
    echo
    echo "Address: $account"
    echo
    echo "[OK]"
}

main


