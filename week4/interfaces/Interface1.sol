// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

// An interface is defined using the `interface` keyword
interface TestInterface {

    /*
        A struct can be defined in an interface
    */
    struct Caller {
        uint addr;
    }
    
    /*
        An enum can be defined in an interface
    */
    enum Choices {
        YES,
        NO
    }

    /*
        An event can be defined in an interface
    */
    event Set(uint);

    /*
        This represents a function with
        the name `set` and which returns no value.
    */
    function set(uint _num) external;


    /*
        This works too
    */
    function set2(uint) external;


    /*
        This represents a function with
        the name `get` and which returns a uint.
    */
    function get() external returns(uint);
}