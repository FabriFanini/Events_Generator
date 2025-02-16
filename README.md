# 🎟️ Events Generator

This is a **smart contract** developed in **Solidity** that allows event creation, ticket purchase, and refunds. It is based on the **ERC1155** standard and utilizes **OpenZeppelin** libraries for secure management.

## 📌 Features

- Event creation and cancellation.
- Ticket purchase and refund.
- Ticket transfer between users.
- Ticket validation.
- Fund management by the contract owner.

## 🚀 Installation and Usage

### 1️⃣ Clone the Repository
```sh
 git clone <REPOSITORY_URL>
 cd <REPOSITORY_NAME>
```

### 2️⃣ Deployment on Remix
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Load the `ConquerEvents.sol` file into Remix.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract on a test network (Goerli, Sepolia, etc.) or a local network like Hardhat/Ganache.

### 3️⃣ Contract Interaction

#### 🛠️ Create an Event
```solidity
createEvent("Blockchain Event", 100, 0.05 ether);
```

#### 🎫 Buy Tickets
```solidity
buyTickets(1, 2);
```

#### 🔄 Transfer Tickets
```solidity
transferTickets(0xRecipientAddress, 1, 1);
```

#### 🔍 Validate a User's Ticket
```solidity
validateTicket(0xUserAddress, 1);
```

#### 🔄 Refund Tickets
```solidity
refundTickets(1, 1);
```

#### 💰 Withdraw Funds (Owner Only)
```solidity
withdraw();
```

## 📄 Emitted Events
The contract emits the following events for monitoring:
- `newEvent(uint256 id, string name, uint256 totalSupply, uint256 price)` → When a new event is created.
- `TicketsBought(address buyer, uint256 id, uint256 amount)` → When tickets are purchased.

## 🛠️ Technologies Used
- Solidity
- Remix IDE
- OpenZeppelin
- Ethers.js / Web3.js
- Hardhat (optional for advanced testing and deployment)

## ⚠️ Considerations
- Test the contract on a test network before deploying it on the mainnet.
- Ticket refunds may involve gas fees.

## 📝 License
This project is licensed under **GPL-3.0**.

---
✉️ For questions or improvements, open an issue or contact me.
