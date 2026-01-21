// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {FlashLoanSimpleReceiverBase} from "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashArb is FlashLoanSimpleReceiverBase {
    address public owner;

    constructor(address _addressProvider) FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) {
        owner = msg.sender;
    }

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external override returns (bool) {
        // ARBITRAGE LOGIC GOES HERE
        // 1. Swap 'asset' on DEX A for 'TargetToken'
        // 2. Swap 'TargetToken' on DEX B for 'asset'
        
        uint256 amountToRepay = amount + premium;
        IERC20(asset).approve(address(POOL), amountToRepay);
        return true;
    }

    function requestFlashLoan(address _token, uint256 _amount) public {
        POOL.flashLoanSimple(address(this), _token, _amount, "", 0);
    }
}
