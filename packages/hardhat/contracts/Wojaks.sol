// pragma solidity >=0.8.0 <0.9.0;
// //SPDX-License-Identifier: MIT

// import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
// import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
// // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

// interface IUniswapV2Router01 {
//     function factory() external pure returns (address);
//     function WETH() external pure returns (address);

//     function addLiquidity(
//         address tokenA,
//         address tokenB,
//         uint amountADesired,
//         uint amountBDesired,
//         uint amountAMin,
//         uint amountBMin,
//         address to,
//         uint deadline
//     ) external returns (uint amountA, uint amountB, uint liquidity);
//     function addLiquidityETH(
//         address token,
//         uint amountTokenDesired,
//         uint amountTokenMin,
//         uint amountETHMin,
//         address to,
//         uint deadline
//     ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
//     function removeLiquidity(
//         address tokenA,
//         address tokenB,
//         uint liquidity,
//         uint amountAMin,
//         uint amountBMin,
//         address to,
//         uint deadline
//     ) external returns (uint amountA, uint amountB);
//     function removeLiquidityETH(
//         address token,
//         uint liquidity,
//         uint amountTokenMin,
//         uint amountETHMin,
//         address to,
//         uint deadline
//     ) external returns (uint amountToken, uint amountETH);
//     function removeLiquidityWithPermit(
//         address tokenA,
//         address tokenB,
//         uint liquidity,
//         uint amountAMin,
//         uint amountBMin,
//         address to,
//         uint deadline,
//         bool approveMax, uint8 v, bytes32 r, bytes32 s
//     ) external returns (uint amountA, uint amountB);
//     function removeLiquidityETHWithPermit(
//         address token,
//         uint liquidity,
//         uint amountTokenMin,
//         uint amountETHMin,
//         address to,
//         uint deadline,
//         bool approveMax, uint8 v, bytes32 r, bytes32 s
//     ) external returns (uint amountToken, uint amountETH);
//     function swapExactTokensForTokens(
//         uint amountIn,
//         uint amountOutMin,
//         address[] calldata path,
//         address to,
//         uint deadline
//     ) external returns (uint[] memory amounts);
//     function swapTokensForExactTokens(
//         uint amountOut,
//         uint amountInMax,
//         address[] calldata path,
//         address to,
//         uint deadline
//     ) external returns (uint[] memory amounts);
//     function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
//         external
//         payable
//         returns (uint[] memory amounts);
//     function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
//         external
//         returns (uint[] memory amounts);
//     function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
//         external
//         returns (uint[] memory amounts);
//     function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
//         external
//         payable
//         returns (uint[] memory amounts);

//     function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
//     function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
//     function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
//     function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
//     function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
// }

// interface IUniswapV2Router02 is IUniswapV2Router01 {
//     function removeLiquidityETHSupportingFeeOnTransferTokens(
//         address token,
//         uint liquidity,
//         uint amountTokenMin,
//         uint amountETHMin,
//         address to,
//         uint deadline
//     ) external returns (uint amountETH);
//     function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
//         address token,
//         uint liquidity,
//         uint amountTokenMin,
//         uint amountETHMin,
//         address to,
//         uint deadline,
//         bool approveMax, uint8 v, bytes32 r, bytes32 s
//     ) external returns (uint amountETH);

//     function swapExactTokensForTokensSupportingFeeOnTransferTokens(
//         uint amountIn,
//         uint amountOutMin,
//         address[] calldata path,
//         address to,
//         uint deadline
//     ) external;
//     function swapExactETHForTokensSupportingFeeOnTransferTokens(
//         uint amountOutMin,
//         address[] calldata path,
//         address to,
//         uint deadline
//     ) external payable;
//     function swapExactTokensForETHSupportingFeeOnTransferTokens(
//         uint amountIn,
//         uint amountOutMin,
//         address[] calldata path,
//         address to,
//         uint deadline
//     ) external;
// }

// interface IUniswapV2Factory {
//     event PairCreated(address indexed token0, address indexed token1, address pair, uint);

//     function feeTo() external view returns (address);
//     function feeToSetter() external view returns (address);

//     function getPair(address tokenA, address tokenB) external view returns (address pair);
//     function allPairs(uint) external view returns (address pair);
//     function allPairsLength() external view returns (uint);

//     function createPair(address tokenA, address tokenB) external returns (address pair);

//     function setFeeTo(address) external;
//     function setFeeToSetter(address) external;
// }

// interface IUniswapV2Pair {
//     event Approval(address indexed owner, address indexed spender, uint value);
//     event Transfer(address indexed from, address indexed to, uint value);

//     function name() external pure returns (string memory);
//     function symbol() external pure returns (string memory);
//     function decimals() external pure returns (uint8);
//     function totalSupply() external view returns (uint);
//     function balanceOf(address owner) external view returns (uint);
//     function allowance(address owner, address spender) external view returns (uint);

//     function approve(address spender, uint value) external returns (bool);
//     function transfer(address to, uint value) external returns (bool);
//     function transferFrom(address from, address to, uint value) external returns (bool);

//     function DOMAIN_SEPARATOR() external view returns (bytes32);
//     function PERMIT_TYPEHASH() external pure returns (bytes32);
//     function nonces(address owner) external view returns (uint);

//     function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

//     event Mint(address indexed sender, uint amount0, uint amount1);
//     event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
//     event Swap(
//         address indexed sender,
//         uint amount0In,
//         uint amount1In,
//         uint amount0Out,
//         uint amount1Out,
//         address indexed to
//     );
//     event Sync(uint112 reserve0, uint112 reserve1);

//     function MINIMUM_LIQUIDITY() external pure returns (uint);
//     function factory() external view returns (address);
//     function token0() external view returns (address);
//     function token1() external view returns (address);
//     function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
//     function price0CumulativeLast() external view returns (uint);
//     function price1CumulativeLast() external view returns (uint);
//     function kLast() external view returns (uint);

//     function mint(address to) external returns (uint liquidity);
//     function burn(address to) external returns (uint amount0, uint amount1);
//     function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
//     function skim(address to) external;
//     function sync() external;

//     function initialize(address, address) external;
// }

// contract Wojaks is ERC20, Ownable {

//   IUniswapV2Router02 public uniswapV2Router; // PCS router 0x10ED43C718714eb63d5aA57B78B54704E256024E
//   address public immutable uniswapV2Pair; // needed to detect buy or sell

//   bool private swapping;    

//   address public marketingWallet = payable(0x20559Fc6a575d2A69aaB1e844265e24615C39102);
//   address public dEaD = 0x000000000000000000000000000000000000dEaD; // 10,101,010

//   uint256 public swapTokensAtAmount = 1000000;
//   uint256 public marketingAccumulate;

//   uint256 public tradeFee = 4;
//   uint256 public burnFee = 1;
//   bool public tradeFeePaused = false;

//   mapping (address => bool) private _isExcludedFromFees;

//   event ExcludeFromFees(address indexed account, bool isExcluded);


//   constructor() ERC20("wojaks", "WJKS") {
//     uniswapV2Router = IUniswapV2Router02(0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3); //0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3 testnet
//     address _uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(address(this), uniswapV2Router.WETH());
//     uniswapV2Pair = _uniswapV2Pair;
//     _mint(owner(), 1000000000 * 10 ** 18);
//     approve(address(uniswapV2Router), type(uint256).max);
//   }

//     function addLiquidity(
//         address owner,
//         uint256 tokenAmount
//     ) internal {
//         // add the liquidity
//         uniswapV2Router.addLiquidityETH{value: msg.value}(
//             address(this),
//             tokenAmount,
//             0, // slippage is unavoidable
//             0, // slippage is unavoidable
//             owner,
//             block.timestamp + 360
//         );
//     }

//   function _transfer(address from, address to, uint256 amount) internal override {

//     require(from != address(0), "ERC20: transfer from the zero address");
//     require(to != address(0), "ERC20: transfer to the zero address");

//     if(tradeFeePaused){
//       super._transfer(from, to, amount);
//       return;
//     }

//     uint thisBal = balanceOf(address(this));

//     bool shouldSwap = thisBal >= swapTokensAtAmount;

//     if(shouldSwap && !swapping && from != uniswapV2Pair && from != owner() && to != owner()){
//       swapping = true;

//       swapAndSendToFee(payable(marketingWallet), marketingAccumulate);
//       marketingAccumulate = 0;

//       swapping = false;
//     }

//     bool takeFee = !swapping;

//     if(_isExcludedFromFees[from] || _isExcludedFromFees[to]) {
//       takeFee = false;
//     }


//     if(takeFee){
//       uint inTradeFee;
//       uint inTradeBurn;
//       if(to == uniswapV2Pair && !swapping) {
//         inTradeFee = amount / 100 * tradeFee;
//         inTradeBurn = amount / 100 * burnFee;
//       }
//       if(from == uniswapV2Pair && !swapping) {
//         inTradeFee = amount / 100 * tradeFee;
//         inTradeBurn = amount / 100 * burnFee;
//       }


//       amount = amount - (inTradeFee + inTradeBurn);
      
//       super._transfer(from, address(this), inTradeFee);
//       super._transfer(from, dEaD, inTradeBurn);
//       marketingAccumulate = inTradeFee;
//     }

//     super._transfer(from, to, amount);

//     }

//     function swapTokensForEth(uint256 tokenAmount) private {

//         // generate the uniswap pair path of token -> weth
//         address[] memory path = new address[](2);
//         path[0] = address(this);
//         path[1] = uniswapV2Router.WETH();

//         _approve(address(this), address(uniswapV2Router), tokenAmount);

//         // make the swap
//         uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
//             tokenAmount,
//             0, // accept any amount of ETH
//             path,
//             address(this),
//             block.timestamp
//         );
        
//     }    

//     function swapAndSendToFee(address payable toWalletAddress, uint256 tokens) internal   {
//       uint256 initBnbBalance = address(this).balance;
//       swapTokensForEth(tokens);
//       uint256 newBalance = address(this).balance;
//       uint256 toSend = newBalance - initBnbBalance;
//       toWalletAddress.transfer(toSend);
//     }

//     function excludeFromFees(address account, bool excluded) public onlyOwner {
//         require(_isExcludedFromFees[account] != excluded, " Account is already the value of 'excluded'");
//         _isExcludedFromFees[account] = excluded;

//         emit ExcludeFromFees(account, excluded);
//     }

//     function isExcludedFromFees(address account) public view returns(bool) {
//         return _isExcludedFromFees[account];
//     }



//   function pauseAllFee() external onlyOwner {
//     tradeFeePaused = true;
//   }
    
//   function restoreAllFee() external onlyOwner {
//     tradeFeePaused = false;
//   }

//   function setTradeFee(uint256 _tradeFee) public onlyOwner {
//     tradeFee = _tradeFee;
//   }
    

//   // to support receiving ETH by default
//   receive() external payable {}
//   fallback() external payable {}

//   function getBalance() public view returns (uint) {
//     return address(this).balance;
//   }

//   function withdraw(address payable _to) public payable onlyOwner {
//     (bool sent, bytes memory data) = _to.call{value: msg.value}("");
//     require(sent, "Failed to send Ether");
//   }
// }
