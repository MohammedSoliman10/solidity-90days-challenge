// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract REVERT {

    uint256 constant PRICE = 1 ether;

    uint256 public  productSold;

    function buyProduct() public payable {
        productSold++;
        if (msg.value < PRICE) {
            revert("amount less than the price");
        }
    }

    
}