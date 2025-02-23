// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;  // this is the solidity version

import {SimpleStorage, SimpleStorage1} from "./simple_storage.sol";

contract StorageFactory {
    // uint256 public favoriteNumber
    // type visibility name
    SimpleStorage[] public listOfsimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfsimpleStorageContracts.push(newSimpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listOfsimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfsimpleStorageContracts[_simpleStorageIndex];
        //return listOfsimpleStorageContracts[_simpleStorageIndex].retrieve();
        return  mySimpleStorage.retrieve();

    } 
}