// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BALANCE {
    
    function fund() payable public {


    }

    function getbalance() public view returns(uint256){
        return address(this).balance;
    }
}