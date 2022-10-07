// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./TestContract.sol";

contract CallsInSolidity {
    
    address contractAddress;

    constructor(address _contractAddress){
        contractAddress = _contractAddress;
    }

    /*
        The `address` has three members
        among others for making direct contract
        calls and they are as follows:
            - call
            - staticcall
            - delegatecall
        They all take an argument of
        the `bytes` type. And, returns
        a success condition(as `bool`) and\
        the returned data in `bytes`.
    */

    // call
    function useCall() external {
        /*
            abi.encodeWithSelector is used encode
            the function call into bytes for usage in the `call` function.
            abi.encode, abi.encodePacked, and abi.encodeWithSignature can
            be used too.

            This calls the `set` function in TestContract passing `1` as
            argument and returns true and data(if any. In this case, none) if no error is
            thrown in the `set` function.
        */
        bytes memory payload = abi.encodeWithSelector(TestContract.set.selector, 1);
        (bool success, bytes memory data) = contractAddress.call(payload);
        require(success, "Execution Failed");
    }

    // staticcall
    function useStaticCall() external view returns(bytes memory) {
        /*
            `staticcall` is basically the same as `call`,
             but will return `false` if the called function modifies
            the state in any way that's why we call `get` here
            instead of `set.`
        */
        bytes memory payload = abi.encodeWithSelector(TestContract.get.selector);
        (bool success, bytes memory data) = contractAddress.staticcall(payload);
        require(success, "Execution Failed");
        return data;
    }

    // delegatecall
    function useDelegateCall() external returns(bytes memory) {
        /*
            `delegatecall` is also very similar to `call`
            but here the state of contract being called doesn't
            change. Rather, the state of the calling contract(this contract)
            changes.

            For example, here when `set` is called, the `number` value doesn't change.

            ***Be careful using this. It can mess up your storage. And, cause horrible things.
        */
        bytes memory payload = abi.encodeWithSelector(TestContract.set.selector, 1);
        (bool success, bytes memory data) = contractAddress.delegatecall(payload);
        require(success, "Execution Failed");
        return data;
    }

    /*
        Summary:
        All these functions are low-level functions and should be used with care.
        Specifically, any unknown contract might be malicious and if you call it,
        you hand over control to that contract which could in turn call back into your contract,
        so be prepared for changes to your state variables when the call returns.
        The regular way to interact with other contracts is to call a function on a contract object (x.f()).
    */
}