// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

/*
    Build a wallet application that allows any user to store, send and deposit ether.
    Features:
        - Custom Error messages
        - Use of events after key operations
    Hint: Contract should be able to receive and use a modifier to enforce ownership.
*/

contract Wallet {
    address public owner;
    mapping (address => uint) public balances;
    uint ownerFee;

    event Stored(uint timestamp, address sender, uint amount);
    event Withdraw(uint timestamp, address sender, uint amount);
    event Transfer(uint timestamp, address sender, address receiver, uint amount);

    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can call");
        _;
    }

    modifier onlyUser(uint _amount){
        require(balances[msg.sender] >= _amount, "Insufficient fund");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    // Stores Ether
    receive() external payable {
        ownerFee += msg.value / 10;
        balances[msg.sender] += msg.value - (msg.value / 10);
        emit Stored(block.timestamp, msg.sender, msg.value);
    }

    // Withdraws Ether
    function withdraw(uint _amount) onlyUser(_amount) external {
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdraw(block.timestamp, msg.sender, _amount);
    }

    // Transfer Ether
    function transfer(uint _amount, address _receiver) onlyUser(_amount) external {
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
        emit Transfer(block.timestamp, msg.sender, _receiver, _amount);
    }

    // Own Withdraws Ether
    function ownerWithdraw() onlyOwner external {
        payable(msg.sender).transfer(ownerFee);
        ownerFee = 0;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function changeOwner(address _addr) onlyOwner external {
        owner = _addr;
    }

}