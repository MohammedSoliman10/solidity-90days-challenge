// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;
// events get inheritaed
contract A {
    event ticketSold(address indexed , uint256 indexed );


}


contract B is A {

    function buyTicket() public {
        emit ticketSold(msg.sender,100);
    }
}


// modifier get inherated 

contract myParent {
    modifier checkPrice(){

        _;

    }
}

contract myChild is myParent {
    function butTicket() public checkPrice {

    }
}

// constructor need extra step cuz i doesnt get inherated 
contract Parent {
    constructor(){

    }
}

contract Child is Parent{
    constructor() Parent(){

    }
}