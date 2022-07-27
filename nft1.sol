// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GameItem is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // mapping 拥有权关系 tokenId => address
    // mapping 信息检索关系 tokenId => tokenUri => json

    // name 全称 如 DOGE COIN
    // symbol 简称 如 DOGE
    constructor() ERC721("GameItem", "ITM") {}

    function awardItem(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 newItemId = _tokenIds.current(); // 0
        _mint(player, newItemId);   // userAddress => tokenId
        _setTokenURI(newItemId, tokenURI); // tokenId => tokenUrI => json

        _tokenIds.increment(); // 1
        return newItemId;
    }
}
