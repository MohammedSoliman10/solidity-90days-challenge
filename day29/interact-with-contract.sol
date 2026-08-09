// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Counter {

    uint public number;

    function increament() public {
        number +=1;
    }

    
}

interface ICounter  {
    function increament() external;
}

contract Counter_Caller {
    function callIncreament(address _CounterAddress) public {
        ICounter(_CounterAddress).increament();
    }
}