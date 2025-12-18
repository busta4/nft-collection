// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import {BANFTCollection} from "../src/BANFTCollection.sol";

contract DeployNFTCollection is Script {
    function run() external returns (BANFTCollection) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        string memory _name = "Blockchain Accelerator NFT";
        string memory _symbol = "BANFT";
        uint256 _totalSupplay = 2;
        string
            memory _baseUri = "ipfs://bafybeicn6ypif7cy3bbcmteply3itx36vqyiil7zobxmahq7puewgouoce/";
        BANFTCollection nftCollection = new BANFTCollection(
            _name,
            _symbol,
            _totalSupplay,
            _baseUri
        );

        vm.stopBroadcast();
        return nftCollection;
    }
}
