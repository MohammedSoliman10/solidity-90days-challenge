// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FUNC {
    uint256 value;

    function setValue(uint256 _value) public {
        value = _value;
    }

    function getValue() public view returns(uint256){
        return value;
    }

    function compile() public pure returns(uint256){
        uint256 result = 25*60;
        return result;
    }
}