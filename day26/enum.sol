// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ENUM {
    
    // define enum
   enum status {
    Pending, // 0 
    Shipped, // 1 
    Delivered, // 2  
    Cancelled // 3
   } 
    status public orderStatus;

    function shiporder() public {
        orderStatus = status.Shipped
    }

    function deliveredorder() public {
        orderStatus = status.Delivered
    }

    function cancelledorder() public {
        orderStatus = status.Cancelled;
    }

    function resetorder() public {
        delete orderStatus;
    }


}