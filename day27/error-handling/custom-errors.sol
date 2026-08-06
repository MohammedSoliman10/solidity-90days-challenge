// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ERRORS {

    error ERRORS__NotEnoughAmount(uint256 amount);

    uint256 constant PRICE = 1 ether;

    uint256 public  productSold;

    function buyProduct() public payable {
        productSold++;
        if (msg.value < PRICE) {
            revert ERRORS__NotEnoughAmount({
                amount: msg.value
            });
        }
    }

   

    function buyProduct2() public  payable  {

        productSold++;

        require(msg.value >= PRICE, ERRORS__NotEnoughAmount({
                amount: msg.value
            }));
    }
}