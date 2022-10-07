// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

contract TestContract {

    uint number;

    function set(uint _num) public {
        number = _num;
    }

    function get() public view returns(uint){
        return number;
    }
}