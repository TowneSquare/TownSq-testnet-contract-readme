// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.23;

import {Messages} from "../libraries/Messages.sol";

interface ISpokeToken {
    /**
     * @notice Create loan and deposit token into new loan
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan
     * @param nonce The nonce used to generate the loan id
     * @param amount The amount to deposit
     * @param loanTypeId The load type to create
     * @param loanName The loan name to help identify the loan to user
     */
    function createLoanAndDeposit(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes4 nonce,
        uint256 amount,
        uint16 loanTypeId,
        bytes32 loanName
    ) external payable;

    /**
     * @notice Deposit token into specified loan
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan
     * @param loanId The loan id to deposit into
     * @param amount The amount to deposit
     */
    function deposit(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 loanId,
        uint256 amount
    ) external payable;

    /**
     * @notice Repay borrow in specified loan
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan
     * @param loanId The loan id to repay in
     * @param amount The amount to repay
     * @param maxOverRepayment The maximum acceptable threshold to over-repay by (excess not refunded)
     */
    function repay(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 loanId,
        uint256 amount,
        uint256 maxOverRepayment
    ) external payable;

    /**
     * @notice returns poolId
     */

    function poolId() external view returns (uint8);
}
