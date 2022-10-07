# Interfaces

Interfaces serves as a blueprint on how a contract should work. It specifies the public variables and functions that a contract should implement.

## Rules for building an interface

- They cannot inherit from other contracts, but they can inherit from other interfaces.
- All declared functions must be external in the interface, even if they are public in the contract.
- They cannot declare a constructor.
- They cannot declare state variables.
- They cannot declare modifiers.
