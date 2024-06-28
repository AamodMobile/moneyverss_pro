import 'dart:convert';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/login_model.dart';
import 'package:fiinzy_pro/models/verif_otp_model.dart';
import 'package:fiinzy_pro/screens/dashborad_screen.dart';
import 'package:fiinzy_pro/screens/otp_verification_screen.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:fiinzy_pro/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController implements GetxService {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController email = TextEditingController();

  var nameV = "";
  var mobileV = "";
  var otpV = "";
  var emailV = "";

  Future<void> login() async {

    try {
      showProgress();
      var result = await ApiService.loginApi(nameV, mobileV);
      var json = jsonDecode(result.body);
      final apiResponse = LoginModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        successToast(apiResponse.message.toString());
        Get.to(() => const OTPVerificationScreen());
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
  }

  Future<void> signUP() async {
    try {
      showProgress();
      var result = await ApiService.signUpApi(nameV, mobileV, emailV);
      var json = jsonDecode(result.body);
      final apiResponse = LoginModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        successToast(apiResponse.message.toString());
        Get.to(() => const OTPVerificationScreen());
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
  }

  Future<void> verifyOtp() async {
    try {
      showProgress();
      var result = await ApiService.verifyOtpApi(nameV, mobileV, otpV);
      var json = jsonDecode(result.body);
      final apiResponse = VerifyOtpModel.fromJson(json);
      if (apiResponse.status == true) {
        closeProgress();
        var pref = await SharedPreferences.getInstance();
        await pref.setString(
          userProfile,
          jsonEncode(apiResponse.toJson()),
        );
        await pref.setString(accessToken, apiResponse.accessToken.toString());
        successToast(apiResponse.message.toString());
        Get.offAll(() =>  DashBoardScreen(ctrIndex: 0,));
      } else {
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
  }
}
