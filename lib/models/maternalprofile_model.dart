class MaternalProfile {
  final String? anc;
  final String? qdae314;
  final String? age;
  final String? anyDrugAllergy;
  final String? bloodTransfusion;
  final String? county;
  final String? diabetes;
  final String? estate;
  final String? familyHistory;
  final String? gravida;
  final String? htn;
  final int? height;
  final int? kMHFLcode;
  final String? maritalStatus;
  final int? nextOfKinContacts;
  final String? nextOfKin;
  final String? otherAllergies;
  final int? pncNo;
  final String? parity;
  final String? physicalAddress;
  final String? relationship;
  final String? subCounty;
  final String? surgicalOperation;
  final String? town;
  final String? ward;
  final int? weight;
  final String? facilityName;
  final String? nameofclient;

  MaternalProfile({
    this.anc,
    this.qdae314,
    this.age,
    this.anyDrugAllergy,
    this.bloodTransfusion,
    this.county,
    this.diabetes,
    this.estate,
    this.familyHistory,
    this.gravida,
    this.htn,
    this.height,
    this.kMHFLcode,
    this.maritalStatus,
    this.nextOfKinContacts,
    this.nextOfKin,
    this.otherAllergies,
    this.pncNo,
    this.parity,
    this.physicalAddress,
    this.relationship,
    this.subCounty,
    this.surgicalOperation,
    this.town,
    this.ward,
    this.weight,
    this.facilityName,
    this.nameofclient,
  });

  factory MaternalProfile.fromMap(Map<String, dynamic> map) {
    return MaternalProfile(
      anc: map['ANC'],
      qdae314: map['qdae314'],
      age: map['Age'],
      anyDrugAllergy: map['AnyDrugAlergy'],
      bloodTransfusion: map['BloodTransfusion'],
      county: map['County'],
      diabetes: map['Diabetes'],
      estate: map['Estate'],
      familyHistory: map['FamiliyHistory'],
      gravida: map['Gravida'],
      htn: map['HTN'],
      height: map['Height'],
      kMHFLcode: map['KMHFLcode'],
      maritalStatus: map['MaritalStatus'],
      nextOfKinContacts: map['NextOfKinContacts'],
      nextOfKin: map['NextofKin'],
      otherAllergies: map['OtherAllergies'],
      pncNo: map['PNCNo'],
      parity: map['Parity'],
      physicalAddress: map['Physicaladdress'],
      relationship: map['Relationship'],
      subCounty: map['SubCounty'],
      surgicalOperation: map['Surgicaloperation'],
      town: map['Town'],
      ward: map['Ward'],
      weight: map['Weight'],
      facilityName: map['facilityName'],
      nameofclient: map['nameofclient'],
    );
  }
}
