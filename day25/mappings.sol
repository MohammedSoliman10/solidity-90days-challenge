// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract MAPPING {

    mapping(address => uint256) public studentGrade;
    // CRUD

    // CREATE
    function addGrade(address _student,uint256 _grade) public {
        studentGrade[_student] = _grade;
    }

    // READ
    function getGrade(address _student) public view returns(uint256){
        return studentGrade[_student];
    }

    // UPDATE   
    function updateGrade(address _student,uint256 _newGrade) public {
        studentGrade[_student] = _newGrade;
    }

    // DELETE
    function deleteGrade(address _student) public {
        delete studentGrade[_student];
    }
}