// SPDX-License-Identifier: MIT
pragma solidity >=0.8.26 <0.9.0;  // this is the solidity version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    bool hasFavoriteNumber = false;
    uint256 favoriteNumber = 88;
    int favoriteNumberInt = -88;
    string favoriteNumberInText = "88";
    address myAddress = 0xb16Cba5320534C57d7B70681f6be69FCcaB5EEd9;
    bytes8 favoriteBytes32 = "swaroop"; //0x12323232
    
    // favoriteNumberUint is initialized to 0 if no value given
    uint256 favoriteNumberUint; //0
}

