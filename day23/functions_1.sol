// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract FUNC {

    uint256 num;

    function set(uint256 _value) public {
        num = _value;

    }   

    function get() public view  returns(uint256){

        return num;
    }
}