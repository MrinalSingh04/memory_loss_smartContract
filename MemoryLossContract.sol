// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MemoryLossContract {
    struct Message {
        string content;
        uint256 expiryTimestamp;
    }

    mapping(address => Message) private messages;

    event MessageStored(address indexed user, string content, uint256 expiry);
    event MessageExpired(address indexed user);

    /// @notice Stores a message with an expiration time
    function storeMessage(
        string calldata _content,
        uint256 _durationInSeconds
    ) external {
        require(_durationInSeconds > 0, "Duration must be positive");

        uint256 expiry = block.timestamp + _durationInSeconds;
        messages[msg.sender] = Message(_content, expiry);

        emit MessageStored(msg.sender, _content, expiry);
    }

    /// @notice Retrieves a message if it hasn't expired
    function getMessage() external returns (string memory) {
        Message storage msgData = messages[msg.sender];

        if (block.timestamp >= msgData.expiryTimestamp) {
            delete messages[msg.sender];
            emit MessageExpired(msg.sender);
            return "Message expired.";
        }

        return msgData.content;
    }

    /// @notice Checks if a message is expired
    function isExpired(address _user) external view returns (bool) {
        return block.timestamp >= messages[_user].expiryTimestamp;
    }
}
