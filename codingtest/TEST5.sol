// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

import "@openzepplin/contracts/utils/Strings.sol";

/*
숫자를 시분초로 변환하세요.
예) 100 -> 1 min 40 sec
600 -> 10 min 
1000 -> 1 6min 40 sec
5250 -> 1 hour 27 min 30 sec
*/
contract BASE {
   function s_concat(string memory _a, string memory _b, string memory _c) public pure returns(string memory) {
      return string.concat(_a, _b, _c);
   }
}





contract TEST {
    function convert(uint _n) public pure returns(uint, uint, uint){
      return(_n/3600, (_n%3600/60), _n%60);
    }
    function getHMS(uint _n) public pure returns(string memory) {
      (uint a, uint b, uint c) = convert(_n);
      return string(abi.encodePacked(Strings.toString(a), "hours", Strings.toString(b), "minutes", Strings.toString(c), "seconds"));

    }
    function getHMS2(uint _n) public pure returns(string memory) {
      (uint a, uint b, uint c) = convert(_n);
      return string(abi.encodePacked(Strings.toString(a), unicode "시간", Strings.toString(b), unicode "분", Strings.toString(c), unicode "초"));

    }

}