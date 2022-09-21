// SPDX-License-Identifier: MIT

// types and functions

pragma solidity ^0.8.8;

contract SimpleStorage{
    uint256 public favouriteNumber;

    function store(uint256 _favouriteNumber) public{
        favouriteNumber = _favouriteNumber;
    }

    // pure and view doesn't costs gas but if a gas calling function calls them then it will cost gas

    function retrieve() public view returns(uint256){         // view and pure function disallows modification of state
        return favouriteNumber;                               // so we can't update our favouriteNumber
    }
}
