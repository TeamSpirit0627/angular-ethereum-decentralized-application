pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract Superheroes {
  Superhero[] public superheroes;
  mapping (uint => uint) superheroesVotes;
  mapping (address => uint[]) userVotes;
  uint superheroCount;

  struct Superhero {
    uint id;
    string name;
    string avatar;
    string category;
    string description;
  }

  function vote(uint superHeroID) public {
    require(msg.sender != address(0), "You must be a real user");
    superheroesVotes[superHeroID]++;
    userVotes[msg.sender].push(superHeroID);
  }

  function addSuperhero(string memory name, string memory avatar, string memory category, string memory description) public returns (uint heroID, string memory heroName, string memory heroAvatar, string memory heroCategory, string memory heroDescription) {
    superheroCount++;
    Superhero memory newHero = Superhero(superheroCount, name, avatar, category, description);
    superheroes.push(newHero);
    return (newHero.id, newHero.name, newHero.avatar, newHero.category, newHero.description);
  }

  function string_tobytes( string memory s) pure internal returns (bytes memory result){
    bytes memory b3 = bytes(s);
    return b3;
  }

  function getSuperHeroes() public view returns (Superhero[] memory result ) {
    return superheroes;
  }

  function getHero(uint id) public view returns(Superhero memory hero) {
    for(uint i = 0; i<superheroCount;i++) {
      if(superheroes[i].id==id) {
        return superheroes[i];
      }
    }
  }

}
