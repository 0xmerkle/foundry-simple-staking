// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StakingContract.sol";
import "../src/MockERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakingContractTest is Test {
    MockERC20 stakingToken;
    address alice = address(0x13374);
    StakingContract stakingContract;
    uint256 totalStakeTokenSupply = 1000;

    function setUp() public {
        vm.label(alice, "alice");
        vm.prank(alice);

        stakingToken = new MockERC20(totalStakeTokenSupply);
        vm.prank(alice);
        stakingContract = new StakingContract(address(stakingToken));
    }

    function testStake() public {
        uint256 amount = 122;
        vm.deal(alice, 10_000 ether);
        vm.prank(alice, alice);
        stakingToken.approve(address(stakingContract), amount);
        vm.prank(alice, alice);
        stakingContract.sendToContract(amount);
        assertEq(stakingToken.balanceOf(((address(stakingContract)))), amount);
        assertEq(
            stakingToken.balanceOf((alice)),
            totalStakeTokenSupply - amount
        );
    }
}
