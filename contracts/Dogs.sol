pragma solidity 0.8.14;

import "./Storage.sol";

contract Dogs is Storage {

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function getNumberOfDogs() public view returns(uint256) {
    return _uintStorage["Dogs"];
  }

  function setNumberOfDogs(uint256 _dogNumber) public  {
     _uintStorage["Dogs"] = _dogNumber;
  }

}