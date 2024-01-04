// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AITU_Abylaikhan is ERC20 {
    event TransferInfo(uint256 timestamp, address sender, address receiver, uint256 amount);

    constructor() ERC20("AITU Abylaikhan", "AITU") {
        _mint(msg.sender, 2000*10**18); // Initial supply
    }

    function getLatestTransactionTimestamp() external view returns (string memory) {
        require(totalSupply() > 0, "No transactions have occurred yet");
        uint256 latestTimestamp = block.timestamp;

        // Convert timestamp to a human-readable format
        return timestampToString(latestTimestamp);
    }

    function timestampToString(uint256 timestamp) internal pure returns (string memory) {
        string memory timestampStr = "";

        while (timestamp > 0) {
            uint256 digit = timestamp % 10;
            timestamp /= 10;
            timestampStr = string(abi.encodePacked(uint8(digit) + 48, timestampStr));
        }

        return timestampStr;
    }

    function getTransactionSenderAddress() external view returns (address) {
        return msg.sender;
    }

    function getTransactionReceiverAddress() external view returns (address) {
        // In a token contract, the address of the contract itself is the receiver for transfers
        return address(this);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transfer(recipient, amount);
        if (success) {
            emit TransferInfo(block.timestamp, msg.sender, recipient, amount);
        }
        return success;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transferFrom(sender, recipient, amount);
        if (success) {
            emit TransferInfo(block.timestamp, sender, recipient, amount);
        }
        return success;
    }
}
