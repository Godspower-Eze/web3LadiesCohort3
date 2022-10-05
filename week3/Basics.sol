// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

contract BasicsOfSolidity {

    // CONSTANT AND IMMUTABLE

    string constant public owner = "Godspower Eze";

    address immutable public owner2;

    constructor() {
        owner2 = msg.sender;
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

    function addData(string memory _firstName, uint _age) external {
        TestData memory _testData = TestData(_firstName, _age);
        count ++;
        users[count] = _testData;
    }

    function returnAge(int _id) external view returns(uint) {
        return users[_id].age; // users[_addr][_addr]
    }

    // Strings
    // string public testString = "ffff";

    // function testStringFunc() public returns(string memory) {
    //     return testString.length;
    // }

    // function testStringFunc2()
    
}