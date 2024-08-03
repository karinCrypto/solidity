// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TEST7 {
  /*
	* 악셀 기능 - 속도를 10 올리는 기능, 악셀 기능을 이용할 때마다 연료가 20씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 
    속도가 70이상이면 악셀 기능은 더이상 못씀
	* 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
	* 브레이크 기능 - 속도를 10 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 10씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
	* 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
	* 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
	--------------------------------------------------------
	* 충전식 기능 - 지불을 미리 해놓고 추후에 주유시 충전금액 차감 
	*/

    enum CarStatus {
        stop, 
        off, 
        driving
    }

    struct Car {
        uint speed;
        uint gas;
        CarStatus status;
    }

    Car public myCar;

    function accel() public {
        require(myCar.speed < 70 && myCar.gas > 30 && (myCar.status == CarStatus.driving || myCar.status == CarStatus.stop));
        myCar.speed += 10;
        myCar.gas -= 20;

        if(myCar.status != CarStatus.driving) {
            myCar.status = CarStatus.driving;
        }
    }

    function Break() public {
        require(myCar.speed >= 10 && myCar.gas >= 10);
        myCar.speed -= 10;
        myCar.gas -= 10;

        if(myCar.speed == 0) {
            myCar.status = CarStatus.stop;
        }
    }

    function turnOn() public {
        require(myCar.status == CarStatus.off);
        myCar.status = CarStatus.stop;
    }

    function turnOff() public {
        require(myCar.status == CarStatus.stop);
        myCar.status = CarStatus.off;
    }

    function charge() public payable {
        require((address(this).balance >= 1 ether || msg.value == 1 ether) && myCar.status == CarStatus.off);
        myCar.gas = 100;
        // payable(address(0)).transfer(1 ether);
        (bool success, ) = address(0).call{value : 1 ether}("");
        require(success);
    }

    // * 충전식 기능 - 지불을 미리 해놓고 추후에 주유시 충전금액 차감
    receive() external payable {}
}