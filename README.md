# Contract Deployments

This document outlines the deployed contracts of the protocol, their core responsibilities, and addresses.  
The architecture follows a **Hub & Spoke** model, with the Hub serving as the coordination layer and Spoke contracts managing chain-specific or asset-specific logic.

---

## Core Contracts

| Contract        | Description                                                        | Deployment Date | Address                                      |
|-----------------|--------------------------------------------------------------------|-----------------|----------------------------------------------|
| SpokeCommon     | Base contract that handles account creation and asset borrowing.   | Apr-01-2025     | `0x072eCA70c5eF4449C64538b55e909527Ed569848` |
| SpokeManager    | Oversees and manages deployed Spoke contracts.                     | Apr-01-2025     | `0x046fE2912af56d2C1a961e122cCC9ceBaF8cb071` |
| AccountManager  | Maintains loan account logic, including creation and updates.      | Apr-01-2025     | `0x46111FC38177Dac8A0c20307114Bc38e15aAeAeE` |
| Hub             | Central coordinator maintaining global state and records.          | Apr-02-2025     | `0xa8515399317d8A73853AA1B2621B2E6757cBaF68` |
| HubPoolLogic    | Core pool logic for the Hub, managing liquidity interactions.      | Apr-02-2025     | `0xc21A86Ff5c24c097D3C463d94e641381d7d1d4b9` |

---

## Loan Management

| Contract           | Description                                           | Deployment Date | Address                                      |
|--------------------|-------------------------------------------------------|-----------------|----------------------------------------------|
| LoanManager        | Maintains records of all active loans.                | Apr-02-2025     | `0xeB625D89d7C017F6A8CF8E859500bC9f9790D743` |
| LoanManagerLogic   | Execution logic for loan-related operations.          | Apr-01-2025     | `0x79fF7e7cfd1AF5E2b982a95E72C491084932e8aD` |
| LoanManagerState   | Tracks and stores loan states across the protocol.    | Apr-01-2025     | `0xe05B323481b2a280D99aa418bd2fCafcEec538a8` |
| LoanPoolLogic      | Pool-level lending and borrowing logic.               | Apr-01-2025     | `0xd46804DB6979bCC50C5683D2bE240B22B61B5531` |
| UserLoanLogic      | Handles user-facing loan logic and calculations.      | Apr-01-2025     | `0xf8ef3E07f2eB0826417FB3573C7f157C97824b9E` |
| LiquidationLogic   | Enforces liquidation rules for under-collateralized positions. | Apr-01-2025 | `0x22387a2224D0935cd961196BD48aB8b0EF114848` |

---

## Messaging & Cross-Chain Infrastructure

| Contract          | Description                                    | Deployment Date | Address                                      |
|-------------------|------------------------------------------------|-----------------|----------------------------------------------|
| HubAdapter        | Relays messages between the Hub and Spoke.     | Apr-01-2025     | `0x64A52a07712E006d37035FC1666a5b297E9EeC66` |
| WormHoleAdapter   | Integrates with Wormhole for cross-chain messaging. | Apr-01-2025 | `0xc3B4936DD9069DeD7c98Af00466A50C8c6654F15` |
| BridgeRouterHub   | Facilitates message relaying for the Hub.      | Apr-01-2025     | `0x10CfC510c2aBaed65339ce54FF793B22967452fc` |
| BridgeRouterSpoke | Facilitates message relaying for Spoke.        | Apr-01-2025     | `0xFF2ab3eBE4628790f3Cb6d2a1c6727D9BD953B8C` |

---

## Price & Oracle

| Contract      | Description                         | Deployment Date | Address                                      |
|---------------|-------------------------------------|-----------------|----------------------------------------------|
| OracleManager | Manages price feeds for asset pools | Apr-01-2025     | `0x3D88c37172c6156E07766CdFAc0d38b557029E43` |

---

## Spoke Asset Pools

Each Spoke contract represents a token pool where users can deposit and interact with assets:

| Contract                  | Deployment Date | Address                                      |
|---------------------------|-----------------|----------------------------------------------|
| SpokeGasToken (MON)       | Apr-02-2025     | `0xB3e5A792E03ca65BBcFeA28BCDeD5C7406bcEa10` |
| SpokeERC20Token (wMON)    | Aug-18-2025     | `0x4052d6BC1C3795ACe3A68184B859Fdb2b757d8a9` |
| SpokeERC20Token (wETH)    | May-20-2025     | `0x4A8f7e9A4B20E323bdDE44EF17489c435B628434` |
| SpokeERC20Token (aprMON)  | May-20-2025     | `0x243E0DC94CF51ecc584005ba76A3f89507054B0a` |
| SpokeERC20Token (PT-aprMON) | Jul-17-2025   | `0x73ABE942Ca09885e53237e0091e474d544900ccd` |
| SpokeERC20Token (USDC)    | May-21-2025     | `0x9A730fFC53756928c14179660c5b6A622d2d27Bd` |
| SpokeERC20Token (USDT)    | Aug-14-2025     | `0x8963EBeBAAEE644e75449560549F813fd68f05CB` |
| SpokeERC20Token (shMON)   | May-21-2025     | `0xA0D305c9c24cca6bA2D727886202E331ac9ed59D` |
| SpokeERC20Token (sMON)    | May-21-2025     | `0x859270aB02a0bE5442397b4dECc87E67Db717998` |
| SpokeERC20Token (gMON)    | May-21-2025     | `0x9bcCa261B52346f7C26b82993A1f83Fb1e83a3e2` |
| SpokeERC20Token (muBOND)  | May-21-2025     | `0x9Ec59000F3978795337e87629Fe9a8F7Af461f4B` |
| SpokeERC20Token (wBTC)    | May-21-2025     | `0x432604341627F5D2cDE2b0189018329D0E491e6b` |

---

## Hub Token Pools

| Token   | Deployment Date | Address                                      |
|---------|-----------------|----------------------------------------------|
| MON     | Apr-02-2025     | `0x9BCeEA5cF70F801d461AE40eBF75Dda72a02696c` |
| wMON    | Aug-18-2025     | `0xA0086F46136D388a6176aA1d640e1718E49DcB22` |
| wETH    | Aug-18-2025     | `0x74d7c47351E42C65824Ad4AC571CbEc993e3445F` |
| aprMON  | May-20-2025     | `0x0BADD782eAa412b3Cc4ae199A4e0eDf68d021d66` |
| PT-aprMON | Jul-17-2025   | `0x7F71609e81C93a6808cEBC860F2330AD9b00D6eD` |
| USDC    | May-21-2025     | `0x6ddd30336163ab7866FC0f1755b8e9B5fEdd49b8` |
| USDT    | Aug-14-2025     | `0x7244Ff5362fe25D5814E031f1E5B5B61D00ba8D9` |
| shMON   | May-21-2025     | `0x71B4A3A051735BFC53275Fb3D7dDf5E282BB6D8C` |
| sMON    | May-21-2025     | `0xBc8913A1AB93717A3FC0BDc207F12C1F7fB0abA3` |
| gMON    | May-21-2025     | `0x5407f318EBE3Fb2C3aCf1cA8218c12C3BbA1F6f0` |
| muBOND  | May-21-2025     | `0x68507427e7ADF9ec7B3E1a94cCba022f45B68c9d` |
| wBTC    | May-21-2025     | `0xB4D5E8114366c1e4bf4bbB48962270a7873fC2F0` |
