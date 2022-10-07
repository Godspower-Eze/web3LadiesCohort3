// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

/*
    This contract implements the TestInterface2
    in Interface2.sol which in turn inherits
    from TestInterface1 in Interface2.sol.
*/

import "./Interface2.sol";

contract TestContract is TestInterface {
    /*
        A contract must implement all the 
        functions specified in an interface
        else it should be marked as abstract
        by adding the `abstract` keyword
        before the `contract` keyword above.
    */

    uint number;

    /*
        The `override` keyword must
        be used when implementing a 
        function from an interface
    */
    function set(uint _num) public override {
        number = _num;
        // event defined in the interface
        emit Set(_num);
    }

    function set2(uint _num) public override {
        number = _num;
        emit Set(_num);
    }

    function get() public view override returns(uint){
        return number;
    }

}