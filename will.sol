// SPDX-License-Identifier: MIT
pragma solidity >=0.8.31 <0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;

    // Constructor is a special type of function executes when contract deployed
    constructor() payable {
        owner = msg.sender;   // msg sender represents address that is being called
        fortune = msg.value;  // msg value tells us how much ether 
        deceased = false;
    }

    // create a modifier so the only person who can call the contract is the owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    // create a modifier so that we only allocate funds if friend;s gramps deceased
    modifier mustBeDeceased {
        require(deceased == true);
        _;
    }

    // list of family wallets
    address payable[] familyWallets;

    // map through inheritance
    mapping(address => uint256) inheritance;

    // [1,2,3,4,5]
    // ['Green', 'Blue', 'White']

    function setInheritance(address payable wallet, uint amount) public onlyOwner {
        // to add wallets to the family wallets .push
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    // Pay each family memeber based on their wallet address
    function payout() private mustBeDeceased {
        // for loop you can loop through
        for(uint i = 0; i < familyWallets.length ; i++) {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    } 

    function isDeceased() public onlyOwner {
        deceased = true;
        payout();
    } 

}