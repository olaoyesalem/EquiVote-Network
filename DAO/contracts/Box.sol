//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";


/** @title   Box
    @author olaoyesalem
    @notice  This Box contract is the target contract that we vote on.
*/


contract Box is Ownable{

constructor(address _address ) Ownable( _address){

}

uint256 private value;

event ValueChanged (uint256 newValue);


function storeValue(uint256 newValue) public onlyOwner{
    value = newValue;

    emit ValueChanged(newValue);

}

function retrieveValue () public view returns(uint256) {
    return value;
}

}