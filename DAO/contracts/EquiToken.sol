//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract EquiToken is ERC20Votes{

uint256  public s_maxSupply = 1e24;   // 1 million EquiTokens
constructor(string name , string symbol) 
ERC20("EquiToken","EQT")
ERC20Permit("EquiToken")

{

}

  
    // the bugs started from here down
  // The following functions are overrides required by solidity

  function _afterTokenTransfer(address _from , address  _to, uint256 amount)internal override(ERC20Votes){

    super._afterTokenTransfer(_from,_to,amount);
  }

  /**  @notice the amount parameters sends in 1e18. That is when amount is passed in as 1, then we transfer 1 *1e18;  
   * which implies that we minted 1 out of 1 million equi token to the designated address.
  */
 
   function _mint(address _to , uint256 amount) internal override(ERC20Votes){
    super._mint(_to,amount*1e18); // might havr to check this
  }


    function _burn(address account,uint256 amount) internal override(ERC20Votes){
        super._burn(account, amount *1e18);
    }

}