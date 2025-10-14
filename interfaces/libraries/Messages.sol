// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.23;

library Messages {
    error InvalidExtraArgsTag();

    struct MessageParams {
        uint16 adapterId; // where to route message through
        uint16 returnAdapterId; // if applicable, where to route message through for return message
        uint256 receiverValue; // amount of value to attach for receive message
        uint256 gasLimit; // gas limit for receive message
        uint256 returnGasLimit; // if applicable, gas limit for return message
    }

    enum Action {
        // SPOKE -> HUB
        CreateAccount,
        InviteAddress,
        AcceptInviteAddress,
        UnregisterAddress,
        AddDelegate,
        RemoveDelegate,
        CreateLoan,
        DeleteLoan,
        CreateLoanAndDeposit,
        Deposit,
        DepositTsToken,
        Withdraw,
        WithdrawTsToken,
        Borrow,
        Repay,
        RepayWithCollateral,
        Liquidate,
        SwitchBorrowType,
        // HUB -> SPOKE
        SendToken,
        // ADDITIONAL
        ClaimRewardsV2,
        P20,
        P21,
        P22,
        P23,
        P24,
        P25,
        P26,
        P27,
        P28,
        P29,
        P30,
        P31,
        P32,
        P33,
        P34,
        P35,
        P36,
        P37,
        P38,
        P39,
        P40,
        P41,
        P42,
        P43,
        P44,
        P45,
        P46,
        P47,
        P48,
        P49,
        P50,
        P51,
        P52,
        P53,
        P54,
        P55,
        P56,
        P57,
        P58,
        P59,
        P60,
        P61,
        P62,
        P63
    }

    function convertEVMAddressToGenericAddress(
        address addr
    ) internal pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    function convertGenericAddressToEVMAddress(
        bytes32 addr
    ) internal pure returns (address) {
        return address(uint160(uint256(addr)));
    }
}
