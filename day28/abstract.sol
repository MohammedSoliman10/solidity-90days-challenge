// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

abstract contract Animal {
    function makeSound() public pure virtual returns (string memory);
}

contract Dog is Animal {
    function makeSound() public pure override returns (string memory) {
        return "wooofff!!";
    }
}

contract Cat is Animal {
    function makeSound() public pure override returns (string memory) {
        return "meowww!";
    }
}