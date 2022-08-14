//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract VendingMachine {
    address public owner;
    mapping (address => uint) public dairyMilkBalances;

    constructor(){
        owner = msg.sender;
        dairyMilkBalances[address(this)] = 200;
    }

    function getdairyMilkBalances() public view returns (uint){
        return dairyMilkBalances[address(this)];
    }

    function restock(uint amount) public {
        require(msg.sender == owner, "Only owner can restock");
        dairyMilkBalances[address(this)] += amount;
    } 

    function purchase(uint amount) public payable{
        require(msg.value >= amount * 2 ether, "You have to pay 2 ether per Dairy Milk");
        require(dairyMilkBalances[address(this)]>= amount, "Sorry not enough dairymilk in stock");
        dairyMilkBalances[address(this)] -= amount;
        dairyMilkBalances[msg.sender] += amount;
    }
}
