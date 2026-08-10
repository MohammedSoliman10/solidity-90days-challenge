// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Freelancing {
    // enum
    enum JobStatus { Open, Taken, Completed, Cancelled }

    // structs
    struct Job {
        string title;
        string description;
        uint256 bounty;
        address client;
        address freelancer;
        JobStatus status;
    }

    // constants & state vars
    uint256 public listingFee = 0.001 ether;
    address public owner;
    uint256 public totalJobs;

    // mappings
    mapping(uint256 => Job) public jobs;
    mapping(address => uint256) public freelancerReputation;

    // events
    event JobCreated(uint256 indexed jobId, address indexed client, uint256 bounty);
    event JobCompleted(uint256 indexed jobId, address indexed freelancer);

    // errors
    error InsufficientFunds();

    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    // functions
    constructor() {
        owner = msg.sender;
    }
}