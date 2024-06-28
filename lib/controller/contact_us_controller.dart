import 'dart:convert';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/contact_us_model.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:fiinzy_pro/service/api_service.dart';




class ContactUsController extends GetxController implements GetxService{

  var contact = ContactUsModel().obs;
  Future<void> contactUs() async {
    try {
      var result = await ApiService.contactUs();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        ContactUsModel contactUsModel = ContactUsModel.fromJson(json['data']);
        contact.value = contactUsModel;
      } else {
        errorToast(json["message"].toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }
}