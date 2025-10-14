pragma solidity 0.8.23;

interface IAccountManager {
    function getAccountIdOfAddressOnChain(
        bytes32 addr,
        uint16 chainId
    ) external view returns (bytes32);

    /**
     * @notice Remove delegate to address on hub chain to perform operations on account
     * @param accountId The account id to remove the delegate from
     * @param chainId The chain id
     */
    function getAddressRegisteredToAccountOnChain(
        bytes32 accountId,
        uint16 chainId
    ) external view returns (bytes32);

    /**
     * @notice Get address invited to account on given chain
     * @param accountId The account id
     * @param chainId The chain id
     */
    function getAddressInvitedToAccountOnChain(
        bytes32 accountId,
        uint16 chainId
    ) external view returns (bytes32);

    /**
     * @notice Check if account is created
     * @param accountId The account id
     */
    function isAccountCreated(bytes32 accountId) external view returns (bool);

    /**
     * @notice Check if address is registered
     * @param chainId The chain id
     * @param addr The generic address
     */
    function isAddressRegistered(
        uint16 chainId,
        bytes32 addr
    ) external view returns (bool);

    /**
     * @notice Check if address is invited
     * @param accountId The account id
     * @param chainId The chain id
     * @param addr The generic address
     */
    function isAddressInvitedToAccount(
        bytes32 accountId,
        uint16 chainId,
        bytes32 addr
    ) external view returns (bool);

    /**
     * @notice Check if address is registered
     * @param accountId The account id
     * @param chainId The chain id
     * @param addr The generic address
     */
    function isAddressRegisteredToAccount(
        bytes32 accountId,
        uint16 chainId,
        bytes32 addr
    ) external view returns (bool);

    /**
     * @notice Check if address is a delegate
     * @param accountId The account id
     * @param addr The generic address
     */
    function isDelegate(
        bytes32 accountId,
        address addr
    ) external view returns (bool);
}
