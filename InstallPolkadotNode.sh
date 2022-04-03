#!/bin/bash

# To change the version of the repo, check the version https://github.com/paritytech/polkadot/releases and replace the version that you want to use
# you can change the name of the node, for this example is "jamcarbon_PokadotFullNode"

sudo docker run -p 9944:9944 -p 9615:9615 parity/polkadot:v0.9.18 --name "jamcarbon_PokadotFullNode" --rpc-external --ws-external --prometheus-external ;

echo "Polkadot Node has been sucesfully deployed"