// SPDX-License-Identifier: MIT
pragma solidity ^0.5.1;

contract CrossBorderPayment {
    address public owner;

    event Deposit(address indexed user, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    mapping(address => uint256) public balances;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function transferTo(address payable recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(amount > 0, "Amount must be greater than 0");

        balances[msg.sender] -= amount;
        recipient.transfer(amount);

        emit Transfer(msg.sender, recipient, amount);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function() external payable {
        deposit();
    }
}