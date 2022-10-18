// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "src/Test.sol";

contract NamerTest is DSTest {
    Namer _namer;

    function setUp() public {
        _namer = new Namer();
    }

    function testName() public {
        assertEq(_namer.name(), "Godspower Eze");
    }
    
    function testUpdateName() public {
        assertEq(_namer.name(), "Godspower Eze");
        _namer.updateName("Bakare");
        assertEq(_namer.name(), "Bakare");
        emit log_string(_namer.name());
    }
}
