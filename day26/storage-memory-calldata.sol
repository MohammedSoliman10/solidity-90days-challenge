// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract  LOCATIONS {


uint256[] public numbers; // storage - presistant

function processNumbers() public view {

    uint256[] memory players = numbers;  // memory -voltile
    players; 
}
function processNumbersRead(uint256[] calldata _nums) public view {

   // read only
}



}