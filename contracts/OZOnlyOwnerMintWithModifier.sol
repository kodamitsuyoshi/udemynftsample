// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMintWithModifier is ERC721 {

    /**
    * @dev
    * -このコントラクトをデプロイしたオーナー
    */
    address public owner;

    constructor() ERC721("OnlyOwnerMint","KOWNERMOD"){
        owner = _msgSender();
    }

    modifier onlyOwener {
        require(owner == _msgSender(),"Caller is not the owner");
        _;
    }
    

    /**
    * @dev
    * - このコントラクトをデプロイしたアドレスだけがMINT可能
    * - nftMint関数の実行アドレスにtokenIdを紐付け
    */
    function nftMint(uint256 tokenId) public onlyOwener{
        _mint(_msgSender(),tokenId);
    }
}



