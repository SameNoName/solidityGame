
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "baseStation.sol";

contract warUnit is gameObject {
    baseStation baseStationAddress;
    int attackPower;

    function attack(IGameObject target) public
    {
        tvm.accept();
        target.takeDamage(attackPower);
    }

    function getDefencePower() virtual internal override
    {
        tvm.accept();
        defencePower = 0;
    }

    function getAttackPower() virtual internal
    {
        tvm.accept();
        attackPower = 1;
    }

    function dead() internal override
    {
        tvm.accept();
        if (health <= 0)
        {
            baseStationAddress.deleteUnit(this);
            selfDestruction(attackerAddress);
        }
    }

    constructor(baseStation bs) public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        baseStationAddress = bs;
        bs.addWarUnit(this);
        getDefencePower();
        getAttackPower();
        tvm.accept();
    }
}
