// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19; // stating our version  >=0.8.18 <0.9.0

contract SimpleStorage {
    // Basic types: boolean, uint, int, address, bytes, string
    // bool hasFavouriteNumber = false;
    // int256 favouriteNumber1 = -88;
    // string favouriteNumberText = "eighty-eight";
    // address myAddress = 0x35b2714d745aBf476ABB86841aC5a939bf5525e4;
    // bytes32 favouriteBytes32 = "cat";

    // internal variable
    uint256 myFavoriteNumber;  // initialized to 0 if no value is given // storage variable

    // public variable
    uint256[] public listOfFavoriteNUmbers; // storage variables

    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    // Person public pat = Person({favoriteNumber: 7, name: "Pat"});
    // Person public bob = Person({favoriteNumber: 10, name: "Bob"});
    // Person public alice = Person({favoriteNumber: 7, name: "Alice"});

    // Static array 
    //  Person[3] public listOfPeople;  // []


    // Dynamic array
    Person[] public listOfPeople;  // []  // Storage variables

    mapping(string => uint256) public nameToFavoritenumber;
    
    function store(uint256 _favouriteNumber) public {
        myFavoriteNumber = _favouriteNumber;
       // retrieve();
    }

    // view, pure
    function retrieve() public view returns (uint256){
        return myFavoriteNumber;
    } 

    // calldata - temporory variable that  can't be modified
    // memory - temporory variable that can be modified
    // storage - permanant variable
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //  Person memory newPerson  = Person(_favoriteNumber, _name);    or
         listOfPeople.push(Person(_favoriteNumber, _name));
         nameToFavoritenumber[_name] = _favoriteNumber;
    }
}



