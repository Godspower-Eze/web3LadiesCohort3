// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./Abstract1.sol";

/*
    This contract is marked as abstract
    because inherits from an abstract contract
    but it doesn't implement it's functions.
*/

abstract contract TestAbstract2 is TestAbstract1 {

}