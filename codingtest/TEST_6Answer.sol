// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract TEST6 {
	
	/*
	숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
	예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
	--------------------------------------------------------------------------------------------
	문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
	예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
	*/

    function digits(uint _n) public pure returns(uint, uint[] memory) {
        uint length = 0;
        uint temp_n = _n;

        while(temp_n != 0) {
            length ++;
            temp_n /=10;
        }

        uint r_length = length;

        uint[] memory numbers = new uint[](length);
        while(_n != 0) {
            numbers[--length] = _n % 10;
            // numbers[length--] = _n % 10;
            _n /=10;
        }

        return (r_length, numbers);
    }

    function length(string memory _s) public pure returns(uint, string[] memory) {
        uint _length = bytes(_s).length;
        string[] memory _letters = new string[](_length);

        bytes1[] memory _b = new bytes1[](_length);

        for(uint i=0; i<_length; i++) {
            _b[i] = bytes(_s)[i];
            _letters[i] = string(abi.encodePacked(_b[i]));
            // _letters[i] = string(abi.encodePacked(bytes(_s)[i]));
        }

        return (_length, _letters);
    }

}

contract BASE {
    function getBytes(bytes memory _b) public pure returns(uint) {
        return _b.length;
    }

    function getByte1(bytes memory _b, uint _n) public pure returns(bytes1) {
        return _b[_n-1];
    }

    function bytesToString(bytes memory _s) public pure returns(string memory) {
        return string(_s);
    }

    function split(bytes memory b) public pure returns(uint, bytes1[] memory, string memory) {
        uint _length = b.length;

        bytes1[] memory _b = new bytes1[](_length);

        for(uint i=0; i<_length; i++) {
            _b[i] = b[i];
        }

        return (_length, _b, string(abi.encodePacked(_b)));
    }
}