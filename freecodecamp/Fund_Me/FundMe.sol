// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract FundMe{
    function fund() public payable{
        require(msg.value >= 1e18, "You need to send more ETH"); // 1e18 = 1eth        
    }
}