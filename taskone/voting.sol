// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 创建一个名为Voting的合约，包含以下功能：
一个mapping来存储候选人的得票数
一个vote函数，允许用户投票给某个候选人
一个getVotes函数，返回某个候选人的得票数
一个resetVotes函数，重置所有候选人的得票数 */

contract Voting {

mapping (string user => uint num) public usernums;

string[] public candidates;

    function vote(string memory user) public returns(string memory){
    uint votes = usernums[user];
    if(votes==0){
        candidates.push(user);
    }
    usernums[user] = votes+1;
    return "success";
    }


    function getVotes(string memory user) public view returns (uint) {
        return usernums[user];
    }
 
    function resetVotes() public {
         for (uint i = 0; i < candidates.length; i++) {
            usernums[candidates[i]] = 0;
        }
    }

}