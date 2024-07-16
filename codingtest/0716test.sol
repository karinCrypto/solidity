// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

/*
숫자를 시분초로 변환하세요.
예) 100 -> 1 min 40 sec
600 -> 10 min 
1000 -> 1 6min 40 sec
5250 -> 1 hour 27 min 30 sec
*/

contract TEST {
    function time(uint _n) public pure returns(string memory _clock) {
        uint hours = seconds / 3600;
        uint minutes = (seconds % 3600) / 60;
        uint seconds = seconds % 60;
    }

       if(hours > 0) {
            _clock = string(abi.encodePacked((hours), " hour "));
        }
        if(minutes > 0) {
           _clock = string(abi.encodePacked((minutes), " min "));
        }        
        if(seconds > 0) {
           _clock = string(abi.encodePacked((seconds), " sec"));        
        }
}