import 'dart:convert';
import 'dart:io';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/city_list_model.dart';
import 'package:fiinzy_pro/models/document_list_model.dart';
import 'package:fiinzy_pro/models/employment_list_model.dart';
import 'package:fiinzy_pro/models/experience_model.dart';
import 'package:fiinzy_pro/models/partner_category_list_model.dart';
import 'package:fiinzy_pro/models/state_list_model.dart';
import 'package:fiinzy_pro/models/user_model.dart';
import 'package:fiinzy_pro/screens/login_screen.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:fiinzy_pro/service/api_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController implements GetxService {
  var user = UserModel().obs;
  Rx<File> profileImage = File("").obs;
  Rx<File> panCard = File("").obs;
  Rx<File> aadhaarFrontImg = File("").obs;
  Rx<File> aadhaarBackImg = File("").obs;
  bool loading = false;
  var documentsList = <DocumentListModel>[];
  var experienceId = "".obs;
  var stateId = "".obs;
  var cityId = "".obs;
  var gender = "".obs;
  var partnerCategoryId = "".obs;
  var employmentID = "".obs;
  TextEditingController pinCode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController aadharNo = TextEditingController();
  TextEditingController panNo = TextEditingController();
  var employmentList = <EmploymentData>[];
  var employmentModel;
  var experienceList = <ExperienceModel>[];
  var experienceModel;
  var cityList = <CityData>[];
  var cityModel;
  var stateList = <StateListModel>[];
  var stateModel;
  var partnerCategoryList = <PartnerCategoryListModel>[];
  var partnerCategoryListModel;
  bool isLoading = false;
  var facebook = "";
  var instagram = "";
  var whatsapp = "";
  var youtube = "";
  var pinterest = "";

  void reset() {
    employmentList.clear();
    employmentModel = null;
    experienceList.clear();
    experienceModel = null;
    cityList.clear();
    cityModel = null;
    stateList.clear();
    stateModel = null;
    partnerCategoryList.clear();
    partnerCategoryListModel = null;
    pinCode.text = "";
    address.text = "";
    name.text = "";
    email.text = "";
    mobileNo.text = "";
    aadharNo.text = "";
    panNo.text = "";
    experienceId.value = "";
    stateId.value = "";
    cityId.value = "";
    gender.value = "";
    partnerCategoryId.value = "";
    employmentID.value = "";
    panCard.value = File("");
    aadhaarFrontImg.value = File("");
    aadhaarBackImg.value = File("");
  }

  bool validatePAN(String pan) {
    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(pan);
  }

  bool validateDrivingLicense(String license) {
    String pattern = r'^[A-Z]{2}[0-9]{2}[0-9]{4}[0-9A-Z]{7}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(license);
  }

  bool validateAadhaar(String str) {
    String regex = r'^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$';

    final p = RegExp(regex);
    if (str == null) {
      return false;
    }

    final m = p.hasMatch(str);
    return m;
  }

  String? emailValidator(value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Enter an email';
    } else if (!regExp.hasMatch(
      value.toString().trim(),
    )) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  Future<void> userProfileGet() async {
    try {
      var result = await ApiService.userProfileGet();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        UserModel userModel = UserModel.fromJson(json['data']);
        user.value = userModel;
        mobileNo.text = user.value.mobileNo.toString();
        aadharNo.text = user.value.addressProofNumber.toString();
        panNo.text = user.value.panCardNumber.toString();
        name.text = user.value.name.toString();
        email.text = user.value.email.toString();
        gender.value = user.value.gender.toString();
        experienceId.value = user.value.experience.toString();
        employmentID.value = user.value.employmentType.toString();
        stateId.value = user.value.stateId.toString();
        cityId.value = user.value.cityId.toString();
        pinCode.text = user.value.pincode.toString();
        address.text = user.value.address.toString();
      } else {
        errorToast(json["message"].toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }

  Future<ImageSource?> imagePickerSheet(context) async {
    ImageSource? source = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            color: Colors.white,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_rounded,
                          color: primaryClNew,
                          size: 40,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(color: primaryClNew),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_rounded,
                          color: primaryClNew,
                          size: 40,
                        ),
                        Text('Gallery', style: TextStyle(color: primaryClNew)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
    return source;
  }

  void pickImage(BuildContext context, String type) async {
    var source = await imagePickerSheet(context);
    if (source != null) {
      // ignore: invalid_use_of_visible_for_testing_member
      var picker = ImagePicker.platform;
      // ignore: deprecated_member_use
      var file = await picker.pickImage(
        source: source,
        maxHeight: 1080,
        maxWidth: 1080,
        imageQuality: 90,
      );
      if (type == "profile") {
        profileImage.value = File(file!.path);
        if (profileImage.value.path != "") {
          updateImg();
        }
      } else if (type == "pan_card") {
        panCard.value = File(file!.path);
      } else if (type == "aadhaar_card") {
        aadhaarFrontImg.value = File(file!.path);
      } else if (type == "aadhaar_card_back") {
        aadhaarBackImg.value = File(file!.path);
      }
    }
  }

  Future<bool> updateImg() async {
    try {
      showProgress();
      var response = await ApiService.profileImage(profileImage.value.path);
      if (response['status'] == true) {
        closeProgress();
        userProfileGet();
        successToast(response['message'].toString());
        return true;
      } else {
        closeProgress();
        errorToast(response['message'].toString());
        return false;
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
      return false;
    }
  }

  Future<void> getCityList(String id) async {
    try {
      loading = true;
      cityModel = null;
      cityList.clear();
      var result = await ApiService.cityListApi(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        cityList = List<CityData>.from(json['data'].map((i) => CityData.fromJson(i))).toList(growable: true);
        for (var c in cityList) {
          if (c.cityCode.toString() == cityId.value) {
            cityModel = c;
            break;
          }
        }
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getStateList() async {
    try {
      loading = true;
      stateModel = null;
      stateList.clear();
      var result = await ApiService.stateListApi();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        stateList = List<StateListModel>.from(json['data'].map((i) => StateListModel.fromJson(i))).toList(growable: true);
        for (var c in stateList) {
          if (c.stateId.toString() == stateId.value) {
            stateModel = c;
            getCityList(c.stateId.toString());
            break;
          }
        }
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getEmploymentList(String loanTypeId) async {
    try {
      employmentModel = null;
      employmentList.clear();
      loading = true;
      var result = await ApiService.employmentListApi(loanTypeId);
      var json = jsonDecode(result.body);
      if (json['status'] == true) {
        closeProgress();
        employmentList = List<EmploymentData>.from(json['data'].map((i) => EmploymentData.fromJson(i))).toList(growable: true);
        for (var c in employmentList) {
          if (c.id.toString() == employmentID.value) {
            employmentModel = c;
            break;
          }
        }
      } else {
        closeProgress();
        errorToast(json['message'].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> experienceListGet() async {
    try {
      experienceModel = null;
      experienceList.clear();
      loading = true;
      var result = await ApiService.experienceList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        experienceList = List<ExperienceModel>.from(json['data'].map((i) => ExperienceModel.fromJson(i))).toList(growable: true);
        for (var c in experienceList) {
          if (c.title == experienceId.value) {
            experienceModel = c;
            break;
          }
        }
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<bool> updateProfile() async {
    try {
      showProgress();
      var response = await ApiService.updateProfile(
        name.text,
        mobileNo.text,
        panNo.text,
        aadharNo.text,
        email.text,
        gender.value,
        employmentID.value,
        experienceId.value,
        stateId.value,
        cityId.value,
        pinCode.text,
        address.text,
        panCard != null ? panCard.value.path : "",
        aadhaarFrontImg != null ? aadhaarFrontImg.value.path : "",
        aadhaarBackImg != null ? aadhaarBackImg.value.path : "",
      );
      if (response['status'] == true) {
        panCard.value = File("");
        aadhaarFrontImg.value = File("");
        aadhaarBackImg.value = File("");
        closeProgress();
        userProfileGet();

        return true;
      } else {
        closeProgress();
        errorToast(response['message'].toString());
        return false;
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    try {
      showProgress();
      var response = await ApiService.logout();
      var json = jsonDecode(response.body);
      if (json['status'] == true) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => const LoginScreen());
        closeProgress();
        successToast(json['message'].toString());
      } else {
        closeProgress();
        errorToast(json['message'].toString());
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
    }
  }

  Future<void> socialLinksGet() async {
    isLoading = true;
    try {
      var result = await ApiService.socialLinksGet();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        facebook = json["data"]["facebook"] ?? "";
        instagram = json["data"]["instagram"] ?? "";
        whatsapp = json["data"]["whatsapp"] ?? "";
        youtube = json["data"]["youtube"] ?? "";
        pinterest = json["data"]["pinterest"] ?? "";
      } else {
        isLoading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      isLoading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> deleteAccountApi() async {
    try {
      showProgress();
      var response = await ApiService.deleteAccount();
      var json = jsonDecode(response.body);
      if (json['status'] == true) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => const LoginScreen());
        closeProgress();
        successToast(json['message'].toString());
      } else {
        closeProgress();
        errorToast(json['message'].toString());
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
    }
  }

  Future<void> partnerCategoryListGet() async {
    try {
      partnerCategoryListModel = null;
      partnerCategoryList.clear();
      loading = true;
      var result = await ApiService.partnerCategoryList();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        partnerCategoryList = List<PartnerCategoryListModel>.from(json['data'].map((i) => PartnerCategoryListModel.fromJson(i))).toList(growable: true);
        for (var c in partnerCategoryList) {
          if (c.id.toString() == partnerCategoryId.value) {
            partnerCategoryListModel = c;
            break;
          }
        }
      } else {
        closeProgress();
        errorToast(json["message"].toString());
      }
      loading = false;
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<bool> register() async {
    try {
      showProgress();
      var response = await ApiService.registerApi(
        name.text,
        mobileNo.text,
        aadharNo.text,
        panNo.text,
        email.text,
        gender.value,
        employmentID.value,
        experienceId.value,
        stateId.value,
        cityId.value,
        pinCode.text,
        address.text,
        panCard != null ? panCard.value.path : "",
        aadhaarFrontImg != null ? aadhaarFrontImg.value.path : "",
        aadhaarBackImg != null ? aadhaarBackImg.value.path : "",
        partnerCategoryId.value,
      );
      if (response['status'] == true) {
        reset();
        closeProgress();
        successToast(response['message'].toString());
        return true;
      } else {
        closeProgress();
        errorToast(response['message'].toString());
        return false;
      }
    } catch (e) {
      Log.console(e.toString());
      closeProgress();
      errorToast(e.toString());
      return false;
    }
  }
}
