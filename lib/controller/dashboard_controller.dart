import 'dart:convert';

import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/TrainingVideloListModel.dart';
import 'package:fiinzy_pro/models/blog_list_model.dart';
import 'package:fiinzy_pro/models/dashboard_model.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:fiinzy_pro/service/api_service.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController implements GetxService {
  var bannerList = <Banner>[];
  var loanTypeList = <Loantype>[];
  var loanMainTypeList = <Loantype>[];
  var testimonialList = <Testimonial>[];
  var trainingVideoList = <TrainingVideoData>[];
  var blogsList = <Blogs>[];
  bool loading = false;
  var myEarning = "".obs;
  var notificationCont = "0".obs;
  var selectedIndex = 0.obs;
  //var blogList = <BlogListModel>[];

  Future<void> markAsRead() async {
    try {
      var result = await ApiService.markAsRead();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        getContNotification();
      } else {
        errorToast(json["message"].toString());
      }
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getContNotification() async {
    try {
      var result = await ApiService.dashboardApi();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        notificationCont.value = json["notification_count"]??"0";
      } else {

      }
    } catch (e) {
      Log.console(e.toString());
    }
    update();
  }

  Future<void> dashboard() async {
    try {
      loading = true;
      bannerList.clear();
      loanTypeList.clear();
      loanMainTypeList.clear();
      testimonialList.clear();
      trainingVideoList.clear();
      blogsList.clear();
      var result = await ApiService.dashboardApi();
      var json = jsonDecode(result.body);
      final apiResponse = DashboardModel.fromJson(json);
      if (apiResponse.status == true) {
        loading = false;
        myEarning.value = apiResponse.myEarning.toString();
        bannerList.addAll(apiResponse.banner!);
        loanTypeList.addAll(apiResponse.loanShorttype!);
        loanMainTypeList.addAll(apiResponse.loantype!);
        testimonialList.addAll(apiResponse.testimonial!);
        trainingVideoList.addAll(apiResponse.trainingVideoList!);
        blogsList.addAll(apiResponse.blogs!);

        //blogList = List<BlogListModel>.from(json['blogs'].map((i) => BlogListModel.fromJson(i))).toList(growable: true);
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
}
