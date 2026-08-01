// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IF_ELSE {


    function isPositive(int256 num) public pure returns(string memory) {

        if ( num > 0) {
            return "Positive";
        }

        else if (num == 0 ){
            return "this number is zero";

        }
        else {
            return "negative";
        }


    }


}