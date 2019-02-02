pragma solidity >=0.4.22 <0.6.0;

contract HolCoin{
  address owner;
  string name;
  string symbol;
  uint256 totalHolCoins;

  constructor(string memory _name, string memory _symbol, uint256 _totalHolCoins) public {
    owner = msg.sender;
    name = _name;
    symbol = _symbol;
    totalHolCoins = _totalHolCoins;
   }

  mapping (address => uint256) public balance;

  function totalSupply() view public returns (uint256){
      return totalHolCoins;
  }

  function balanceOf(address _owner) view public returns (uint256 ){
      return balance[_owner];
  }

  function transfer(address _to, uint256 _value) public returns (bool){
      if (balance[msg.sender] > _value) {
          address _from = msg.sender;
          owner = _to;
          emit Transfer(_from, _to, _value);
          balance[_from] = balance[_from] - _value;
          balance[_to] = balance[_to] + _value;
          return true;
      }
      return false;
  }

  event Transfer(address indexed _from, address indexed _to, uint256 _value);

}
