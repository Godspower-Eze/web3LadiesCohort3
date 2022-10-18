// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

contract Namer {

    string public name;

    constructor() {
        name = "Godspower Eze";
    }

    function updateName(string calldata _name) external {
        name = _name;
    }
}


