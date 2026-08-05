// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract EVENTS {
    uint256 constant public PRICE = 100;
    event ticketSold(address indexed , uint256 indexed );

    function buyTicket() public  {


        emit ticketSold(msg.sender,PRICE );

    }

}