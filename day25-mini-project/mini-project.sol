// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Student_Grading_System {
    struct Student {
        string name;
        bool isEnrolled;
        uint256[] grades;
    }

    address public teacher;
    mapping(address => Student) public students;

    constructor() {
        teacher = msg.sender;
    }
    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this action.");
        _;
    }

    function registerStudent(address studentAddress, string memory studentName) public onlyTeacher {
        require(!students[studentAddress].isEnrolled, "Student is already enrolled.");
        students[studentAddress] = Student(studentName, true, new uint256[](0));
    }    

    function addGrade(address studentAddress, uint256 grade) public onlyTeacher {
        require(students[studentAddress].isEnrolled, "Student is not enrolled.");
        require(grade <= 100, "Grade must be between 0 and 100.");
        students[studentAddress].grades.push(grade);
    }

    function updateGrade(address studentAddress, uint256 index, uint256 newGrade) public onlyTeacher {
        require(students[studentAddress].isEnrolled, "Student is not enrolled.");
        require(index < students[studentAddress].grades.length, "Invalid grade index.");
        require(newGrade <= 100, "Grade must be between 0 and 100.");
        students[studentAddress].grades[index] = newGrade;
    }
    function deleteGrade(address studentAddress, uint256 index) public onlyTeacher {
        require(students[studentAddress].isEnrolled, "Student is not enrolled.");
        require(index < students[studentAddress].grades.length, "Invalid grade index.");
        uint256 lastIndex = students[studentAddress].grades.length - 1;
        students[studentAddress].grades[index] = students[studentAddress].grades[lastIndex];
        students[studentAddress].grades.pop();
    }
    function getAllGrades(address studentAddress) public view returns (uint256[] memory) {
        require(students[studentAddress].isEnrolled, "Student is not enrolled.");
        return students[studentAddress].grades;
    }
    function getGradeCount(address studentAddress) public view returns (uint256) {
        require(students[studentAddress].isEnrolled, "Student is not enrolled.");
        return students[studentAddress].grades.length;
    }
    function getAverageGrade(address studentAddress) public view returns (uint256) {
        require(students[studentAddress].isEnrolled, "Student is not enrolled.");
        uint256 totalGrades = students[studentAddress].grades.length;
        require(totalGrades > 0, "No grades available for this student.");
        uint256 sum = 0;
        for (uint256 i = 0; i < totalGrades; i++) {
            sum += students[studentAddress].grades[i];
        }
        return sum / totalGrades;
    }
}
