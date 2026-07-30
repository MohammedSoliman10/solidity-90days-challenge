// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "hardhat/console.sol";

interface IContractB {
    function calculate() external view;
}

contract A {

    function buy(address contractB) public view {
        console.log("contract A");
        console.log(tx.origin);
        console.log(msg.sender);
        console.log("-************");

        IContractB(contractB).calculate();
    }
}

contract B {
    function calculate() public view {
        console.log("contract B");
        console.log(tx.origin);
        console.log(msg.sender);
    }
}