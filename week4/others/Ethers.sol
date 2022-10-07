// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;


contract Ether {

    function sendUsingTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendUsingSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendUsingCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    /*
        Returns the balance of this contract in WEI.
        1 Ether = 10 ^ 18 WEI
    */
    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}