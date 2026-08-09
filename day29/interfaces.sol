// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IAnimal {
    function makeSound() external  pure  returns (string memory);
}

contract Dog is IAnimal {
    function makeSound() public pure override returns (string memory) {
        return "wooofff!!";
    }
}

contract Cat is IAnimal {
    function makeSound() public pure override returns (string memory) {
        return "meowww!";
    }
}