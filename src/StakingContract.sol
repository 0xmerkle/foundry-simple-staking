// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakingContract {
    IERC20 stakingToken;
    mapping(address => uint256) public balances;

    constructor(address tokenAddress_) {
        stakingToken = IERC20(tokenAddress_);
    }

    function sendToContract(uint256 amount) public {
        require(amount > 0, "You can't send 0 tokens");
        require(
            stakingToken.balanceOf(msg.sender) > amount,
            "You dont have enough tokens"
        );
        balances[msg.sender] += amount;
        stakingToken.transferFrom(msg.sender, address(this), amount);
    }
}
