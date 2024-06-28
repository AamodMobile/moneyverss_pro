import 'dart:convert';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/faqs_model.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:fiinzy_pro/service/api_service.dart';



class FaqsController extends GetxController implements GetxService {
    var faqsList = <FaqsModel>[];
  bool isLoading = false;

  Future<void> faqsGet() async {
    isLoading = true;
    try {
      var result = await ApiService.faqs();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        isLoading = false;
        faqsList = List<FaqsModel>.from(json['data'].map((i) => FaqsModel.fromJson(i))).toList(growable: true);

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
}
