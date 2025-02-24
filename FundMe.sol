// Fund money to users
// Withdraw 
// Set minimum amount to transfer

// SPDX-Licence-Identifier: MIT

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {PriceConverter} from "./priceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    
    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    // Allow function to sent value (payable) in native cryptocurrency
    function fund() public payable {
        // Allow users to send $
        // Have a minimum $ sent

        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");  // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10^18

        // what is a revert?
        // Undo any actions that have been done, and send the remaining gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw() public {

    // }

}
