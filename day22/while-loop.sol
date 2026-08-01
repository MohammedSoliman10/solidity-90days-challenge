// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WHILE_LOOP {

    function countSum() public pure returns(uint256){
        uint256 total = 0;
        uint256 i = 1;
        while (i <= 10) 
        {
            total += i;
            i++;
        }
        return total;
    }
}