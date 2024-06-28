import 'dart:convert';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/models/blog_details_model.dart';
import 'package:fiinzy_pro/models/blog_list_model.dart';
import 'package:fiinzy_pro/service/api_service.dart';

class BlogsController extends GetxController implements GetxService{
  var bannerList = <Banner>[];
  bool loading = false;
  var blogList = <BlogListModel>[];
  BlogDetailsModel? blogDetailsModel;
  Future<void> blogListGet() async {
    try {
      loading = true;
      blogList.clear();
      var result = await ApiService.blogsListGet();
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        blogList = List<BlogListModel>.from(json['data'].map((i) => BlogListModel.fromJson(i))).toList(growable: true);
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
      //Log(e.toString());
    }
    update();
  }

  Future<void> blogDetailsGet(String id) async {
    try {
      loading = true;
      var result = await ApiService.blogDetailsGet(id);
      var json = jsonDecode(result.body);
      if (json["status"] == true) {
        loading = false;
        blogDetailsModel = BlogDetailsModel.fromJson(json["data"]);
      } else {
        loading = false;
        errorToast(json["message"].toString());
      }
    } catch (e) {
      loading = false;
    }
    update();
  }
}