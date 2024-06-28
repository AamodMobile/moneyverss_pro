import 'dart:convert';

import 'package:fiinzy_pro/constants/all_logs.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/models/my_earning_list_model.dart';
import 'package:fiinzy_pro/models/my_payout_list_model.dart';
import 'package:fiinzy_pro/service/api_service.dart';

import '../constants/util.dart';

class MyEarningController extends GetxController implements GetxService{
  bool loading = false;
  var totalEarning = "";
  var amountStatus = "";
  var myApplicationList = <RecentlyAppliedApplication>[];
  var myPayoutsList = <MyPayoutListModel>[];
  var totalEarningPayOut = "0".obs;
  Future<void> getMyEarningList(String filterBy, bool isLoading) async {
    loading = isLoading;
    if(!isLoading){
      showProgress();
    }
    myApplicationList.clear();
    totalEarning = "1";
    try{
      var result = await ApiService.myEarningListApi(filterBy);
      var json = jsonDecode(result.body);
      final apiResponse = MyEarningListModel.fromJson(json);
      if (apiResponse.status == true) {
        loading = false;
        closeProgress();
        totalEarning = apiResponse.totalEarning.toString();
        amountStatus = apiResponse.amountStatus.toString();
        myApplicationList.addAll(apiResponse.recentlyAppliedApplication!);
      }else{
        loading = false;
        closeProgress();
        errorToast(apiResponse.message.toString());
      }
    }catch(e){
      loading = false;
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
  Future<void> myPayoutsListGet(bool isLoading) async {
    loading = isLoading;
    if(!isLoading){
      showProgress();
    }
    myPayoutsList.clear();
    try{
      var result = await ApiService.myPayouts();
      var json = jsonDecode(result.body);
      if (json["status"]== true) {
        loading = false;
        closeProgress();
        totalEarningPayOut.value=json["mytotalearning"].toString();
        myPayoutsList=List<MyPayoutListModel>.from(json['data'].map((i) => MyPayoutListModel.fromJson(i))).toList(growable: true);
      }else{
        loading = false;
        closeProgress();
        errorToast(json["message"].toString());
      }
    }catch(e){
      loading = false;
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }
}