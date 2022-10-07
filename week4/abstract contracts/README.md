# Abstract Contracts

Contracts must be marked as abstract when at least one of their functions is not implemented. That is, when a function in a contract is created without a implementation body like so:

```sol
function get() public virtual returns (bytes32);
```

The *virtual* keyword makes it possible for the function to overriden by an inheriting contract.

Even if the above condition is not the case, a contract may still be marked abstract, such as when you do not intend for the contract to be created directly but rather inherited by other contracts.

If a contract inherits from an abstract contract and does not implement all non-implemented functions by overriding, it needs to be marked as abstract as well.

The main difference an abstract contract and an interface is the interfaces are stricter.
