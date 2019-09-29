pragma solidity ^0.5.8;

contract Election{
// Constructor - something we need to get run when we initialize our constract upon migration.
// Storing and reading candidate.
string public candidate;
//State Variable which belong to the entire contract.
//On declaring public solidity assigns a getter function to read value, automatically with same name as variable.

//truffle migrate to compile constracts and migrate it to deploy it on block chain which cost some amount of ether.
//Writing anything or Deploying a contract to blockchain requires gas(ether) except for reading.
constructor () public {

      candidate = "Candidate1";
}
}