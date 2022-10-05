// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

contract BasicsOfSolidity {

    // CONSTANT AND IMMUTABLE

    string constant public owner = "Godspower Eze";

    address payable immutable public owner2;

    constructor(address payable _addr) {
        owner2 = _addr;
    }

    // Integers

    /**
        Signed(-2 and +6) and Unsigned Integers(3, 5, 7).
    */

    // Unsigned Integers
    uint testUint; 
    uint256 testUInt2;
    uint128 testUInt3;
    uint64 testUInt4;
    uint8 testUInt5;

    uint public uint256Max = type(uint).max; // 0 - 2 ^ n - 1
    uint public uint8Max = type(uint8).max; // 0 - 2 ^ n - 1

    uint256 public uint256Min = type(uint).min;
    uint public uint8Min = type(uint8).min;

    // Signed Integers
    int testInt; 
    int256 testInt2;
    int128 testInt3;
    int64 testInt4;
    int8 testInt5;

    int public int256Max = type(int).max; // 0 to 2 ^ n - 1
    int public int8Max = type(int8).max; // 0 to (2 ^ (n -1)) - 1 = 0 to (2 ^ (8 - 1)) - 1 = 0 to 2 ^ 7 - 1 = 127 

    int256 public int256Min = type(int).min; // 0 to (-2 ^ (n -1))
    int public int8Min = type(int8).min; // 0 to (-2 ^ (n -1)) = 0 to -2 ^ (8 - 1) = 0 to -2 ^ 7 = -128

    // Addresses
    // 0x1d19ef8FC94D8aF1EC921Fd0B4978831D147EBf8
    // address and address payable

    address payable owner3 = payable(0x1d19ef8FC94D8aF1EC921Fd0B4978831D147EBf8);

    function sendEther() public payable {
        owner3.transfer(msg.value);
    }

    // Assignment Problem

    struct TestData {
        string firstName;
        uint age;
    }

    // Mappings
    mapping(int => TestData) public users;
    mapping(uint => string) names;
    mapping(uint => mapping(address => uint)) balances;
    mapping(address => mapping(address => bool)) approved; 
    mapping(string => mapping(address => bool)) approved1;
    mapping(bool => mapping(address => bool)) approved3; // *

    int count;

    function addData(string calldata _firstName, uint _age) external {
        TestData memory _testData = TestData(_firstName, _age);
        count ++;
        users[count] = _testData;
    }

    function returnAge(int _id) external view returns(uint) {
        return users[_id].age; // users[_addr][_addr]
    }

    // Enum
    enum Choices {
        YES,
        NO,
        MAYBE
    }

    Choices myChoice = Choices.YES;

    function getMyChoice() public view returns(string memory){
        if (myChoice == Choices.YES){
            return "Good";
        }else{
            return "Bad";
        }
    }

    // Funtion Types
    // Payable functions and Non-payable

    function acceptEther() public payable returns(uint){
        return msg.value;
    }

    // Pure and View Function
    function getOwner() public view returns (address){
        return owner3;
    }

    function changeOwner() public pure returns (uint){
        uint sum = 2 + 2;
        return sum;
    }

    // Public, external, internal and private
    function doSomething() external pure returns(uint) {
        return 2;
    }

    function callDoSomething() external view returns (uint){
        uint something = this.doSomething();
        return something;
    }

    // Internal - Inside it's own contract and inside a contract inheriting it
    // Private - Inside it's own contract

    // Reference Types
    // Arrays
    // Fixed and Dynamic
    uint[] public arrayOfNums;

    uint[5] public arrayOf5Nums;

    // Nested Array
    uint[][5] public dynamicArrays; 


    function getAllValues() public view returns(uint[] memory){
        return arrayOfNums;
    }

    // Members
    // - length
    // - push()
    // - push(value)
    // - pop()

    // Events
    event Paid (
        uint amount,
        uint time
    );

    function pay() external payable {
        emit Paid(msg.value, block.timestamp);
    }

    modifier onlyOwner(){
        require(msg.sender == owner3, "Not owner");
        _;
    }

    function doStuff() external view onlyOwner returns(string memory){
        return "Stuff";
    }

    // Fallback and Receive
    // Fallback - call non-existent functions and send ether
    // Receive - Send ether
    fallback() external payable {

    }
}