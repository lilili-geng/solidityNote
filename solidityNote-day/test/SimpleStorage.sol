// SPDX-License-Identifier:MIT
pragma solidity  ^0.8.7;


contract SimplrStorage{
     uint256 numbers;
     
     mapping(string => uint256 ) public nameTofavoriterNumber; 
     
     struct People {
         uint numbers;
         string name;
     }
     
     People[] public people;


     function store (uint256 _unmbers) public {
         numbers = _unmbers;
     }
      
     function retrives() public view returns(uint256){
         return numbers;
     }
     
     
     function addPerson(string memory _name,uint256 _unmbers) public {
        //  people.push(People(_unmbers,_name));
        // People memory newPeople =  People({numbers:_unmbers,name:_name});
        People memory newPeople =  People(_unmbers,_name);
        people.push(newPeople);
        
        nameTofavoriterNumber[_name] = _unmbers;
     }
     
}