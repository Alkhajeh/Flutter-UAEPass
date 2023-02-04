class UaepassUser {
  String? sub;
  String? fullnameAR;
  String? gender;
  String? mobile;
  String? lastnameEN;
  String? fullnameEN;
  String? uuid;
  String? lastnameAR;
  String? idn;
  String? nationalityEN;
  String? firstnameEN;
  String? userType;
  String? nationalityAR;
  String? firstnameAR;
  String? email;

  UaepassUser({
    this.sub,
    this.fullnameAR,
    this.gender,
    this.mobile,
    this.lastnameEN,
    this.fullnameEN,
    this.uuid,
    this.lastnameAR,
    this.idn,
    this.nationalityEN,
    this.firstnameEN,
    this.userType,
    this.nationalityAR,
    this.firstnameAR,
    this.email,
  });

  UaepassUser.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    fullnameAR = json['fullnameAR'];
    gender = json['gender'];
    mobile = json['mobile'];
    lastnameEN = json['lastnameEN'];
    fullnameEN = json['fullnameEN'];
    uuid = json['uuid'];
    lastnameAR = json['lastnameAR'];
    idn = json['idn'];
    nationalityEN = json['nationalityEN'];
    firstnameEN = json['firstnameEN'];
    userType = json['userType'];
    nationalityAR = json['nationalityAR'];
    firstnameAR = json['firstnameAR'];
    email = json['email'];
  }
}
