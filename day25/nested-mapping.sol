// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract NESMAP{
    mapping(uint256  => mapping(address => uint256)) public votes;

    function castVote(uint256 electId, address cantAddr) public {
        votes[electId][cantAddr]++

    } 

    function getVoteCount(uint256 electId, address cantAddr) public pure returns(uint256) {
        return votes[electId][cantAddr];
    }



}