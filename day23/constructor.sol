// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleConstructor {

    address public owner;
    string public name;
    uint public age;

    // A constructor runs ONE TIME ONLY, the moment the contract is deployed
    // It's used to set up starting values
    constructor(string memory _name, uint _age) {
        owner = msg.sender;   // whoever deploys the contract
        name = _name;
        age = _age;
    }
}