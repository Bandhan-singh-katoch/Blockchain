pragma solidity ^0.4.0;

contract person{
    string private name;
    uint private age;
    function setname(string newname) public{
        name = newname;
    }
    function getname() public constant returns (string){
        return name;
    }
}
