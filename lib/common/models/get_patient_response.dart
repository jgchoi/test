class GetPatientResponse {
  List<Data>? data;
  Null? totalNumberOfElements;
  Paging? paging;
  Null? outliers;

  GetPatientResponse(
      {this.data, this.totalNumberOfElements, this.paging, this.outliers});

  GetPatientResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalNumberOfElements = json['totalNumberOfElements'];
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    outliers = json['outliers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalNumberOfElements'] = this.totalNumberOfElements;
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    data['outliers'] = this.outliers;
    return data;
  }
}

class Data {
  int? orgId;
  Null? orgUuid;
  int? facId;
  int? patientId;
  String? patientExternalId;
  String? patientStatus;
  int? bedId;
  String? bedDesc;
  String? roomDesc;
  int? roomId;
  String? floorDesc;
  int? floorId;
  String? unitDesc;
  int? unitId;
  String? lastName;
  String? firstName;
  String? middleName;
  String? suffix;
  String? prefix;
  String? preferredName;
  String? gender;
  Null? ompId;
  String? birthDate;
  String? admissionDate;
  Null? photoUrl;
  bool? hasPhoto;
  Null? ssn;
  Null? socialBeneficiaryIdentifier;
  Null? medicareBeneficiaryIdentifier;
  int? mpiId;
  bool? deceased;
  Null? deathDateTime;
  String? fullName;

  Data(
      {this.orgId,
      this.orgUuid,
      this.facId,
      this.patientId,
      this.patientExternalId,
      this.patientStatus,
      this.bedId,
      this.bedDesc,
      this.roomDesc,
      this.roomId,
      this.floorDesc,
      this.floorId,
      this.unitDesc,
      this.unitId,
      this.lastName,
      this.firstName,
      this.middleName,
      this.suffix,
      this.prefix,
      this.preferredName,
      this.gender,
      this.ompId,
      this.birthDate,
      this.admissionDate,
      this.photoUrl,
      this.hasPhoto,
      this.ssn,
      this.socialBeneficiaryIdentifier,
      this.medicareBeneficiaryIdentifier,
      this.mpiId,
      this.deceased,
      this.deathDateTime,
      this.fullName});

  Data.fromJson(Map<String, dynamic> json) {
    orgId = json['orgId'];
    orgUuid = json['orgUuid'];
    facId = json['facId'];
    patientId = json['patientId'];
    patientExternalId = json['patientExternalId'];
    patientStatus = json['patientStatus'];
    bedId = json['bedId'];
    bedDesc = json['bedDesc'];
    roomDesc = json['roomDesc'];
    roomId = json['roomId'];
    floorDesc = json['floorDesc'];
    floorId = json['floorId'];
    unitDesc = json['unitDesc'];
    unitId = json['unitId'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    suffix = json['suffix'];
    prefix = json['prefix'];
    preferredName = json['preferredName'];
    gender = json['gender'];
    ompId = json['ompId'];
    birthDate = json['birthDate'];
    admissionDate = json['admissionDate'];
    photoUrl = json['photoUrl'];
    hasPhoto = json['hasPhoto'];
    ssn = json['ssn'];
    socialBeneficiaryIdentifier = json['socialBeneficiaryIdentifier'];
    medicareBeneficiaryIdentifier = json['medicareBeneficiaryIdentifier'];
    mpiId = json['mpiId'];
    deceased = json['deceased'];
    deathDateTime = json['deathDateTime'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orgId'] = this.orgId;
    data['orgUuid'] = this.orgUuid;
    data['facId'] = this.facId;
    data['patientId'] = this.patientId;
    data['patientExternalId'] = this.patientExternalId;
    data['patientStatus'] = this.patientStatus;
    data['bedId'] = this.bedId;
    data['bedDesc'] = this.bedDesc;
    data['roomDesc'] = this.roomDesc;
    data['roomId'] = this.roomId;
    data['floorDesc'] = this.floorDesc;
    data['floorId'] = this.floorId;
    data['unitDesc'] = this.unitDesc;
    data['unitId'] = this.unitId;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['suffix'] = this.suffix;
    data['prefix'] = this.prefix;
    data['preferredName'] = this.preferredName;
    data['gender'] = this.gender;
    data['ompId'] = this.ompId;
    data['birthDate'] = this.birthDate;
    data['admissionDate'] = this.admissionDate;
    data['photoUrl'] = this.photoUrl;
    data['hasPhoto'] = this.hasPhoto;
    data['ssn'] = this.ssn;
    data['socialBeneficiaryIdentifier'] = this.socialBeneficiaryIdentifier;
    data['medicareBeneficiaryIdentifier'] = this.medicareBeneficiaryIdentifier;
    data['mpiId'] = this.mpiId;
    data['deceased'] = this.deceased;
    data['deathDateTime'] = this.deathDateTime;
    data['fullName'] = this.fullName;
    return data;
  }
}

class Paging {
  bool? hasMore;
  int? page;
  int? pageSize;

  Paging({this.hasMore, this.page, this.pageSize});

  Paging.fromJson(Map<String, dynamic> json) {
    hasMore = json['hasMore'];
    page = json['page'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasMore'] = this.hasMore;
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    return data;
  }
}
