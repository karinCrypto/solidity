// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;
    /*
    가능한 모든 것을 inline assembly로 진행하시면 됩니다.
    1. 숫자들이 들어가는 동적 array number를 만들고 1~n까지 들어가는 함수를 만드세요.
    2. 숫자들이 들어가는 길이 4의 array number2를 만들고 여기에 4개의 숫자를 넣어주는 함수를 만드세요.
    3. number의 모든 요소들의 합을 반환하는 함수를 구현하세요. 
    4. number2의 모든 요소들의 합을 반환하는 함수를 구현하세요. 
    5. number의 k번째 요소를 반환하는 함수를 구현하세요.
    6. number2의 k번째 요소를 반환하는 함수를 구현하세요.
    */
    contract TEST {
        uint[] number;
        uint[4] number2;

    function Number(uint n) public {
        assembly {
         sstore(number.slot, n)
         let dataStart := keccak256(number.slot, 0x20)
        
        for { let i := 0 } lt(i, n) { i := add(i, 1) } {
            sstore(add(dataStart, i), add(i, 1))
        }
    }
}
      function Number2(uint a, uint b, uint c, uint d) public {
        assembly {
            sstore(number2.slot, a)
            sstore(add(number2.slot, 1), b)
            sstore(add(number2.slot, 2), c)
            sstore(add(number2.slot, 3), d)
        }
    }
      function Number3() public view returns (uint sum) {
        assembly {
            let len := sload(number.slot)
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                mstore(0x00, number.slot)
                mstore(0x20, i)
                let position := keccak256(0x00, 0x40)
                sum := add(sum, sload(position))
            }
        }
    }
}  