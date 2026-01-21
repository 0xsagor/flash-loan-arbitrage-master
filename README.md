# Flash Loan Arbitrage Master

This repository contains a high-performance, atomic arbitrage engine. It is designed to borrow hundreds of thousands of dollars in capital, execute a multi-hop trade across different DEXs, and repay the loan—all within a single Ethereum transaction.

### How It Works
* **Flash Loan:** Borrows assets from Aave V3 with 0 collateral.
* **Arbitrage Logic:** The `executeOperation` callback swaps Asset A for Asset B on Uniswap, then back to Asset A on SushiSwap or Curve at a higher price.
* **Profit Logic:** If the final amount is less than the loan + fee, the transaction automatically reverts, ensuring you never lose your own capital (except for gas).

### Technical Flow
1. **Trigger:** A bot detects a price gap off-chain and calls `requestFlashLoan`.
2. **Execution:** Aave sends funds -> `FlashArb.sol` executes swaps -> Profit remains in contract.
3. **Repayment:** Contract automatically returns the principal plus the 0.05% Aave fee.



### Warning
Arbitrage is highly competitive. Successful execution depends on low-latency mempool monitoring and gas price optimization.
