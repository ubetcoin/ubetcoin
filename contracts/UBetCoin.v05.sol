pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract UBetCoin is StandardToken {

  string public name = "UbetCoin";
  string public symbol = "UBET";
  uint public decimals = 0;
  uint public INITIAL_SUPPLY = 2400000000 * (10 ** decimals);  
  uint256 public tokenInEtherPrice = 0.001 ether;
  
  address owner;
  address public etherWallet = 0x7247C6869DE9a10ddd8d6F6Ad83a4641fD64f3BA;
  
  uint256 tokenAllocated;
  

  function UBetCoin() public {
    owner = msg.sender;
    
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
    
  function () public payable {
      buyToken(msg.sender);
  }
  
  function buyToken(address receipient) 
      public 
      payable
      returns (bool)
  {
      
      require(receipient != 0x0);
      require(msg.value >= tokenInEtherPrice);
      
      tokenAllocated = (msg.value / tokenInEtherPrice) * (10 ** decimals);
      
      // require(balances[msg.sender] >= tokenAllocated);
      
      balances[receipient] += tokenAllocated;
      balances[owner] -= tokenAllocated;
      
      etherWallet.transfer(msg.value);

      return true;
  }
  
}