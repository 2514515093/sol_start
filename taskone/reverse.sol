// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/*反转字符串 (Reverse String)
题目描述：反转一个字符串。输入 "abcde"，输出 "edcba" */

contract Reverse{


    function reverse(string memory content) public pure returns (string memory){
        bytes memory btcn = bytes(content);
        bytes memory result = new bytes(btcn.length);
        for (uint i = 0; i< btcn.length; i++) {
            result[btcn.length-1-i]=btcn[i];
        }
        return string(result);
    }
}