
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "warUnit.sol";

contract archer is warUnit {
    function getDefencePower() internal override
    {
        tvm.accept();
        defencePower = 1;
    }

    function getAttackPower() internal override
    {
        tvm.accept();
        attackPower = 5;
    }
    
    constructor(baseStation bs) warUnit(bs) public {}
}
