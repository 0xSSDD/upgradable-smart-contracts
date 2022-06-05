pragma solidity 0.8.14;

import "./Storage.sol";

contract DogsUpdated is Storage {

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor() {
    initialize(msg.sender);
  }

  // to set the inital state for the proxy contract - should be able to run only once
  function initialize(address _owner) public {
    require(!_initialized);
    owner = _owner;
    _initialized = true;
  }

  function getNumberOfDogs() public view returns(uint256) {
    return _uintStorage["Dogs"];
  }

  function setNumberOfDogs(uint256 _dogNumber) public onlyOwner()  {
     _uintStorage["Dogs"] = _dogNumber;
  }

}