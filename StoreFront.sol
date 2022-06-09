// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./BookStore.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StoreFront {
    BookStore private _bookStore;

    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    //TODO: Restrict access to only owner
    function setBookStore(address _bookStoreAddress) public {
        require(msg.sender == _owner, "StoreFront: Only contract owner can set bookStore");
        _bookStore = BookStore(_bookStoreAddress);
    }

    function purchaseFromAuthor(uint256 _bookVersionId) public {
        ERC20 purchaseToken = ERC20(_bookStore.bookVersionCurrency(_bookVersionId));
        
        address author = _bookStore.bookVersionAuthor(_bookVersionId);
        
        uint256 price = _bookStore.bookVersionPrice(_bookVersionId);
        purchaseToken.transferFrom(msg.sender, author, price);

        _bookStore.transferFromAuthor(msg.sender, _bookVersionId);


    }

}