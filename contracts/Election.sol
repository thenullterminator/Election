pragma solidity ^0.5.8;

contract Election{
// Constructor - something we need to get run when we initialize our constract upon migration.
// Storing and reading candidate.
//string public candidate;
//State Variable which belong to the entire contract.
//On declaring public solidity assigns a getter function to read value, automatically with same name as variable.

//truffle migrate to compile constracts and migrate it to deploy it on block chain which cost some amount of ether.
//Writing anything or Deploying a contract to blockchain requires gas(ether) except for reading.
// constructor () public {

//       candidate = "Candidate1";
// }

//.....Now for Election Purpose.

      //Model a candidate(name,id,votecount)
      struct Candidate {
            uint id;
            string name;
            uint voteCount;
      }

      //Vote Event
      event votedEvent (
            uint indexed_candidateId
      );

      //Store accounts that have voted.
      mapping(address => bool) public voters;

      //Store Candidiates
      //Fetch Candidates
      mapping(uint => Candidate) public candidates;
      //Since are mapping is public we will get a getter method for each one which can be called on passing id.
      //When we are adding a candidate to a this mapping we are changing state of our blockchain and writing to blockchain.
      // We cannot iterate over this mapping or find its length since for any id it assigns a default blank candidate to it.Hence we need to explicitly store count.

      //...................

      //Store Candidates Count
      uint public candidatesCount;

      function addCandidate(string memory _name) private { //local Variable generally appended by underscore.
            candidatesCount ++;
            candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
      }
      // We declared above function private so that only within the contract we can all it.

      //Now we will declare the constructor which is called each time our contract is migrated and deployed.
      constructor() public{
            addCandidate("Candidate 1");
            addCandidate("Candidate 2");
      }

      //To increase votecount of given candidate.
      function vote (uint _candidateId) public {

            //require that they havent voted before
            require(!voters[msg.sender]," Voter already voted");

            //require a valid candidate id.
            require(_candidateId > 0 && _candidateId <= candidatesCount," Invalid Candidate Id");


            //Record that voter has voted.
            //Solidity passes some metadata along with arguments passed.
            //Also provided a way we can access address from which function is called.
            //Using msg.sender
            voters[msg.sender] = true;
      
            //Update Candidate vote count.
            candidates[_candidateId].voteCount++;

            //trigger voted event
            emit votedEvent(_candidateId);
      }
    
}