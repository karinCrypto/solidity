// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST1 {
    /*
    1. 3의 배수만 들어갈 수 있는 array를 구현하세요.
    */
    uint[] three;

    function threeplus(uint _n) public {
        if(_n % 3 == 0)
        three.push(_n);
    }
}

contract TEST2 {
    /*
    2. 뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
    
    예) 2,5 input → 5-2=3(output)
    */
     function sub(uint _a, uint _b) public pure returns(uint){
        if(_a>_b){
            
        }
     }

contract TEST3 {
    /*
    3. 3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
    */
       function test3(uint _n) public pure returns (string memory) {
        if (_n % 3 == 0) {
            return "A";
        } else if (_n % 3 == 1) {
            return "B";
        } else (_n % 3 == 2){
            return "C";
        } 
    }
}

contract TEST4 {
    /*
    4. string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
    */
     function Alice(string memory _name) public pure returns(bool) {
        return keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice"));
    }
}

contract TEST5 {
    /*
    5. 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
    */
    uint[] A;
    
    function setNumber(uint _n) public {
        for(uint i = )
    }

}

contract TEST6 {
    /*
    6. 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    */
    uint[] horse;
    uint[] jjak;

    function add(uint _n) public {
        if(_n % 2 ==0) {
            jjak.push(_n);
        } else {
            horse.push(_n);
        }
    }

}

contract TEST7 {
    /*
    7. string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요. 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
    */
    mapping(string => bytes32) mapp;

     function setMap(string memory _key, bytes32 _value) public {
        map[_key] = _value;
    }

    function deleteMap(string memory _key) public {
        delete map[_key];
    }

    function getMap(string memory _key) public view returns(bytes32) {
        return map[_key];
    }


}

contract TEST8 {
    /*
    8. ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
    */
      function Login(string memory _id, string memory _pw) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_id,_pw));
    }
}

contract TEST9 {
    /*
    9. 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
    */
    uint a;
    string b;

    constructor(uint _a, string memory _b) {
        _a = 10;
        _b = "A";
    }
}

contract TEST10 {
    /*
    10. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
(sorting 코드 응용 → 약간 까다로움)
    
    예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
    */
}