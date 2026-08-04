// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract mappstruct { 
    struct STUDENTS {
        address studentAddr;
        uint256 id;
        string name;

    }

    mapping(address => STUDENTS) public  studentMap;

    function addStudent(uint256 _id, string memory _name) public {
        STUDENTS memory student = STUDENTS({
            id: _id,
            name: _name,
            studentAddr: msg.sender
        });
        studentMap[msg.sender] = student;
    }

}