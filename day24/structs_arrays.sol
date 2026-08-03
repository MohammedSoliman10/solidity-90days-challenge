// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MIX {

    struct Student {
        address student_address;
        uint256 id;
        string name;
    }

    Student[] private student_arr;

    //  CREATE 
    function add_student(uint256 _id, string memory _name) public {
        student_arr.push(Student({
            id: _id,
            name: _name,
            student_address: msg.sender
        }));
    }

    //  READ 
    function getStudent(uint256 index) public view returns (Student memory) {
        require(index < student_arr.length, "Index out of bounds");
        return student_arr[index];
    }

    function getAllStudents() public view returns (Student[] memory) {
        return student_arr;
    }

    function getStudentCount() public view returns (uint256) {
        return student_arr.length;
    }

    //  UPDATE 
    function updateStudent(uint256 index, uint256 _id, string memory _name) public {
        require(index < student_arr.length, "Index out of bounds");
        student_arr[index].id = _id;
        student_arr[index].name = _name;
        // student_address intentionally left unchanged — see note below
    }

    //  DELETE 
    function deleteStudent(uint256 index) public {
        require(index < student_arr.length, "Index out of bounds");
        student_arr[index] = student_arr[student_arr.length - 1];
        student_arr.pop();
    }
}