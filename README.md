# smart-contracts

## Address book

Association table between evse id and its contract id. 
Any address whitelisted by the contract's admin, may add and update its association.

## EVSE

The EVSE contract provides:
 * EVSE manager URL
 * Pricing info
 * Charge info
 
 ## Token
 
 ERC20-like token. 
 One difference is that the transfer method sets the approved value to 0.
 
 > Contracts are written in [Archetype](http://archetype-lang.org/) for the [Tezos](https://tezos.com/) blockchain.
