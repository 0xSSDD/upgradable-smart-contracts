pragma solidity 0.8.14;

import "./Storage.sol";

contract Proxy is Storage {

  address currentAddress;

  constructor(address _currentAddress) {
    currentAddress = _currentAddress;
  }
  function upgrade(address _newaddress) public {
    currentAddress = _newaddress;
  }

  // Fallback function
  fallback () payable external {
    // redirect to current address
    address implementation = currentAddress;
    require(currentAddress != address(0));
    bytes memory data = msg.data;

    assembly {
      let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
      let size := returndatasize()
      let ptr := mload(0x40)
      returndatacopy(ptr, 0, size)
      switch result
      case 0 {revert(ptr, size)}
      default {return(ptr, size)}
    }
  }
}