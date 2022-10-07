// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./Library1.sol";

contract TestLibrary1 {

    /*
        Here, the library `Math` serves
        the purpose of avoiding code repetition 
    */
    function getMax(uint _a, uint _b) external pure returns(uint) {
        return Math.getMax(_a, _b);
    }
}