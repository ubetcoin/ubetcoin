pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract UBetCoin is StandardToken {
  string public name = "UbetCoin";
  string public symbol = "UBET";
  uint public decimals = 3;
  uint public INITIAL_SUPPLY = 2400000000 * (10 ** decimals);

  function UBetCoin() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}