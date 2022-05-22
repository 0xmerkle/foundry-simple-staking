pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(uint256 amount) ERC20("Mock ERC20", "MCK") {
        _mint(msg.sender, amount);
    }
}
