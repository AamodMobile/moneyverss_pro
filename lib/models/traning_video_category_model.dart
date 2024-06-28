class TraningVideoCategoryModel {
  bool? status;
  String? message;
  List<TraningVideoCategoryData>? data;

  TraningVideoCategoryModel({this.status, this.message, this.data});

  TraningVideoCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TraningVideoCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new TraningVideoCategoryData.fromJson(v));
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
    return data;
  }
}

class TraningVideoCategoryData {
  int? id;
  String? title;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  TraningVideoCategoryData(
      {this.id,
        this.title,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  TraningVideoCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}