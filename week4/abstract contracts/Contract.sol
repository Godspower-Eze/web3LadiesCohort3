// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./Abstract2.sol";

contract TestContract is TestAbstract2 {

    function get() external view override returns(uint){
        return number;
    }

}