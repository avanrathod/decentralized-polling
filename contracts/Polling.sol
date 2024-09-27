pragma solidity >=0.8.0;

contract polling {
    struct Poll {
        string question;
        string[] options;
        mapping(uint => uint) votes;
        bool exists;
    }

    mapping(uint => Poll) public polls;
    uint public pollCount;

    function createPoll(string memory _question, string[] memory _options) public {
        pollCount++;
        Poll storage newPoll = polls[pollCount];
        newPoll.question = _question;
        newPoll.options = _options;
        newPoll.exists = true;
    }

    function vote(uint _pollId, uint _optionIndex) public {
        require(polls[_pollId].exists, "Poll does not exists");
        require(polls[_pollId].options.length > _optionIndex, "Invalid option");
        polls[_pollId].votes[_optionIndex]++;
    }
}
