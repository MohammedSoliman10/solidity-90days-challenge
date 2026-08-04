# 🎓 Student Grading System — Solidity Smart Contract

A mini-project built as part of my **90-Day Web3 & Blockchain Challenge**, demonstrating core Solidity patterns: structs, nested mappings, access control, and safe on-chain array manipulation.

## 📋 Overview

A simple on-chain grading system where a **teacher** (the contract deployer) can register students and manage their grades. All data is transparent and tamper-evident — every write is a verifiable transaction on-chain.

## ✨ Features

- **Student registration** — teacher-only, prevents duplicate enrollment
- **Grade management** — add, update, and delete grades per student
- **Safe array deletion** — uses the swap-and-pop pattern instead of Solidity's `delete`, which only zeroes out an array slot rather than removing it
- **Read functions** — fetch all grades, grade count, and calculated average
- **Access control** — an `onlyTeacher` modifier restricts all write operations to the contract owner
- **Input validation** — enrollment checks, grade bounds (0–100), array index bounds, and a divide-by-zero guard on average calculation

## 🛠 Tech Stack

- **Solidity** `^0.8.20`
- Developed and tested in **Remix IDE**

## 📜 Contract Functions

| Function | Access | Description |
|---|---|---|
| `registerStudent(address, string)` | `onlyTeacher` | Enrolls a new student |
| `addGrade(address, uint256)` | `onlyTeacher` | Adds a grade (0–100) to a student |
| `updateGrade(address, uint256, uint256)` | `onlyTeacher` | Updates a grade at a given index |
| `deleteGrade(address, uint256)` | `onlyTeacher` | Removes a grade using swap-and-pop |
| `getAllGrades(address)` | `view` | Returns a student's full grade list |
| `getGradeCount(address)` | `view` | Returns number of grades recorded |
| `getAverageGrade(address)` | `view` | Returns the average of a student's grades |

## 🧠 Key Concepts Practiced

- Structs for grouping related student data
- Mappings for efficient on-chain lookups (`address => Student`)
- Custom modifiers for reusable access control
- The swap-and-pop pattern for removing array elements without leaving gaps
- `view` functions for gas-free off-chain reads
- Defensive programming: bounds checks, enrollment checks, and range validation on every write

## 🚀 Getting Started

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Create a new file and paste `StudentGradingSystem.sol`
3. Compile with Solidity `^0.8.20`
4. Deploy to a JavaScript VM or testnet
5. The deploying account becomes the `teacher` — only that account can register students or manage grades

## 🔜 Next Steps

- [ ] Add `event` declarations for on-chain activity tracking (`StudentRegistered`, `GradeAdded`, `GradeUpdated`, `GradeDeleted`)
- [ ] Write Foundry tests to verify access control and edge cases
- [ ] Explore a second role (e.g. `assistantTeacher`) with limited permissions

## 📚 Part of

This project is part of my [90-Day Web3 & Blockchain Challenge](#), where I'm building and documenting my Solidity learning journey in public.

Follow along:
- 🐦 X (Twitter): [@MohammedSolly05](https://twitter.com/MohammedSolly05)
- 💻 GitHub: [@MohammedSoliman10](https://github.com/MohammedSoliman10)

---

*License: MIT*
