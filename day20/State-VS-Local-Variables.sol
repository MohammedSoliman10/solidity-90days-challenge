// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract MyContract { 

    // state variable 
    uint public num = 10;  // stored on blockchain (storage - presistant )

    function compute() public {
        // local variable 
        uint result = 100; // (memory - volatile)

        num = 20;
    }
}