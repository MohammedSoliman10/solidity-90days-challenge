// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract REQUIRE {

    uint256 constant PRICE = 1 ether;
    uint256 public productSold;

    function buyProduct() public  payable  {

        productSold++;

        require(msg.value >= PRICE, "amount less than the price");
    }
}