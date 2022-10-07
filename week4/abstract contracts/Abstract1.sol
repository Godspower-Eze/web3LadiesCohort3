// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

abstract contract TestAbstract1 {

    uint number;

    function get() external virtual view returns(uint);
}