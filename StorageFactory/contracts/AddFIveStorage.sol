// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; // stating our version  >=0.8.18 <0.9.0
import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns (string memory){
        return "Hello";
    }

    // +5
    // overrides
    // virtual overirdes
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}



