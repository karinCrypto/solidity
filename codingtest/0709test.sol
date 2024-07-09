// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

/*
학생 점수관리 프로그램입니다.
여러분은 한 학급을 맡았습니다.
학생은 번호, 이름, 점수로 구성되어 있고(구조체)
가장 점수가 낮은 사람을 집중관리하려고 합니다.

가장 점수가 낮은 사람의 정보를 보여주는 기능,
총 점수 합계, 총 점수 평균을 보여주는 기능,
특정 학생을 반환하는 기능, -> 숫자로 반환
가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
*/

contract TEST1 {
    struct Student {
        uint number;
        string name;
        uint score;
    }
    Student[] students;

    /* 학생정보 추가 */
      function addStudent(uint _number, string memory _name, uint _score) public {
        students.push(Student(_number, _name, _score));
    }
    /* 가장 점수가 낮은 사람의 정보를 보여주는 기능 */
    function getLower() public view returns(Student memory) {
        uint info;
          for(uint i = 0; i < students.length; i++){
            if(students[i].score<)
          }

    }

    /* 총 점수 합계, 총 점수 평균을 보여주는 기능 */
    function getAverage() public view returns(uint) {
        uint average;
         for (uint i = 0; i < students.length; i++) {
            average += students[i].score;
        }
        return (average / students.length);
    }

    /* 특정 학생을 반환하는 기능, -> 숫자로 반환 */
    function getSpecial(uint _number) public view returns(Student memory) {
       return students[_number - 1];
    }


    /* 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array) */
       function getAllStudents() public view returns (Student[] memory) {
        return students;
    }

}