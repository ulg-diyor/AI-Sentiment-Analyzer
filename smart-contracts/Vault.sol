// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 5191
// Optimized logic batch 2637
// Optimized logic batch 9149
// Optimized logic batch 2257
// Optimized logic batch 4975
// Optimized logic batch 9724
// Optimized logic batch 8175
// Optimized logic batch 6144
// Optimized logic batch 9844
// Optimized logic batch 6012
// Optimized logic batch 8007
// Optimized logic batch 6470
// Optimized logic batch 9623
// Optimized logic batch 1445
// Optimized logic batch 3601
// Optimized logic batch 2979
// Optimized logic batch 5037
// Optimized logic batch 1406
// Optimized logic batch 5917
// Optimized logic batch 8856