// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public client;
    address public freelancer;
    uint public amount;
    bool public clientApproved;
    bool public freelancerApproved;

    constructor(address _freelancer) payable {
        client = msg.sender;
        freelancer = _freelancer;
        amount = msg.value;
    }

    function approve() public {
        require(msg.sender == client || msg.sender == freelancer, "Unauthorized");
        if (msg.sender == client) clientApproved = true;
        if (msg.sender == freelancer) freelancerApproved = true;
    }

    function releaseFunds() public {
        require(clientApproved && freelancerApproved, "Both must approve");
        payable(freelancer).transfer(amount);
    }
}
