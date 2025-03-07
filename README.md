# Blockchain Memory Loss Smart Contract

## 📌 What is this?

This is a **Blockchain Memory Loss** smart contract—a unique contract that **automatically forgets stored data** after a set period of time. Unlike traditional blockchain storage, which is **permanent**, this contract introduces **temporary, self-expiring data storage**.

## ❓ Why build this?

Most blockchain contracts **store data forever**, which is both a feature and a limitation. This contract is designed for **use cases where forgetting information is useful**, such as:

- **Privacy-focused applications** 🕵️‍♂️ – Users can store messages that automatically disappear after some time.
- **Temporary agreements or reminders** ⏳ – Contracts that don’t need to exist forever.
- **Self-expiring tokens or assets** 🎟️ – Data that resets periodically for dynamic applications.
- **Ephemeral governance models** 🗳️ – DAO proposals that disappear after a certain period.

## 🔧 How it Works

1. **Users store messages** with an expiration time via `storeMessage()`.
2. The contract **stores the message temporarily**.
3. When a user tries to retrieve the message via `getMessage()`, the contract:
   - **Returns the message if it's still valid**.
   - **Deletes it if it has expired**.
4. Users can check expiration status via `isExpired()`.

## 💡 Key Features

- **Automatic Data Expiry** – Messages are automatically deleted after the set time.
- **User-Controlled Duration** – Users decide how long their data should persist.
- **Gas-Efficient Data Removal** – The contract only removes expired data when accessed, minimizing blockchain costs.

## 🛠️ How to Use

### 1️⃣ Deploy the Smart Contract

Deploy the Solidity contract on **Ethereum, Polygon, or any EVM-compatible chain**.

### 2️⃣ Store a Message

Call the `storeMessage()` function with:

- A string message
- A duration in seconds (how long it should persist)

Example:

```solidity
storeMessage("Hello Blockchain!", 86400); // Expires in 24 hours
```

### 3️⃣ Retrieve the Message

Call `getMessage()`. If the message hasn’t expired, it returns the stored content. Otherwise, it returns **"Message expired."** and deletes it.

```solidity
getMessage();
```

### 4️⃣ Check if a Message has Expired

Use `isExpired(address user)`, which returns **true** if the user’s message has expired.

```solidity
isExpired(msg.sender);
```

## 📜 License

This project is open-source under the **MIT License**. Feel free to use, modify, and improve it!

---

💡 **Want to take this further? Let’s build something next-level together!** 🔥
