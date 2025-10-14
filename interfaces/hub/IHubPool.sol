// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.23;

import {Messages} from "../libraries/Messages.sol";

interface IHubPool {
    struct DepositData {
        uint16 optimalUtilisationRatio; // 4 d.p.
        uint256 totalAmount;
        uint256 interestRate; // 18 d.p.
        uint256 interestIndex; // 18 d.p.
    }

    struct VariableBorrowData {
        uint32 vr0; // 6 d.p.
        uint32 vr1; // 6 d.p.
        uint32 vr2; // 6 d.p.
        uint256 totalAmount;
        uint256 interestRate; // 18 d.p.
        uint256 interestIndex; // 18 d.p.
    }

    struct ConfigData {
        bool deprecated;
        bool stableBorrowSupported;
        bool canMintTsToken;
        bool flashLoanSupported;
    }

    /**
     * @notice returns poolId
     */
    function getPoolId() external view returns (uint8);

    function getDepositData() external view returns (DepositData memory);

    function getVariableBorrowData()
        external
        view
        returns (VariableBorrowData memory);

    function getConfigData() external view returns (ConfigData memory);

    function decimals() public view override returns (uint8) {
}
