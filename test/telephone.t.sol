// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../src/coinflip.sol";

contract Coinflip is Test {
    CoinFlip public contractInstance;

    function setUp() public {
        contractInstance = new CoinFlip();
    }

    function testFlipTen() public {}
}
