// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "hardhat/console.sol";

contract myContract {

    function buyTicket() public view   {

        console.log(tx.origin);


    }



}