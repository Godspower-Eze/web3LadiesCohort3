// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./Library2.sol";

contract TestLibrary2 {

    /*
        This enables another way
        of using libraries as used
        below in `changeFirstName` and 
        `changeLastName`. It automatically 
        makes the type `Data` the first argument
        and then takes only the second argument
        as the only argument.
    */
    using DataLib for Data;

    uint count;

    mapping (uint => Data) public users;

    function addUser(string memory _firstName, string memory _lastName) external {
        Data memory _data;
        _data.firstName = _firstName;
        _data.lastName = _lastName;
        count++;
        users[count] = _data;
    }

    function changeFirstName(uint _id, string memory _newFirstName) external {
        users[_id].changeFirstName(_newFirstName);
    }

    function changeLastName(uint _id, string memory _newLastName) external {
        users[_id].changeLastName(_newLastName);
    }

}