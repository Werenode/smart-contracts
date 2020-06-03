# smart-contracts

## Address book

Assiciation table between evse id and its contract id. 

Any address whitelisted by the contract admin, may add and update its association.

## EVSE

The EVSE contract provides:
 * EVSE manager URL
 * Pricing info
 * Charge info
 
 ## Token
 
 ERC20-like token. 
 One difference is that the transfer sets the the approved value to 0.
 
 Contracts are developped with the Archetype[http://archetype-lang.org/] language for the Tezos[https://tezos.com/] blockchain.
