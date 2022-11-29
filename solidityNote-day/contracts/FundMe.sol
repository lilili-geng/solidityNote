//  get funds from users
//  withdraw funds
//  set a minmum funding value in usd
// 从用户处获取资金
// 提取资金
// 以美元为单位设定最低资金价值


// SPDX-License-Identifier:MIT
pragma  solidity  ^0.8.8;

import "./PriceConverter.sol";


// constant immutable
 
//  859757
contract FundMe {
    using PriceConverter for  uint256;
    
    uint256 public constant  NINIMUM_USD =  50 * 1e18;
    
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    
    address public immutable i_owner;
    
    constructor(){
        i_owner = msg.sender;
    }
 

    // zijin  payable = zhi  fu guan jian zi 
    function fund() public payable{
        // she zhi zui xiao zi jin
        require(msg.value.getConversionRate() >= NINIMUM_USD,"Not enough quantity sent");  // 1e18 = 1 * 10 * 18 = 1000000000000000000
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    } 
     
    
    // chehui
    function withdraw() public onlyOwner  {
        // require(msg.sender == i_owner , "Sender is not owner! ");
        
        //  starting index, ending index , step amount 
        for(uint256 funderIndex = 0;funderIndex<=funders.length;funderIndex++){
            // code 
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; 
        }
        
        funders = new address[](0);
        
        
        // transfer
        // payable(msg.sender).transfer(address(this).balance);
        
        // send
    //   bool sendSuccess = payable(msg.send 
       
        // call 
       (bool CallSuccess,) = payable(msg.sender).call{value:address(this).balance}(""); 
       require(CallSuccess,"Call failed");

    }
    
    
    // 关键字 yunxingwan require success zai yunx shen xia de dai ma
    modifier onlyOwner{
         require(msg.sender == i_owner , "Sender is not owner! ");
         _;
    }
     
}