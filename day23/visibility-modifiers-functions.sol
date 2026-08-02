// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionVisibilityDemo {

    uint public counter = 0;

    // ---------------------------------------------------
    // FUNCTION VISIBILITY
    // Functions have 4 visibility options:
    // public, external, internal, private
    // ---------------------------------------------------

    // 1) PUBLIC
    // - Callable from inside this contract
    // - Callable from derived (child) contracts
    // - Callable from OUTSIDE (other contracts, frontend, etc.)
    function publicFunction() public pure returns (string memory) {
        return "I can be called from anywhere";
    }

    // 2) EXTERNAL
    // - CANNOT be called directly from inside the contract using just its name
    //   (you'd need "this.externalFunction()", which costs more gas)
    // - Callable from OUTSIDE only (other contracts, frontend)
    // - NOT callable by simply naming it inside the same contract
    // - Slightly more gas-efficient than public for large arguments,
    //   since args are read straight from calldata
    function externalFunction() external pure returns (string memory) {
        return "I can only be called from outside";
    }

    // 3) INTERNAL (this is the DEFAULT if you write nothing)
    // - Callable inside this contract
    // - Callable from contracts that INHERIT from this one
    // - NOT callable from outside
    function internalFunction() internal pure returns (string memory) {
        return "I can be called inside this contract or child contracts";
    }

    // 4) PRIVATE
    // - Callable ONLY inside this exact contract
    // - NOT callable even in child contracts that inherit from it
    // - NOT callable from outside
    function privateFunction() private pure returns (string memory) {
        return "I can only be called right here in this contract";
    }

    // ---------------------------------------------------
    // Proving how they interact with each other
    // ---------------------------------------------------
    function callEverythingInternally() public view returns (string memory) {
        // ✅ public - always fine
        publicFunction();

        // ❌ external functions CANNOT be called like this:
        // externalFunction();
        // You'd have to do: this.externalFunction();
        // (uses a message call instead of a direct jump, costs more gas)

        // ✅ internal - fine, we're inside the contract
        internalFunction();

        // ✅ private - fine, we're inside the exact same contract
        privateFunction();

        return "Check the code comments for what worked and what didn't";
    }

    function callExternalTheRightWay() public view returns (string memory) {
        // ✅ This is how you call an external function from inside
        return this.externalFunction();
    }

    function incrementCounter() external {
        counter++;
    }
}


// ---------------------------------------------------
// Child contract to prove internal vs private difference
// ---------------------------------------------------
contract ChildFunctionContract is FunctionVisibilityDemo {

    function callInternalFromChild() public pure returns (string memory) {
        // ✅ Works: internal functions ARE visible to child contracts
        return internalFunction();
    }

    // function callPrivateFromChild() public pure returns (string memory) {
    //     ❌ This would FAIL to compile:
    //     return privateFunction();
    //     "privateFunction" is private to the parent, not visible here
    // }
}