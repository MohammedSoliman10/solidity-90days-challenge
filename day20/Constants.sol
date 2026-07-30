// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CONSTANT {

    uint256 public constant PRICE = 100;
 
}

contract B {

    uint256 public price = 100;
}

// the gas consumed in the first contract is way cheaper than contract B // thats why if we are goint to have something that will not change  it is better to use the constant 