pragma solidity >=0.8.0;

contract polling {
    struct Poll {
        string question;
        string[] options;
        mapping[uint => uint] votes;
        bool exists;
    }

    mapping(uint => Poll) public polls;
    uint public pollCount;
}
