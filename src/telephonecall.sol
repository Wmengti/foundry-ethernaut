// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./telephone.sol";

contract TelephoneCAll {
    Telephone public tl;

    constructor() {
        tl = Telephone(0xf9c7add147B0D77a0E4B25460EF3c380f1bacC36);
    }

    function callChange(address sender) public {
        tl.changeOwner(sender);
    }

    function getOwner() public view returns (address) {
        return tl.owner();
    }
}
