import 'dart:convert';

import 'package:fiinzy_pro/constants/all_logs.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/service/api_service.dart';
import '../models/TrainingVideloListModel.dart';
import '../models/traning_video_category_model.dart';

class TrainingVideoListController extends GetxController implements GetxService{

  bool loading = false;
  var trainingCategoryList = <TraningVideoCategoryData>[];
  var trainingVideoList = <TrainingVideoData>[];
  var blogList = <Blogs>[];

  Future<void> getTrainingVideoCategoryList() async{
    try{
      loading = true;
      trainingCategoryList.clear();
      var result = await ApiService.getTrainingVideoCategoriesApi();
      var json = jsonDecode(result.body);
      var apiResponse = TraningVideoCategoryModel.fromJson(json);
      loading = false;
      if(apiResponse.status==true){
        trainingCategoryList.addAll(apiResponse.data!);
      }else{
        errorToast(apiResponse.message!);
      }
      if(trainingCategoryList.isNotEmpty) {
        getTrainingVideoList(trainingCategoryList[0].id.toString());
      }
    }catch(e){
      loading = false;
      Log.console(e.toString());
    }
    update();
  }

  Future<void> getTrainingVideoList(String categoryId) async{
    try{
      showProgress();
      trainingVideoList.clear();
      blogList.clear();
      var result = await ApiService.getTrainingVideoApi(categoryId);
      var json = jsonDecode(result.body);
      var apiResponse = TrainingVideoListModel.fromJson(json);
      closeProgress();
      if(apiResponse.status==true){
        trainingVideoList.addAll(apiResponse.data!);
        blogList.addAll(apiResponse.blogs!);
      }else{
        errorToast(apiResponse.message!);
      }
    }catch(e){
      closeProgress();
      Log.console(e.toString());
    }
    update();
  }

}
