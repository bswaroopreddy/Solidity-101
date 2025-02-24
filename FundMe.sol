// Fund money to users
// Withdraw 
// Set minimum amount to transfer


// 8,40,456 gas
    // 8,17,004 gas - after MINIMUM_USD to constanat
    // 790387 gas - after making owner to immutable
    

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

error noOwner();

// constant, immutability
import {PriceConverter} from "./priceConverter.sol";
contract FundMe {
    using PriceConverter for uint256;
    
    // constant and immutable variables store directly into the bytecode instead of storage
    uint256 public constant MINIMUM_USD = 5e18;
    // 347 - constant
    // 2446 - non-constant


    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner;
    // 439 gas - immutable
    //  2574 gas - non-immutable

    constructor() {
        i_owner = msg.sender;
    }
    
    // Allow function to sent value (payable) in native cryptocurrency
    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent

        require(msg.value.getConversionRate() >= MINIMUM_USD, "didn't send enough ETH");  // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10^18

        // what is a revert?
        // Undo any actions that have been done, and send the remaining gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

     function withdraw() public onlyOwner{
        // require(msg.sender == owner, "must be owner");
        
        // for loop
        // [1, 2, 3, 4] elements
        // 0, 1, 2, 3 indexes
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);
        // actually withdraw the funds

        // tramsfer
        payable(msg.sender).transfer(address(this).balance);

        // send
        bool sendSucceess =  payable(msg.sender).send(address(this).balance);
        require(sendSucceess, 'Send failed');

        // call
       (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
     }

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Sender is not owner!");
        if (msg.sender != i_owner) {
            revert noOwner();
        }
        _;
    }
}
