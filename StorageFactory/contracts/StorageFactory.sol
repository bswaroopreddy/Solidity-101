// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; // stating our version  >=0.8.18 <0.9.0
import "./SimpleStorage.sol";

import {SimpleStorage} from "./SimpleStorage.sol";


contract StorageFactory {
    //SimpleStorage public simpleStorage;
     SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract () public {
        //simpleStorage = new SimpleStorage();
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sStore (uint256 _simpleStorageIndex, uint256 _favouriteNumber) public {
       // simpleStorage.store(_favouriteNumber);

       // address
       // ABI - Application Binary Interface
       listOfSimpleStorageContracts[_simpleStorageIndex].store(_favouriteNumber);
    }

    function sfGet (uint256 _simpleStorageIndex) public view returns (uint256) {
       return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}