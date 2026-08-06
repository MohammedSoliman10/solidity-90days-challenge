// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SENDMONEY {
    address owner;

    constructor() {
        owner= msg.sender;
    }

    function fund() payable public {}

    // transfer 
    function sendMoney1() public {
        payable(owner).transfer(1 ether);
    }

    // send 
    function sendMoney2() public {
        bool success = payable(owner).send(1 ether);
        require(success, "transfer failed");
    }

    // call 
    function sendMoney3() public {

        (bool success, )  = payable(owner).call{value: 0.5 ether}("");
        require(success, "transfer failed");
    }
}