import 'dart:convert';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/dashboard_model.dart';
import 'package:fiinzy_pro/models/employment_list_model.dart';
import 'package:fiinzy_pro/models/occupation_model.dart';
import 'package:fiinzy_pro/screens/dashborad_screen.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:fiinzy_pro/service/api_service.dart';

class CreateLeadLoanController extends GetxController implements GetxService {
  TextEditingController name = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController loanAmount = TextEditingController();
  var employmentList = <EmploymentData>[];
  var occupationsList = <OccupationsModel>[];
  var employmentModel;
  var occupationsModel;
  var loanTypeList = <Loantype>[];
  bool loading = false;
  String gender = "";
  var loanTypeId = "".obs;
  var loanTypeName = "".obs;
  var bankTypeId = "".obs;
  var employmentID = "".obs;
  var occupationID = "".obs;
  var pathToAudio = "".obs;
  final List bankList = [
    {
      'title': 'HDFC',
      'image': "assets/images/hdfc.png",
    },
    {
      'title': 'SBI',
      'image': "assets/images/sbi.png",
    },
    {
      'title': 'YES',
      'image': "assets/images/yes.png",
    },
    {
      'title': 'Axis',
      'image': "assets/images/axis.png",
    },
  ];

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

  Future<void> dashboard() async {
    try {
      loading = true;
      loanTypeList.clear();
      var result = await ApiService.dashboardApi();
      var json = jsonDecode(result.body);
      final apiResponse = DashboardModel.fromJson(json);
      if (apiResponse.status == true) {
        loading = false;
        loanTypeList.addAll(apiResponse.loantype!);
      } else {
        loading = false;
        errorToast(apiResponse.message.toString());
      }
    } catch (e) {
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getEmploymentList(String loanTypeId) async {
    try {
      employmentList.clear();
      loading = true;
      var result = await ApiService.employmentListApi(loanTypeId);
      var json = jsonDecode(result.body);
      if (json['status'] == true) {
        closeProgress();
        employmentList = List<EmploymentData>.from(json['data'].map((i) => EmploymentData.fromJson(i))).toList(growable: true);
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

  Future<void> occupationsApi() async {
    try {
      occupationsList.clear();
      loading = true;
      var result = await ApiService.occupations();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        closeProgress();
        occupationsList = List<OccupationsModel>.from(json['data'].map((i) => OccupationsModel.fromJson(i))).toList(growable: true);
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

  Future<void> createLeadApi() async {
    showProgress();
    try {
      var result = await ApiService.createLead(
        loanTypeId.value,
        employmentID.value,
        occupationID.value,
        name.text,
        emailAddress.text,
        mobileNo.text,
        gender,
        loanAmount.text,
        pathToAudio.value,
      );
      if (result["status"] == true) {
        closeProgress();
        loanTypeId.value = "";
        employmentID.value = "";
        occupationID.value = "";
        name.text = "";
        mobileNo.text = "";
        gender = "";
        loanAmount.text = "";
        pathToAudio.value = "";
        Get.offAll(() =>  DashBoardScreen(ctrIndex: 0,));
        successToast(result["message"].toString());
      } else {
        closeProgress();
        errorToast(result["message"].toString());
      }
    } catch (e) {
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
}
