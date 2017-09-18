pragma solidity ^0.4.11;

contract Extractor
{
    address public owner = msg.sender;
    
    
    // Fallback function to prevent accidentally sent transactions in future
    function()
    {
        throw;
    }
    
    // This function allows to extract funds from the contract.
    function extract()
    {
        if (msg.sender != owner) throw;
        msg.sender.transfer(this.balance);
    }
    
    
    // Delegatecall function allows to execute something from this contract.
    // Who knows what else we will need from this contract in future.
    function delegateCall(address _target, uint _gas, bytes _data) payable
    {
        if (msg.sender != owner) throw;
        if(!_target.call.value(_gas)(_data))
        {
            throw;
        }
    }
}
