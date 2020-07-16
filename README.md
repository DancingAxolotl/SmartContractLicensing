# License Smart Contract
A basic licensing smart contract that can check different licensing tiers (e.g. Basic and Pro), license expiration and license usages.

## Building
The project uses truffle for building and deployment.
```npm install -g truffle```

To build smart contracts run
```truffle build```

To deploy smart contracts run
```truffle migrate```
Several networks can be selected for deployment (local devnet or public testnet). See https://www.trufflesuite.com/docs/truffle/overview for more information on how to use truffle.

## Contracts
The repository contains 4 smart contract files, located in the contracts folder:
 - LicenseToken.sol
  Main ERC721 contract. Represents the licenses that are issued to users. Allows to create new licenses and check the status of existing licenses.
 - TieredLicense.sol
  Provides the tier and expiration logic of the license.
 - CountableLicense.sol
  Provides the usage count logic for the license.
 - Migrations.sol
  Internal smart contract for Truffle migrations, not used.

## Usage
The basic way to use the smart contract is the following:
1. Deploy the LicenseToken smart contract to a blockchain network.
2. Get addresses from users and issue licenses to users using the smart contract.
3. Check if the licenses are valid or if they expired.

The licenses can be issued automatically, e.g. by a back-end system that is selling licenses.
The checks can be performed by the app that is being licensed. Depending on the context, the tier or the remaining usage count may be checked.
