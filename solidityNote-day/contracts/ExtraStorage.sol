// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./SimplrStorage.sol";

//  is 在solidit中表示继承
contract ExtraStorage is SimplrStorage {
    // 覆盖函数
    function store(uint256 _unmbers) public override {
        numbers = _unmbers + 5;
    }
}
