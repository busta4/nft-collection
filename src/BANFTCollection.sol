// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.24;

// bafybeicn6ypif7cy3bbcmteply3itx36vqyiil7zobxmahq7puewgouoce

import {ERC721} from "openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Strings} from "openzeppelin/contracts/utils/Strings.sol";

contract BANFTCollection is ERC721 {
    using Strings for uint256;

    uint256 public currentTokenId;
    uint256 public totalSupply;
    string public baseUri;

    event MintNFT(address _userAddress, uint256 _tokenId);

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply,
        string memory _baseUri
    ) ERC721(_name, _symbol) {
        totalSupply = _totalSupply;
        baseUri = _baseUri;
    }

    function mint() external {
        require(currentTokenId < totalSupply, "Sold out");

        _safeMint(msg.sender, currentTokenId);
        currentTokenId++;

        emit MintNFT(msg.sender, currentTokenId - 1);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseUri;
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length > 0
                ? string.concat(baseURI, tokenId.toString(), ".json")
                : "";
    }
}
