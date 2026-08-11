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
    uint256 constant REPUTATION_REWARD = 1;
    uint256 public listingFee = 0.001 ether;
    address public owner;
    uint256 public totalJobs;

    // mappings
    mapping(uint256 => Job) public jobs;
    mapping(address => uint256) public freelancerReputation;

    // events
    event JobCreated(uint256 indexed jobId, address indexed client, uint256 bounty);
    event JobTaken(uint256 indexed jobId, address indexed freelancer);
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

    function postJob(string calldata _title, string calldata _description) external payable {
        if (msg.value <= listingFee){
            revert InsufficientFunds();
        }
        totalJobs++;  //job id
        jobs[totalJobs] = Job({
            title: _title,
            description: _description,
            bounty: msg.value - listingFee,
            client: msg.sender,
            freelancer: address(0),
            status: JobStatus.Open    
        });
        emit JobCreated(totalJobs, msg.sender, msg.value - listingFee);

    }

    function getAllJobs() external view returns (Job[] memory) {
        Job[] memory allJobs = new Job[](totalJobs);
        for (uint256 i = 1; i <= totalJobs; i++) {
            allJobs[i - 1] = jobs[i];
        }
        return allJobs;
    }

    function acceptJob(uint256 _jobId) external {
        Job storage job = jobs[_jobId];
        require(job.status == JobStatus.Open, "Job not available");
        require(job.client != msg.sender, "Client cannot accept their own job");
        job.freelancer = msg.sender;
        job.status = JobStatus.Taken;
        emit JobTaken(_jobId, msg.sender);
    }

    function completeJob(uint256 _jobId) external {
        Job storage job = jobs[_jobId];
        require(job.status == JobStatus.Taken, "Job not taken");
        require(msg.sender == job.client, "Only client can mark job as completed");
        job.status = JobStatus.Completed;
        freelancerReputation[job.freelancer] += REPUTATION_REWARD;
        emit JobCompleted(_jobId, msg.sender);
        (bool success, ) = payable(job.freelancer).call{value: job.bounty}(""); 
        require(success, "Transfer failed");
    }

    function setListingFee(uint256 _newFee) external onlyOwner {
        listingFee = _newFee;
    }
    function getPlatformBalance() external view onlyOwner returns (uint256) {
        return address(this).balance;
    }
    

}