// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;  // this is the solidity version

import {SimpleStorage} from "./simple_storage.sol";

contract AddFiveStorage is SimpleStorage {
    // +5
    // override
    // override virtual
    function sayHello() public pure returns(string memory) {
        return "Hello!";
    }

    function store(uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber + 5;
    }
}