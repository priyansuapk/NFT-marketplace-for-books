// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//Note : not for real use test purpose only

contract PurchaseToken is ERC20 {

    constructor(uint256 _totalSupply) ERC20("Purchase Token", "PRCHS") {
        _mint(msg.sender, _totalSupply);

    }

}