// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract STRUCT {
    struct Student {
        address studentAddr;
        uint256 id;
        string name;
    }
    Student student1;
    function createStudent(uint256 _id, string memory _name) public returns (Student memory){

        student1 = Student({
            id: _id,
            name: _name,
            studentAddr: msg.sender
        });
        return student1;
    }

    function getName() public view returns(string memory){

        return student1.name;

    }
    function updateName(string memory _name) public {
        student1.name = _name;
    }

    function deleteStudent() public {
        delete student1;
    }

}