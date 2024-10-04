// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity >=0.4.22 <0.9.0;

contract Polling {
    struct Poll {
        string question;
        string[] options;
        mapping(uint => uint) votes;
        bool exists;
    }

    mapping(uint => Poll) public polls;
    uint public pollCount;
    event Voted(uint pollId,  uint optionIndex);

    function createPoll(string memory _question, string[] memory _options) public {
        pollCount++;
        Poll storage newPoll = polls[pollCount];
        newPoll.question = _question;
        newPoll.options = _options;
        newPoll.exists = true;
    }
    modifier isPollValid(uint _pollId, uint _optionIndex) {
        require(polls[_pollId].exists, "Poll does not exists");
        require(polls[_pollId].options.length > _optionIndex, "Invalid option");
        _;
    }

    function vote(uint _pollId, uint _optionIndex) public isPollValid(_pollId,_optionIndex) {
        
        polls[_pollId].votes[_optionIndex]++;
        emit Voted(_pollId, _optionIndex);
    }

    function getVotes(uint _pollId, uint _optionIndex) public  isPollValid(_pollId,_optionIndex) view returns(uint voteCount) {
        voteCount = polls[_pollId].votes[_optionIndex];
        return voteCount;
    }
}
