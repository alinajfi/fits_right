class SignUpModel {
  SignUpModel({
    this.onesignalId = '',
    required this.fullName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
    this.systemGendersId = '',
    this.dateOfBirth = '',
    this.termsAgreements = '',
    this.notificationSwitch = '',
    this.sizesUnitsId = '',
    this.sizesUkId = '',
    this.neck = '',
    this.sleevesLength = '',
    this.chest = '',
    this.underBust = '',
    this.waist = '',
    this.hip = '',
    this.height = '',
    this.belly = '',
    this.calf = '',
    this.thigh = '',
    this.insideLegLength = '',
  });

  final String onesignalId;
  final String fullName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  final String systemGendersId;
  final String dateOfBirth;
  final String termsAgreements;
  final String notificationSwitch;
  final String sizesUnitsId;
  final String sizesUkId;
  final String neck;
  final String sleevesLength;
  final String chest;
  final String underBust;
  final String waist;
  final String hip;
  final String height;
  final String belly;
  final String calf;
  final String thigh;
  final String insideLegLength;

  factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        onesignalId: json["onesignal_id"],
        fullName: json["full_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userPhone: json["user_phone"],
        systemGendersId: json["system_genders_id"],
        dateOfBirth: json["date_of_birth"],
        termsAgreements: json["terms_agreements"],
        notificationSwitch: json["notification_switch"],
        sizesUnitsId: json["sizes_units_id"],
        sizesUkId: json["sizes_uk_id"],
        neck: json["neck"],
        sleevesLength: json["sleeves_length"],
        chest: json["chest"],
        underBust: json["under_bust"],
        waist: json["waist"],
        hip: json["hip"],
        height: json["height"],
        belly: json["belly"],
        calf: json["calf"],
        thigh: json["thigh"],
        insideLegLength: json["inside_leg_length"],
      );

  Map<String, dynamic> toMap() => {
        "onesignal_id": onesignalId,
        "full_name": fullName,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_phone": userPhone,
        "system_genders_id": systemGendersId,
        "date_of_birth": dateOfBirth,
        "terms_agreements": termsAgreements,
        "notification_switch": notificationSwitch,
        "sizes_units_id": sizesUnitsId,
        "sizes_uk_id": sizesUkId,
        "neck": neck,
        "sleeves_length": sleevesLength,
        "chest": chest,
        "under_bust": underBust,
        "waist": waist,
        "hip": hip,
        "height": height,
        "belly": belly,
        "calf": calf,
        "thigh": thigh,
        "inside_leg_length": insideLegLength,
      };
}
