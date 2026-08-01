// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FOR_LOOP {
    

    function countSum() public pure returns(uint256){

        uint256 total = 0;

        for(uint i = 1; i<=10; i++){
        
            total+=i;
        }

        return total;
    }
}