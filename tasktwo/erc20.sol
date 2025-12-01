// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 任务：参考 openzeppelin-contracts/contracts/token/ERC20/IERC20.sol实现一个简单的 ERC20 代币合约。要求：
合约包含以下标准 ERC20 功能：,
balanceOf：查询账户余额。,
transfer：转账。,
approve 和 transferFrom：授权和代扣转账。,
使用 event 记录转账和授权操作。,
提供 mint 函数，允许合约所有者增发代币。,
提示：
使用 mapping 存储账户余额和授权信息。,
使用 event 定义 Transfer 和 Approval 事件。,
部署到sepolia 测试网，导入到自己的钱包 */

contract Erc20{

    //余额
    mapping(address account => uint256) public _balances;

    //授权
    mapping(address account => mapping(address spender => uint256)) public _allowances;

    uint256 public  totalSupply;

    string public name;

    string public symbol;

    address private _owner ;

    constructor(string memory name_, string memory symbol_,uint initamount){
    name = name_;
    symbol = symbol_;
    _owner = msg.sender;
    totalSupply=initamount;
    _balances[_owner]=totalSupply;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);


    function balanceOf(address account) external view returns(uint256){
       return  _balances[account];
    }

    function transfer(address to, uint256 value) external  returns (bool){
        require(_balances[msg.sender] >= value,"Insufficient balance");
        _balances[msg.sender] -=value;
        _balances[to] +=value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    
    function approve(address spender, uint256 amount) external returns (bool){
        require(_balances[msg.sender] >= amount,"Allowance exceeds balance");
        _allowances[msg.sender][spender]=amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender,address recipient,uint amount) public  returns (bool) {
         require(_balances[sender] >= amount, "Insufficient balance");
         require(_allowances[sender][msg.sender] >= amount, "Allowance exceeded");
        _allowances[sender][msg.sender] = amount;
        _balances[sender] -= amount; 
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) public {
        require(msg.sender==_owner,"not owner");
        _balances[_owner]+=amount;
        emit Transfer(address(0),msg.sender, amount);
    }
}