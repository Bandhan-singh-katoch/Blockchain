// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

    uint256 public minUsd = 50*1e18;
    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;

    function fund() public payable{
        require(msg.value.getConversionRate() >= minUsd, "You need to send more ETH"); // 1e18 = 1eth      // 18 decimal places  
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public{
        // filling the arrayfunder value with 0 value
        for(uint256 funderIndex = 0; funderIndex<funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](0);
    }
}