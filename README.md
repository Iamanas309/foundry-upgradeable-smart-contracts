# Foundry Upgradeable Smart Contracts

A UUPS upgradeable smart contract system built with Foundry and OpenZeppelin. Includes proxy deployment, implementation upgrades, and live deployment on Sepolia testnet.

## Contracts

- **BoxV1** - Initial implementation with getNumber() and version()
- **BoxV2** - Upgraded implementation adding setNumber()
- **ERC1967Proxy** - Proxy contract holding all state and permanent address

## Deployed on Sepolia

| Contract | Address |
|----------|---------|
| BoxV1 | 0x81dCC96264daF7C8F5D8Ee48Ee4eba7Ed2Da9B65 |
| ERC1967Proxy | 0x7E4573269075aFc77760728ab6C4AE8993C92621 |
| BoxV2 | 0x7B84F5484a18aa7e95691276b31C048A2bDDe77F |

## Getting Started

Install dependencies: make install
Build: make build
Test: make test
Deploy: make deploy ARGS="--network sepolia"
Upgrade: make upgrade ARGS="--network sepolia"

## Environment Variables

Create a .env file with:
SEPOLIA_RPC_URL=your_rpc_url
ETHERSCAN_API_KEY=your_etherscan_api_key

## License
MIT