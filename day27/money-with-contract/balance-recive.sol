// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RECEIVE {

    uint256 public price= 100;
    
    receive() external payable {

        price = 200;
     }
}