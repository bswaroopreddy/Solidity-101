// SPDX-License-Identifier: MIT
pragma solidity >=0.8.26 <0.9.0;  // this is the solidity version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    bool hasFavoriteNumber = false;
    uint256 public favoriteNumber;
    int favoriteNumberInt = -88;
    string favoriteNumberInText = "88";
    address myAddress = 0xb16Cba5320534C57d7B70681f6be69FCcaB5EEd9;
    bytes8 favoriteBytes32 = "swaroop"; //0x12323232
    
    // favoriteNumberUint is initialized to 0 if no value given
    uint256 favoriteNumberUint; //0

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        favoriteNumber = favoriteNumber + 1;
    } 

    // 0xd9145CCE52D386f254917e481eB44e9943F39138

    // view - Read state from the Blockchain and dis allow updating state
    // pure - Read constants
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    function retrieveConst() public pure returns(uint256) {
        return 11;
    }
}

