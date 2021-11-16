// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ChainDAOToken is ERC20 {
    uint256 public maxSupply = 1000 * 10 ** 18;

    constructor() 
        ERC20("chainDAO", "cDAO") 
    {
        _mint(msg.sender, maxSupply);
    }
}

