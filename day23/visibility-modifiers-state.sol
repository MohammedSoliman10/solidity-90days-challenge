// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VisibilityDemo {

    // ---------------------------------------------------
    // STATE VARIABLE VISIBILITY
    // Solidity gives state variables 3 visibility options:
    // public, internal, private
    // (external is NOT allowed for state variables)
    // ---------------------------------------------------

    // 1) PUBLIC
    // - Accessible from inside this contract
    // - Accessible from derived (child) contracts
    // - Accessible from OUTSIDE (other contracts, frontend, etc.)
    // - Solidity automatically creates a free getter function for it
    uint public totalSupply = 1000;
    address public owner;

    // 2) INTERNAL (this is the DEFAULT if you write nothing)
    // - Accessible inside this contract
    // - Accessible from contracts that INHERIT from this one
    // - NOT accessible from outside / other unrelated contracts
    uint internal reserveBalance = 500;
    address internal treasury;

    // 3) PRIVATE
    // - Accessible ONLY inside this exact contract
    // - NOT accessible even in child contracts that inherit from it
    // - NOT accessible from outside
    uint private secretCode = 12345;
    address private admin;

    constructor(address _owner, address _treasury, address _admin) {
        owner = _owner;
        treasury = _treasury;
        admin = _admin;
    }

    // Because secretCode and admin are private, the only way to
    // read them from outside is through a function you write yourself
    function getSecretCode() public view returns (uint) {
        return secretCode;
    }

    function getAdmin() public view returns (address) {
        return admin;
    }
}


// ---------------------------------------------------
// Child contract to prove the internal vs private difference
// ---------------------------------------------------
contract ChildContract is VisibilityDemo {

    constructor(address _owner, address _treasury, address _admin)
        VisibilityDemo(_owner, _treasury, _admin)
    {}

    function readInternalVars() public view returns (uint, address) {
        // ✅ Works: internal vars ARE visible to child contracts
        return (reserveBalance, treasury);
    }

    // function readPrivateVars() public view returns (uint) {
    //     ❌ This would FAIL to compile:
    //     return secretCode;
    //     "secretCode" is private to VisibilityDemo, not visible here
    // }
}