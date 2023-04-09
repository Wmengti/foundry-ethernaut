// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/coinflip.sol";

contract Coinflip is Test {
    CoinFlip public contractInstance;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() public {
        contractInstance = new CoinFlip();
    }

    function testFlipTen() public {
        uint256 re = uint256(blockhash(block.number - 1)) / FACTOR;
        bool side = re == 1 ? true : false;
        console2.log(side);
        assertEq(true, contractInstance.flip(side));
    }
}
