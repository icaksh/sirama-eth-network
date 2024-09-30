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

amount=32000000000
smin=0
smax=1

eth2-val-tools deposit-data \
  --source-min=$smin \
  --source-max=$smax \
  --amount=$amount \
  --fork-version=0x10000131 \
  --withdrawals-mnemonic="chicken hammer oil evidence arch ghost nephew accuse oven airport fiber spice define point name wool female blouse assault senior disagree bronze prize lounge" \
  --validators-mnemonic="chicken hammer oil evidence arch ghost nephew accuse oven airport fiber spice define point name wool female blouse assault senior disagree bronze prize lounge" > testnet_deposit_$smin\_$smax.txt

while read x; do
   account_name="$(echo "$x" | jq '.account')"
   pubkey="$(echo "$x" | jq '.pubkey')"
   echo "Sending deposit for validator $account_name $pubkey"
   ethereal beacon deposit \
      --allow-unknown-contract=true \
      --address="0x11319760736562656c61736d6172657400000000" \
      --connection=./pos/data/geth.ipc \
      --data="$x" \
      --allow-excessive-deposit \
      --value="$amount" \
      --from="0x6416C43ab43FD14A31B71A5FeC3511e0771ECBBD" \
      --privatekey="ffedbead68e47c2de7e21632799e1af0e52f9eb2da67252268f1ea865b97d5c6"
   echo "Sent deposit for validator $account_name $pubkey"
   sleep 2
done < a.txt
