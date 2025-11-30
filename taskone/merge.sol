// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Merge{

    //合并两个有序数组 (Merge Sorted Array)




function merge(uint[] memory numo, uint[] memory numt) public pure returns (uint[] memory) {
    uint[] memory nnum = new uint[](numo.length + numt.length);
    uint oi = 0;
    uint ti = 0;
    uint k = 0;

    while (oi < numo.length && ti < numt.length) {
        if (numo[oi] <= numt[ti]) {
            nnum[k++] = numo[oi++];
        } else {
            nnum[k++] = numt[ti++];
        }
    }

    while (oi < numo.length) {
        nnum[k++] = numo[oi++];
    }

    while (ti < numt.length) {
        nnum[k++] = numt[ti++];
    }

    return nnum;
}


}