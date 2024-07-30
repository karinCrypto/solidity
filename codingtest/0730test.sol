// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;
/*
주차정산 프로그램을 만드세요. 주차시간 첫 2시간은 무료, 그 이후는 1분마다 200원(wei)씩 부과합니다. 
주차료는 차량번호인식을 기반으로 실행됩니다.
주차료는 주차장 이용을 종료할 때 부과됩니다.
----------------------------------------------------------------------
차량번호가 숫자로만 이루어진 차량은 20% 할인해주세요.
차량번호가 문자로만 이루어진 차량은 50% 할인해주세요.
*/
contract A {

    mapping(string => uint) parkingTime;

    function start(string memory carNumber) public {
        parkingTime[carNumber] = block.timestamp;
    }

    function end(string memory carNumber) public view returns(uint) {
        require(parkingTime[carNumber] != 0, "No") ;

        uint setParking = block.timestamp - parkingTime[carNumber];
        uint charge = 0;

        if(setParking > 2 hours) {
            charge = setParking - 2 hours;
        }
        uint fee = (charge / 1 minutes) * 200;
        return fee;
    }
    
    function numberCar(string memory str) public pure returns(bool) {
        bytes memory a = bytes(str);
    }

}