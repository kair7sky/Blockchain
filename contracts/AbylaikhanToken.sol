// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AITU_Abylaikhan is ERC20 {
    event TransferInfo(uint256 timestamp, address sender, address receiver, uint256 amount);

    constructor() ERC20("AITU Abylaikhan", "AITU") {
        _mint(msg.sender, 2000 * 10**18); // Initial supply
    }

    /**
     * @dev Retrieves the timestamp of the latest transaction in a human-readable format.
     * @return A string representing the timestamp of the latest transaction.
     */
    function getLatestTransactionTimestamp() external view returns (string memory) {
        require(totalSupply() > 0, "No transactions have occurred yet");
        uint256 latestTimestamp = block.timestamp;

        // Convert timestamp to a human-readable format
        return timestampToString(latestTimestamp);
    }

    /**
     * @dev Converts a timestamp to a human-readable string.
     * @param timestamp The timestamp to convert.
     * @return A string representing the human-readable timestamp.
     */
    function timestampToString(uint256 timestamp) internal pure returns (string memory) {
        string memory timestampStr = "";

        while (timestamp > 0) {
            uint256 digit = timestamp % 10;
            timestamp /= 10;
            timestampStr = string(abi.encodePacked(uint8(digit) + 48, timestampStr));
        }

        return timestampStr;
    }

    /**
     * @dev Retrieves the address of the sender of the latest transaction.
     * @return The address of the sender.
     */
    function getTransactionSenderAddress() external view returns (address) {
        return msg.sender;
    }

    /**
     * @dev Retrieves the address of the receiver of the latest transaction.
     * In a token contract, the address of the contract itself is considered the receiver for transfers.
     * @return The address of the receiver.
     */
    function getTransactionReceiverAddress() external view returns (address) {
        return address(this);
    }

    /**
     * @dev Overrides the transfer function to emit a TransferInfo event upon successful transfer.
     * @param recipient The address receiving the tokens.
     * @param amount The amount of tokens to transfer.
     * @return A boolean indicating whether the transfer was successful.
     */
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transfer(recipient, amount);
        if (success) {
            emit TransferInfo(block.timestamp, msg.sender, recipient, amount);
        }
        return success;
    }

    /**
     * @dev Overrides the transferFrom function to emit a TransferInfo event upon successful transfer.
     * @param sender The address from which the tokens are transferred.
     * @param recipient The address receiving the tokens.
     * @param amount The amount of tokens to transfer.
     * @return A boolean indicating whether the transfer was successful.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transferFrom(sender, recipient, amount);
        if (success) {
            emit TransferInfo(block.timestamp, sender, recipient, amount);
        }
        return success;
    }
}
