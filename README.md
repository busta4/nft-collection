# Blockchain Accelerator NFT Collection

ERC721 NFT collection deployed on Ethereum, built with Foundry and Solidity.

## Description

**Blockchain Accelerator NFT (BANFT)** is an NFT collection implementing the OpenZeppelin ERC721 standard. Tokens are stored on IPFS, ensuring decentralization and permanence of metadata and images.

### Features

- Standard ERC721 implementation with OpenZeppelin
- Metadata and assets stored on IPFS
- Public minting system
- Configurable limited supply
- Dynamic URIs for each token
- Minting events for on-chain tracking

## Contract Information

- **Name**: Blockchain Accelerator NFT
- **Symbol**: BANFT
- **Total Supply**: 2 NFTs
- **Network**: Ethereum
- **Contract Address**: `0x8f74acc3bb5a26dde49863f70a7455d93f9987d0`
- **Base URI (IPFS)**: `ipfs://bafybeicn6ypif7cy3bbcmteply3itx36vqyiil7zobxmahq7puewgouoce/`

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Git](https://git-scm.com/)
- A wallet with ETH for deployment (if deploying)

## Installation

```bash
# Clone the repository
git clone <your-repository>
cd nft-collection

# Install dependencies
forge install

# Compile contracts
forge build
```

## Project Structure

```
.
├── src/
│   └── BANFTCollection.sol    # Main ERC721 contract
├── script/
│   └── DeployNFTCollection.s.sol  # Deployment script
├── test/                       # Tests (if any)
├── uris/                       # NFT metadata JSON files
│   ├── 0.json
│   └── 1.json
├── lib/                        # Dependencies (OpenZeppelin)
└── foundry.toml               # Foundry configuration
```

## Usage

### Build

```bash
forge build
```

### Run Tests

```bash
forge test
```

### Format Code

```bash
forge fmt
```

### Deploy

1. Create a `.env` file with your private key:

```bash
PRIVATE_KEY=your_private_key_here
```

2. Deploy to a network:

```bash
# Local network (Anvil)
forge script script/DeployNFTCollection.s.sol:DeployNFTCollection --rpc-url http://localhost:8545 --broadcast

# Testnet (example: Sepolia)
forge script script/DeployNFTCollection.s.sol:DeployNFTCollection --rpc-url $SEPOLIA_RPC_URL --broadcast --verify

# Mainnet
forge script script/DeployNFTCollection.s.sol:DeployNFTCollection --rpc-url $MAINNET_RPC_URL --broadcast --verify
```

## Contract Functions

### `mint()`
Mints a new NFT to the caller. Requires available supply.

```solidity
function mint() external
```

**Example with Cast:**
```bash
cast send <CONTRACT_ADDRESS> "mint()" --private-key $PRIVATE_KEY --rpc-url $RPC_URL
```

### `tokenURI(uint256 tokenId)`
Returns the metadata URI for a specific token.

```solidity
function tokenURI(uint256 tokenId) public view returns (string memory)
```

**Example with Cast:**
```bash
cast call <CONTRACT_ADDRESS> "tokenURI(uint256)" 0 --rpc-url $RPC_URL
```

### Getters

```bash
# View total supply
cast call <CONTRACT_ADDRESS> "totalSupply()" --rpc-url $RPC_URL

# View current token ID
cast call <CONTRACT_ADDRESS> "currentTokenId()" --rpc-url $RPC_URL

# View base URI
cast call <CONTRACT_ADDRESS> "baseUri()" --rpc-url $RPC_URL

# View token owner
cast call <CONTRACT_ADDRESS> "ownerOf(uint256)" 0 --rpc-url $RPC_URL
```

## Metadata Structure

Each NFT has a JSON file on IPFS with the following structure:

```json
{
    "name": "Blockchain Accelerator NFT 0",
    "description": "NFT collection by Blockchain Accelerator - Andres Bustamante",
    "image": "ipfs://bafybeic6zzsrrgakjhf6y6h6aflnuzrlrcfvf7uvkbdao2cdmbw6bk5b74",
    "attributes": [
        {
            "trait_type": "Rarity",
            "value": "0"
        }
    ]
}
```

## Events

### `MintNFT(address _userAddress, uint256 _tokenId)`
Emitted when a new NFT is minted.

**Listen to events with Cast:**
```bash
cast logs --address <CONTRACT_ADDRESS> --rpc-url $RPC_URL
```

## Contract Verification

If you deployed with `--verify`, the contract will be verified automatically. Otherwise, you can verify it manually:

```bash
forge verify-contract <CONTRACT_ADDRESS> src/BANFTCollection.sol:BANFTCollection --chain <CHAIN_ID> --etherscan-api-key $ETHERSCAN_API_KEY
```

## Resources

- [Foundry Documentation](https://book.getfoundry.sh/)
- [OpenZeppelin ERC721](https://docs.openzeppelin.com/contracts/5.x/erc721)
- [IPFS](https://ipfs.tech/)
- [NFT Metadata Standard](https://docs.opensea.io/docs/metadata-standards)

## Author

Andres Bustamante - Blockchain Accelerator

## License

UNLICENSED
