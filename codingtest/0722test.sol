// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

/*
숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
--------------------------------------------------------------------------------------------
문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
*/

contract TEST {
    function Number(uint n) public pure returns(uint, uint[] memory){
        uint length = 0;
        uint tempNumber = n;
        while (tempNumber > 0) {
            length++; 
            tempNumber /= 10;

         tempNumber = number;
        for (uint i = 0; i < length; i++) {
            uint  {

            }
        return (length, result);

    }
    function StringA(string _s) public pure returns(uint string[] memory) {
         string[] memory A = new string[](length);
         
    }
}
}
}