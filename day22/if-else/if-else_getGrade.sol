// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IF_ELSE {

    function getGrade(uint256 score) public pure returns(string memory){
        if (score >= 90){
            return "A";
        }
        else if (score >= 80){
            return "B";
        }
        else if (score >= 70){
            return "C";
        }
        else if (score >=60){
            return "D";
        }
        else {
            return "F";
        }
    }
}