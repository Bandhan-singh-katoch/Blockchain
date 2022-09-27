// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minUsd = 50*1e18;

    function fund() public payable{
        require(getConversionRate(msg.value) >= minUsd, "You need to send more ETH"); // 1e18 = 1eth      // 18 decimal places  
    }

    function getPrice() public view returns(uint256){
        //ABI
        //Address : 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,) = priceFeed.latestRoundData();
        //ETH in term of usd
        return uint256(price * 1e18);

    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e).version();
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;
    }
}