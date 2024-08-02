// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;


contract Q91 {
/*
배열에서 특정 요소를 없애는 함수를 구현하세요. 
예) [4,3,2,1,8] 3번째를 없애고 싶음 → [4,3,1,8]
*/

    uint[] numbers;

    function addNumber(uint _n) public {
        numbers.push(_n);
    }

    function removeNumber(uint _n) public {
        require(_n < numbers.length, "no");
        numbers[_n] = numbers[numbers.length - 1];
        
        numbers.pop();
    }

    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }
}



contract Q92 {
/*
특정 주소를 받았을 때, 그 주소가 EOA인지 CA인지 감지하는 함수를 구현하세요.
*/
}

contract Q93 {
/*
다른 컨트랙트의 함수를 사용해보려고 하는데, 그 함수의 이름은 모르고 methodId로 추정되는 값은 있다. 
input 값도 uint256 1개, address 1개로 추정될 때 해당 함수를 활용하는 함수를 구현하세요.
*/
    function unknowwn(address _addr, uint256 _n, bytes4 method) public returns (bool success, bytes memory result) {
       
        bytes memory data = abi.encodePacked(method, abi.encode(_n, _addr));
        (bool, success) = 
        
    }
}



contract Q94 {
/*
inline - 더하기, 빼기, 곱하기, 나누기하는 함수를 구현하세요.
*/
    function add(uint a, uint b) public  pure returns(uint result){
        assembly {
            result := add(a, b)
        }
    }
    function sub(uint a, uint b) public  pure returns(uint result){
        assembly {
            result := sub(a, b)
        }
    }
    function mul(uint a, uint b) public  pure returns(uint result){
        assembly {
            result := mul(a, b)
        }
    }
    function div(uint a, uint b) public  pure returns(uint result){
        assembly {
            result := div(a, b)
        }
}
}

contract Q95 {
/*
inline - 3개의 값을 받아서, 더하기, 곱하기한 결과를 반환하는 함수를 구현하세요.
*/

   function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        assembly {
            mstore(0x80, add(_a, add(_b, _c)))
            return (0x80, 32)
        }
    }

    function mul(uint _a, uint _b, uint _c) public pure returns(uint) {
        assembly {
            mstore(0x80, mul(_a, mul(_b, _c)))
            return (0x80, 32)
        }
}
}

contract Q96 {
/* 
inline - 4개의 숫자를 받아서 가장 큰수와 작은 수를 반환하는 함수를 구현하세요.
*/
    function getNumber(uint a, uint b, uint c, uint d) public pure returns (uint min, uint max) {
        assembly {
            min := a
            max := a
            if()
        }

contract Q97 {
/*
inline - 상태변수 숫자만 들어가는 동적 array numbers에 push하고 pop하는 함수 그리고 전체를 반환하는 구현하세요.
*/

}

contract Q98 {
/*
inline - 상태변수 문자형 letter에 값을 넣는 함수 setLetter를 구현하세요.
*/

}

contract Q99 {
/*
inline - bytes4형 b의 값을 정하는 함수 setB를 구현하세요.
*/

}

contract Q100 {
/*
inline - bytes형 변수 b의 값을 정하는 함수 setB를 구현하세요.
*/

}