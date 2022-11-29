// SPDX-License-Identifier:MIT
pragma  solidity  ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter{
      function getPrice() internal view returns(uint256 ){
        // ABI
        // address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        
        AggregatorV3Interface pricFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
         (, int256 price,,,) = pricFeed.latestRoundData();
        //  ETH in terms of USD 
        return uint256(price * 1e10);
        
    }
    
    function getVersion() internal view returns(uint256){
        AggregatorV3Interface pricFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return pricFeed.version();
    }
    
    function getConversionRate(uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice = getPrice(); 
        uint256 ethAmountInusd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInusd;
    }
}