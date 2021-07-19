pragma solidiy ^0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BonusToken is ERC20 {
    address public admin;
    address public liquidator;

    constructor() public ERC20("Bonus Token", "BTK") {
        admin = msg.sender;
    }

    function setLiquidator(address _liquidator) external {
        require(msg.sender == admin, "only admin");
        liquidator = _liquidator;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == liquidator, "only liquidator");
        _mint(to, amount);
    }
}
