// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/telephonecall.sol";
import "forge-std/Script.sol";

contract tellphoneScript is Script {
    TelephoneCAll public instance;

    function setUp() public {
        instance = new TelephoneCAll();
    }

    function run() public {
        vm.startBroadcast();
        instance.callChange(0xb1BfB47518E59Ad7568F3b6b0a71733A41fC99ad);
        address ownAddress = instance.getOwner();
        vm.stopBroadcast();
    }
}
