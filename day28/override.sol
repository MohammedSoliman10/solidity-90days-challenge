// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract A {
    function sayHello() pure virtual  public returns( string memory) {
        return "hello from parent";

    }


}

contract B is A{
     
     
    function sayHello() pure override public returns(string memory) {

        return "hello from child";
    }
}