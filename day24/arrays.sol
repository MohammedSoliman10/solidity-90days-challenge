// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract ARRAY {
// Fixed size array
                      //   0 1 2
uint256[3] public f_arr = [1,2,3];


// Dynamic size array

uint256[] private  d_arr;

function getElement(uint256 index) public view returns(uint256){
    return d_arr[index];
}

function addElement(uint256 value) public {
    d_arr.push(value);
}

function removeElement(uint256 index) public {
    d_arr[index] = d_arr[d_arr.length-1];
    d_arr.pop();


}

function removeLastElement() public {
    d_arr.pop();
}

function getLength() public view returns(uint256){
    return d_arr.length;
}


}