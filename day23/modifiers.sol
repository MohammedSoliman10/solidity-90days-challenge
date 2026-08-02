// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleModifier {

    address public owner;

    constructor() {
        owner = msg.sender; // the person who deploys the contract
    }

    // A modifier is just a reusable "check" you put before a function runs
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _; // this means "now run the actual function"
    }

    // this function can ONLY be called by the owner
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    // this function anyone can call, no modifier
    function sayHello() public pure returns (string memory) {
        return "hello";
    }
}