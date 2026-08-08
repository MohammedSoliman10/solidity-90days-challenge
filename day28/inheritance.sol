// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract  A {

    uint256 public num1 = 10;
    uint256 internal num2 = 20;
    uint256 private num3 = 30;

    function sayHello() public pure returns(string memory) {
        return "hello world";
    }
}

contract B is A {
    function getNumber() public view returns(uint256) {
        return num3 +5;
    }
}