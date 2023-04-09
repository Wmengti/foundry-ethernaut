// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../src/fallout.sol";

contract fallbackTest is Test {
    Fallout public fl;

    function setUp() public {
        fl = new Fallout();
    }

    function testOwner() public {
        address sender = address(0xb1BfB47518E59Ad7568F3b6b0a71733A41fC99ad);
        vm.startPrank(sender);
        vm.deal(sender, 10000000000000000000000000);

        fl.Fal1out{value: 0.0001 ether}();
        fl.allocatorBalance(sender);

        assertEq(fl.owner(), 0xb1BfB47518E59Ad7568F3b6b0a71733A41fC99ad);
    }
}
