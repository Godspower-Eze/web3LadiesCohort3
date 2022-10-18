// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract W3L_1155 is ERC1155 {
    constructor() ERC1155("https://godspowereze.com/"){}
}