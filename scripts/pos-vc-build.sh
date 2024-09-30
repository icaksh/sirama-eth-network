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

docker run -it --rm -v $(pwd)/pos/validator_keys:/app/validator_keys engramnet/staking-deposit-cli:dencun existing-mnemonic --num_validators=2 --validator_start_index=0
