# Token AITU Abylaikhan

## Usage
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
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/LICENSE


## Examples
Demo screen
![image](https://github.com/kair7sky/Blockchain/assets/118976474/041dca2e-0a6b-4dcc-86ae-3cfa7e34e3e7)
![image](https://github.com/kair7sky/Blockchain/assets/118976474/b27b0fcd-a467-4512-b4a5-7249c14a15b9)
![image](https://github.com/kair7sky/Blockchain/assets/118976474/c8220a90-97a5-4192-a55c-00ff442dc0f8)


## Bonus Task
![image](https://github.com/kair7sky/Blockchain/assets/118976474/694e0b0b-9976-4509-b3a0-7a635dde2dcf)



