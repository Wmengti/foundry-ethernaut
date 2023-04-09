#!/bin/bash

# 设置变量
source .env
N=3
COMMAND="forge script ./script/coinflip.s.sol:coinFlipScript --private-key $PRIVATE_KEY --broadcast -vvvv --rpc-url $GOERLI_RPC_URL"

# 循环执行命令
for ((i=1; i<=N; i++)); do
  sleep 60
  echo "Running command ${i}..."
  $COMMAND
done
