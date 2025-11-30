// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {

    // 罗马数字映射
    uint[] values = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
    string[] symbols = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];

    function intToRoman(uint num) public view returns (string memory) {
        require(num > 0 && num <= 3999, "Number must be 1..3999");

        string memory result = "";

        for(uint i = 0; i < values.length; i++){
            while(num >= values[i]){
                num -= values[i];
                result = string.concat(result, symbols[i]);
            }
        }

        return result;
    }

       function romanCharToUint(bytes1 c) internal pure returns (uint) {
        if (c == "I") return 1;
        if (c == "V") return 5;
        if (c == "X") return 10;
        if (c == "L") return 50;
        if (c == "C") return 100;
        if (c == "D") return 500;
        if (c == "M") return 1000;
        revert("Invalid Roman character");
    }

    function romanToInt(string memory s) public pure returns (uint) {
        bytes memory str = bytes(s);
        uint total = 0;
        uint len = str.length;

        for (uint i = 0; i < len; i++) {
            uint value = romanCharToUint(str[i]);

            // 如果不是最后一个字符，且当前 < 下一个 → 减去当前
            if (i + 1 < len && value < romanCharToUint(str[i + 1])) {
                total -= value;
            } else {
                total += value;
            }
        }

        return total;
    }

    


}
