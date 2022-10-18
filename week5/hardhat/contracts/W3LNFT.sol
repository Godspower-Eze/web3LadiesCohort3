// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract W3L_NFT is ERC721 {
    constructor() ERC721("Web 3 Ladies NFT", "W3L"){}
}