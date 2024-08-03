// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract TEST8 {
	/*
	안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 
	안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
	안건들을 모아놓은 자료구조도 구현하세요. 
	
	사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)
	
	* 사용자 등록 기능 - 사용자를 등록하는 기능
	* 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
	* 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
	* 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
	* 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
	-------------------------------------------------------------------------------------------------
	* 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 15개 블록 후에 전체의 70%가 투표에 참여하고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
	*/

    struct Prop {
        uint number;
        string title;
        string content;
        address proposer;
        uint pros;
        uint cons;
        status result;
        uint blockNumber;
    }

    enum status {
        ongoing,
        passed,
        failed
    }

    mapping(string => Prop) public Proposals;
    uint propCount=1;

    struct User {
        string name;
        address addr;
        string[] proposals;
        mapping(string => bool) votes;
        mapping(string => bool) voted;
    }

    mapping(address => User) users;
    uint usercount;

    function signUp(string calldata _name) public {
        require(users[msg.sender].addr == address(0));
        users[msg.sender].name = _name;
        users[msg.sender].addr = msg.sender;
        usercount++;
    }

    function propose(string calldata _title, string calldata _content) public {
        Proposals[_title] = Prop(propCount++, _title, _content, msg.sender, 0, 0, status.ongoing, block.number);
        users[msg.sender].proposals.push(_title);
    }

    function vote(string calldata _title, bool _isPro) public {
        require(users[msg.sender].addr != address(0));
        require(users[msg.sender].voted[_title]==false);
        require(block.number <= Proposals[_title].blockNumber+15 && Proposals[_title].result == status.ongoing);

        _isPro ? Proposals[_title].pros++ : Proposals[_title].cons++;

        users[msg.sender].votes[_title] = _isPro;
        users[msg.sender].voted[_title] = true;
    }

    // * 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 15개 블록 후에 
    // 전체의 70%가 투표에 참여하고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
    function setResult(string calldata _title) public {
        require(Proposals[_title].blockNumber +15 < block.number, "not yet");

        uint pros = Proposals[_title].pros;
        uint cons = Proposals[_title].cons;
        uint total = pros + cons;

        if(total * 10 >= usercount * 7 && pros * 100 >= total * 66) {
            Proposals[_title].result = status.passed;
        } else {
            Proposals[_title].result = status.failed;
        }
    }

    function getMyProposals() public view returns(Prop[] memory) {
        string[] memory _proposals = users[msg.sender].proposals;
        Prop[] memory res = new Prop[](_proposals.length);

        for(uint i=0; i<_proposals.length; i++) {
            res[i] = Proposals[_proposals[i]];
        }

        return res;
    }

    function getProposal(string memory _title) public view returns(Prop memory) {
        return Proposals[_title];
    }
}

contract BLOCK {
    uint public blockNumber;

    function setBlockNumber() public {
        blockNumber = block.number;
    }
    
    function getBlockNumber() public view returns(uint) {
        return block.number;
    }
}
