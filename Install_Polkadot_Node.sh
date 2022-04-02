
docker run --rm -it parity/polkadot:v0.9.18 polkadot --version

docker run --rm -it -p 30333:30333 -p 9933:9933 -v /my/local/folder/:/data parity/polkadot:v0.9.18 polkadot --chain alex --name "jamca_PokadotFullNode"

#you can change the name of the node, for this example is "jamcarbon_PokadotFullNode"

docker run -p 9944:9944 -p 9615:9615 parity/polkadot:v0.9.18 --name "jamcarbon_PokadotFullNode" --rpc-external --ws-external --prometheus-external

