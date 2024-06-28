class UserModel {
  int? id;
  String? name;
  String? email;
  String? mobileNo;
  String? gender;
  dynamic age;
  String? image;
  int? employmentType;
  String? experience;
  dynamic dateOfBirth;
  String? stateId;
  String? cityId;
  int? pincode;
  String? address;
  String? password;
  String? apiToken;
  String? addressProofNumber;
  String? addressProofFrontImage;
  String? addressProofBackImage;
  String? panCardNumber;
  String? panCardFrontImage;
  String? panCardBackImage;
  String? partnerCategoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? verifyOtp;
  int? isVerify;
  dynamic deletedAt;
  String? employmentName;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.mobileNo,
    this.gender,
    this.age,
    this.image,
    this.employmentType,
    this.experience,
    this.dateOfBirth,
    this.stateId,
    this.cityId,
    this.pincode,
    this.address,
    this.password,
    this.apiToken,
    this.addressProofNumber,
    this.addressProofFrontImage,
    this.addressProofBackImage,
    this.panCardNumber,
    this.panCardFrontImage,
    this.panCardBackImage,
    this.partnerCategoryId,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.verifyOtp,
    this.isVerify,
    this.deletedAt,
    this.employmentName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"]??"",
    mobileNo: json["mobile_no"],
    gender: json["gender"],
    age: json["age"],
    image: json["image"],
    employmentType: json["employment_type"],
    experience: json["experience"],
    dateOfBirth: json["date_of_birth"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    pincode: json["pincode"],
    address: json["address"],
    password: json["password"],
    apiToken: json["api_token"],
    addressProofNumber: json["address_proof_number"]??"",
    addressProofFrontImage: json["address_proof_front_image"]??"",
    addressProofBackImage: json["address_proof_back_image"]??"",
    panCardNumber: json["pan_card_number"]??"",
    panCardFrontImage: json["pan_card_front_image"]??"",
    panCardBackImage: json["pan_card_back_image"]??"",
    partnerCategoryId: json["partner_category_id"]??"",
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    status: json["status"],
    verifyOtp: json["verify_otp"],
    isVerify: json["is_verify"],
    deletedAt: json["deleted_at"],
    employmentName: json["employment_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile_no": mobileNo,
    "gender": gender,
    "age": age,
    "image": image,
    "employment_type": employmentType,
    "experience": experience,
    "date_of_birth": dateOfBirth,
    "state_id": stateId,
    "city_id": cityId,
    "pincode": pincode,
    "address": address,
    "password": password,
    "api_token": apiToken,
    "address_proof_number": addressProofNumber,
    "address_proof_front_image": addressProofFrontImage,
    "address_proof_back_image": addressProofBackImage,
    "pan_card_number": panCardNumber,
    "pan_card_front_image": panCardFrontImage,
    "pan_card_back_image": panCardBackImage,
    "partner_category_id": partnerCategoryId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
    "verify_otp": verifyOtp,
    "is_verify": isVerify,
    "deleted_at": deletedAt,
    "employment_name": employmentName,
  };
}
