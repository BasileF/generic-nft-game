// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GenericGame is ERC721 {

  struct CharacterAttributes {
    string name;
    string imageURI;
    uint characterIndex;
    uint hp;
    uint maxHp;
    uint attackDamage;
  }

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  CharacterAttributes[] defaultCharacters;

  // We create a mapping from the nft's tokenId => that NFTs attributes.
  mapping(uint256 => CharacterAttributes) public nftHolderAttributes;

  // A mapping from an address => the NFTs tokenId. Gives me an ez way
  // to store the owner of the NFT and reference it later.
  mapping(address => uint256) public nftHolders;

  constructor(string[] memory characterNames, string[] memory characterImageURIs, uint[] memory characterHp, uint[] memory characterAttackDmg) ERC721("Gods", "GODS"){
    for (uint i = 0; i < characterNames.length; i++) {
      defaultCharacters.push(CharacterAttributes(characterNames[i], characterImageURIs[i], i, characterHp[i], characterHp[i], characterAttackDmg[i]));

      CharacterAttributes memory c = defaultCharacters[i];
      console.log("Done initialiing %s w/ HP %s, img %s", c.name, c.hp, c.imageURI);
    }
    _tokenIds.increment();
  }

  

}