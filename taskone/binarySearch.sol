// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BinarySearch {


    function binarySearch(uint[] memory arr, uint target) public pure returns (uint) {
        if (arr.length == 0) {
            return type(uint).max; 
        }

        uint left = 0;
        uint right = arr.length - 1;

        while (left <= right) {
            uint mid = left + (right - left) / 2;

            if (arr[mid] == target) {
                return mid;
            } else if (arr[mid] < target) {
                left = mid + 1;
            } else {
                if (mid == 0) break; 
                right = mid - 1;
            }
        }

        return type(uint).max; 
    }

    function binarySearcht(uint[] memory arr, uint target) public pure returns (uint) {
        if(arr.length==0){
            return type(uint).max;
        }

    uint left;
    uint right = arr.length-1;
    while (left<=right) {
        uint mid = left + (right-left)/2;
        if(arr[mid]==target){
            return mid;
        }
        if(arr[mid]>target){
            if(mid==0) break;
            right = mid - 1;
        } else {
            left = mid +1;
        }
    }
    return type(uint).max;
    }
}
