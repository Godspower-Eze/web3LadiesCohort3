// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

struct Data {
    string firstName;
    string lastName;
}

library DataLib {

    function changeFirstName(Data storage _data, string memory _newName) internal {
        _data.firstName = _newName;
    }

    function changeLastName(Data storage _data, string memory _newName) internal {
        _data.lastName = _newName;
    }
}