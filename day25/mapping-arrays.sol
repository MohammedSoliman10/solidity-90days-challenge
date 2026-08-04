// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract mapArr {
    
    mapping(address => uint256[]) public StudentGrade;

    function addGrade(address _student, uint256 _grade) public {
        StudentGrade[_student].push(_grade);

    }

    function getGrade(address _student, uint256 index) public view returns(uint256) {
      return  StudentGrade[_student][index];

    }

    function updateGrade(address _student, uint256 index ,uint256 newGrade) public {            
           StudentGrade[_student][index] = newGrade;

    }

    function deleteGrade(address _studnet, uint index) public {
        delete StudentGrade[_studnet][index];
    }
}