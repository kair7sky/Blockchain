# Token AITU Abylaikhan
Usage
This project is an Ethereum ERC-20 token created using Remix and OpenZeppelin. It provides basic functionalities for an ERC-20 token and includes additional features like retrieving transaction information.

## Prerequisites


Remix IDE or your preferred Ethereum development environment.
Deployment
Open Remix and load the AbylaikhanToken.sol file.
Compile the contract and deploy it using the Metamask wallet.
Interact with the contract using the provided functions.

## Functions
getLatestTransactionTimestamp(): Retrieves the timestamp of the latest transaction in a human-readable format.

timestampToString(uint256 timestamp): Converts a timestamp to a human-readable string.

getTransactionSenderAddress(): Retrieves the address of the sender of the latest transaction.

getTransactionReceiverAddress(): Retrieves the address of the receiver of the latest transaction. In a token contract, the contract address is considered the receiver for transfers.

transfer(address recipient, uint256 amount): Overrides the transfer function to emit a TransferInfo event upon successful transfer.

transferFrom(address sender, address recipient, uint256 amount): Overrides the transferFrom function to emit a TransferInfo event upon successful transfer.

## License

This project is distributed under the MIT License - see the [LICENSE](LICENSE) file for details.
