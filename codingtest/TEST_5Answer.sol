// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

import "@openzeppelin/contracts/utils/Strings.sol";

contract BASE {
    function s_concat(string memory _a, string memory _b, string memory _c) public pure returns(string memory) {
        return string.concat(_a, _b, _c);
    }
}

contract TEST5 {
    /*
		숫자를 시분초로 변환하세요.
		예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
		*/

    function convert(uint _n) public pure returns(uint, uint, uint) {
        return (_n/3600, (_n%3600)/60, _n%60);
    }

    function getHMS(uint _n) public pure returns(string memory) {
        (uint a, uint b, uint c) = convert(_n);
        return string(abi.encodePacked(Strings.toString(a), " hours", Strings.toString(b), " minutes", Strings.toString(c), " seconds"));
    }

    function getHMS2(uint _n) public pure returns(string memory) {
        (uint a, uint b, uint c) = convert(_n);
        return string(abi.encodePacked(Strings.toString(a), unicode" 시간 ", Strings.toString(b), unicode" 분 ", Strings.toString(c), unicode" 초"));
    }

}