// SPDX-License-Identifier: MIT
// array, structure, mapping

pragma solidity ^0.8.8;

contract arrayIntro{
   
    struct People{
        uint256 favouriteNumber;
        string name;
    }

    mapping(uint256 => string) public favouriteNumbertoName; //it's like dictionary 

    People[] public people;

    //calldata: temporary variable that can't be modified ,
    //memory: temporary variable that can be modified and Storage: permanent variable that can be modified

    function addPerson(uint256 _favouriteNumber, string memory _name) public{
        people.push(People(_favouriteNumber,_name));

        favouriteNumbertoName[_favouriteNumber] = _name; // mapping implementation
    }
}