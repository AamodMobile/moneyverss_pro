import 'dart:async';

class TrainingVideoListModel {
  bool? status;
  String? message;
  List<TrainingVideoData>? data;
  List<Blogs>? blogs;

  TrainingVideoListModel({this.status, this.message, this.data, this.blogs});

  TrainingVideoListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TrainingVideoData>[];
      json['data'].forEach((v) {
        data!.add(new TrainingVideoData.fromJson(v));
      });
    }
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainingVideoData {
  int? id;
  int? videoCategoryId;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? videoLink;
  String? videoThumbnail;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? trainingCategoryName;

  TrainingVideoData(
      {this.id,
        this.videoCategoryId,
        this.title,
        this.shortDescription,
        this.longDescription,
        this.videoLink,
        this.videoThumbnail,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.trainingCategoryName});

  /*TrainingVideoData(int? id, int? videoCategoryId, String? title, String? shortDescription,
              String? longDescription, String? videoLink, String? videoThumbnail, int? status, String? createdAt,
              String? updatedAt, String? deletedAt, String? trainingCategoryName)
      {this.id = id;
        this.videoCategoryId = videoCategoryId;
        this.title = title;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.videoLink = videoLink;
        this.videoThumbnail = videoThumbnail;
        this.status = status;
        this.createdAt= createdAt;
        this.updatedAt = updatedAt;
        this.deletedAt = deletedAt;
        this.trainingCategoryName = trainingCategoryName; }*/

  TrainingVideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoCategoryId = json['video_category_id'];
    title = json['title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    videoLink = json['video_link'];
    videoThumbnail = json['video_thumbnail'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    trainingCategoryName = json['training_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_category_id'] = this.videoCategoryId;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['video_link'] = this.videoLink;
    data['video_thumbnail'] = this.videoThumbnail;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['training_category_name'] = this.trainingCategoryName;
    return data;
  }
}

class Blogs {
  int? id;
  String? title;
  String? image;
  String? shortDes;
  String? createdAt;

  Blogs({this.id, this.title, this.image, this.shortDes, this.createdAt});

  Blogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    shortDes = json['short_des'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['short_des'] = this.shortDes;
    data['created_at'] = this.createdAt;
    return data;
  }
}