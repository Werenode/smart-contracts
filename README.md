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
 
 [FA1.2](https://assets.tqtezos.com/docs/token-contracts/fa12/1-fa12-intro/)-like token.
 
 There are two differences compared to FA1.2:
 * `transfer` sets allowance to 0
 * `approve` fails if not enough tokens
 
 ## Escrow
 
 Multi-tenant escrow process with allowance mechanism.
 
 ## Switch
 
 Switches on and off an EVSE. Payments are done tez or WRC token.
 Demo available at:
 * [wallet](http://34.253.184.235/ui)
 * [connected object](http://3.250.1.82/ui/) (reload if bulb not loading properly)
 
 ## Consensus
 
 Anchors a consensus for a numerical value.
 
 ##
 
 > Contracts are written in [Archetype](http://archetype-lang.org/) for the [Tezos](https://tezos.com/) blockchain.
