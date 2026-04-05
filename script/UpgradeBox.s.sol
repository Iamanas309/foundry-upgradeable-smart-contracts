//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "ERC1967Proxy",
            block.chainid
        );

        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();
        vm.stopBroadcast();
        address proxy = upgradeProxy(mostRecentDeployed, address(newBox));
        return proxy;
    }

    function upgradeProxy(
        address proxyAddress,
        address newImplementation
    ) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(proxyAddress);
        proxy.upgradeToAndCall(newImplementation, "");
        vm.stopBroadcast();
        return proxyAddress;
    }
}
