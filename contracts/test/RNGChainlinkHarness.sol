// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.6;

import "../RNGChainlink.sol";

contract RNGChainlinkHarness is RNGChainlink {

  constructor(address _vrfCoordinator, address _link)
    public
    RNGChainlink(_vrfCoordinator, _link)
  {
  }

  function setRequestCount(uint32 _requestCount) external {
    requestCount = _requestCount;
  }

  function setRandomNumber(uint32 requestId, uint256 rand) external {
    randomNumbers[requestId] = rand;
  }

  function _getSeed() internal override view returns (uint256 seed) {
    return uint256(blockhash(block.number - 2)); // -2 since unit-test is 1 mock behind
  }
}