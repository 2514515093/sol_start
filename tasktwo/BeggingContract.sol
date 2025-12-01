// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
一个 mapping 来记录每个捐赠者的捐赠金额。
一个 donate 函数，允许用户向合约发送以太币，并记录捐赠信息。
一个 withdraw 函数，允许合约所有者提取所有资金。
一个 getDonation 函数，允许查询某个地址的捐赠金额。
使用 payable 修饰符和 address.transfer 实现支付和提款。
*/


contract BeggingContract {

    //合约所有者
    address private owner;

    //捐赠者-金额
    mapping(address => uint256) donationAmount;

    //所有捐赠者信息
    address[] private donations;

    //总金额
    uint256 private totalAmount;

    uint256 private immutable startTime;


    uint256 private immutable endTime;



    constructor(){
		owner = msg.sender;
		startTime = block.timestamp;
		endTime = startTime + 365 days;
    }

    event  Donation(address indexed from, uint256 value);

    function donate() external payable returns (string memory){
        require(block.timestamp<=endTime && block.timestamp>=startTime,"Donation period has ended.");
        require(msg.value>0,"Amount must be greater than 0.");
        donationAmount[msg.sender]+=msg.value;
        totalAmount+=msg.value;
        emit Donation(msg.sender, msg.value);
        return "success";
    }

    function withdraw() external {
         uint256 amount = address(this).balance;
        require(totalAmount>0,"current totalAmount is 0");
        require(msg.sender==owner,"Only the contract owner can withdraw.");
        payable(owner).transfer(amount);
        
    }

    function getDonation(address donation) external view  returns (uint256){
       return donationAmount[donation];
    }

    struct DonationInfo {
    address donor;
    uint256 amount;
    }


}