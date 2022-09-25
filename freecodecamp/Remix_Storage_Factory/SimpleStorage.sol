// SPDX-License-Identifier: MIT
// array, structure, mapping..

pragma solidity ^0.8.8;

contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {  // virtual is added to make it overridable (check Extra Storage contract)
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    //calldata: temporary variable that can't be modified ,
    //memory: temporary variable that can be modified and Storage: permanent variable that can be modified


    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
   
}