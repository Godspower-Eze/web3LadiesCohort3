// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

library Math {

    function getMax(uint _a, uint _b) internal pure returns(uint) {
        return _a > _b ? _a : _b;
    }
    
}