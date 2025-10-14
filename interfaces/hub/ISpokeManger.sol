// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface ISpokeManager {
    function activateSpoke(uint16 chainId, bytes32 addr) external;
    function depreciateSpoke(uint16 chainId, bytes32 addr) external;
    function isSpoke(uint16 chainId, bytes32 addr) external view returns (bool);
}
