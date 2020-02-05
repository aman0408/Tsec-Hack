pragma solidity >=0.4.22 <0.7.0;
contract PatientContract {
    // mapping (address => bool) patientKeDoctor;
    mapping(address => Patient) internal patients;
    struct Patient {
        string name;
        address id;
        uint256 age;
        string home_address;
        string phone_number;
        // address[] doctors;
        mapping(address => bool) doctors;
        address[] prescriptions;
    }
    modifier isPatientKaDoctor(address doctorId, address patientId) {
        Patient storage p = patients[patientId];
        require(p.doctors[doctorId]);
        _;
    }
    modifier isPatient(address patientId) {
        // require(patients[patientId]);
        _;
    }
    function addRecord(address _patient, address _doctor, string memory record)
        public
        view
        isPatientKaDoctor(_doctor, _patient)
    // returns (address)
    {

        // return ;
    }
    function getAllRecords() public view {}
    function uploadPastRecord(string memory fileRef) public view {}
    function signUp(
        string memory _name,
        uint256 _age,
        string memory _home_address,
        string memory _phone_number
    ) public {
        // require(_name!="");
        // require(_age!=0);
        // require(_home_address!="");
        // require(_phone_number!="");
        patients[msg.sender] = Patient({
            name: _name,
            age: _age,
            id: msg.sender,
            home_address: _home_address,
            phone_number: _phone_number,
            prescriptions: new address[](0)
        });
    }
    function getPatientInfo()
        public
        view
        isPatient(msg.sender)
        returns (string memory, uint256, string memory, string memory)
    {
        Patient memory p = patients[msg.sender];
        return (p.name, p.age, p.home_address, p.phone_number);
    }

}
