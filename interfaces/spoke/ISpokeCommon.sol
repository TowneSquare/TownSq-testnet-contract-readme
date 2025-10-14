// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.23;

import {Messages} from "../libraries/Messages.sol";
interface ISpokeCommon {
    /**
     * @notice Create account
     * @param params The parameters for sending message to hub chain
     * @param accountId  account id to create
     * @param nonce The nonce used to generate the account id
     * @param refAccountId The account id referrer (use zero bytes if no referrer)
     */
    function createAccount(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes4 nonce,
        bytes32 refAccountId
    ) external payable;

    /**
     * @notice Create loan (alternative is to use "create loan and deposit" method)
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id to create the loan in
     * @param nonce The nonce used to generate the loan id
     * @param loanTypeId The load type to create
     * @param loanName The loan name to help identify the loan to user
     */
    function createLoan(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes4 nonce,
        uint16 loanTypeId,
        bytes32 loanName
    ) external payable;

    /**
     * @notice Withdraw token to registered address of specified chain
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan
     * @param loanId The loan id to withdraw from
     * @param poolId The pool id for the token to withdraw
     * @param chainId The chain id to receive the funds on (must be compatible with token)
     * @param amount The amount to withdraw
     * @param isFAmount Whether the amount is denominated in the ts token or underlying token
     */
    function withdraw(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 loanId,
        uint8 poolId,
        uint16 chainId,
        uint256 amount,
        bool isFAmount
    ) external payable;

    /**
     * @notice Borrow token to registered address of specified chain
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan
     * @param loanId The loan id to borrow using
     * @param poolId The pool id for the token to borrow
     * @param chainId The chain id to receive the funds on (must be compatible with token)
     * @param amount The amount to borrow
     * @param maxStableRate The max stable rate - if zero then is interpreted as variable borrow
     */
    function borrow(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 loanId,
        uint8 poolId,
        uint16 chainId,
        uint256 amount,
        uint256 maxStableRate
    ) external payable;

    /**
     * @notice Repay borrow in specified loan using existing collateral
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan
     * @param loanId The loan id to repay in
     * @param poolId The pool id for the token to repay
     * @param amount The amount to repay
     */
    function repayWithCollateral(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 loanId,
        uint8 poolId,
        uint256 amount
    ) external payable;

    /**
     * @notice Delete loan
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id of the loan to delete
     * @param loanId The load id to delete
     */
    function deleteLoan(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 loanId
    ) external payable;

    /**
     * @notice Accept invite to account (must be sent from chain-address pair accepting the invite)
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id invited to
     */
    function acceptInviteAddress(
        Messages.MessageParams memory params,
        bytes32 accountId
    ) external payable;

    /**
     * @notice Remove (or uninvite) an address of the specified chain from account
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id to unregister the address from
     * @param chainId The chain id of the address to unregister
     */
    function unregisterAddress(
        Messages.MessageParams memory params,
        bytes32 accountId,
        uint16 chainId
    ) external payable;

    /**
     * @notice Delegate to address on hub chain to perform operations on account
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id to add the delegate to
     * @param addr The delegate address
     */
    function addDelegate(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 addr
    ) external payable;

    /**
     * @notice Remove delegate to address on hub chain to perform operations on account
     * @param params The parameters for sending message to hub chain
     * @param accountId The account id to remove the delegate from
     * @param addr The delegate address
     */
    function removeDelegate(
        Messages.MessageParams memory params,
        bytes32 accountId,
        bytes32 addr
    ) external payable;
}
