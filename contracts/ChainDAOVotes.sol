// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract ChainDAOVotes is ERC20Votes {
    uint256 public maxSupply = 1000 * 10 ** 18;

    constructor()
        ERC20("chainDAO", "cDAO")
        ERC20Permit("chainDAO")
    {
        _mint(msg.sender, maxSupply);
    }

}

