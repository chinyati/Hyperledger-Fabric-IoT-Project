echo "Generate crypto materials"
cryptogen generate --config=./crypto-config.yaml

echo "Build the genesis block"
configtxgen -profile SampleMultiNodeEtcdRaft -channelID byfn-sys-channel -outputBlock ./channel-artifacts/genesis.block

echo "Create the channel config transaction"
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID ebenezer
