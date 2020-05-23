pragma solidity >=0.4.21 <0.7.0;



contract AllTransactions {
  
 

struct User {
	uint id;
	string name;
	string email;
	uint phone;
	string additionalDetails;
}

event userCreated (
	uint userCount,
	string _name,
	string _email,
	uint _phone,
	string _additionalDetails);




// User public user;

mapping (bytes32 => User) public userList;

mapping (bytes32 => bytes32) public keyHashtoUserHash;

  

  constructor() public {

  }

 uint public universalCounter=0;
  uint public userCount=0;
  bool public latLOG= false;
  bytes32 public lastLog;
  string public asSt='';



function asS (string memory _data) public {
	
	asSt = _data;

}


function setLastLog (string memory _pvtKey, string memory _address)public pure 
 returns(bytes32) {
		return keccak256(abi.encodePacked(_address,_pvtKey));
}


function keyHashtoUserHashMapping (string memory _address, string memory _pvtKey,string memory _name, string memory _email, 
  	uint _phone, string memory _additionalDetails) public {
	
	// asSt = _LH;
	lastLog = keccak256(abi.encodePacked(_address,_pvtKey));
	keyHashtoUserHash[keccak256(abi.encodePacked(_address,_pvtKey))]= 
	keccak256(abi.encodePacked(_name, _email,_phone, _additionalDetails));
}



  function createUser (string memory _name, string memory _email, 
  	uint _phone, string memory _additionalDetails) 

  public {
		userCount++;
		userList[keccak256(abi.encodePacked(_name, _email,_phone, _additionalDetails))] = 
		User(userCount,_name,_email,_phone, _additionalDetails);
		emit userCreated (userCount,_name,_email,_phone,_additionalDetails);

 }


  

}
