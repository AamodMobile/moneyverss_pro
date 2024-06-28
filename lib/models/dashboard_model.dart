import 'package:fiinzy_pro/models/TrainingVideloListModel.dart';

class DashboardModel {
  bool? status;
  String? message;
  List<Banner>? banner;
  List<Loantype>? loantype;
  List<Loantype>? loanShorttype;
  List<Testimonial>? testimonial;
  List<Blogs>? blogs;
  List<TrainingVideoData>? trainingVideoList;
  String? myEarning;

  DashboardModel(
      {this.status,
        this.message,
        this.banner,
        this.loantype,
        this.loanShorttype,
        this.testimonial,
        this.blogs,
        this.trainingVideoList,
        this.myEarning});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    if (json['loantype'] != null) {
      loantype = <Loantype>[];
      json['loantype'].forEach((v) {
        loantype!.add(new Loantype.fromJson(v));
      });
    }
    if (json['loantype'] != null) {
      loanShorttype= json["loantype"] == null
          ? []
          : List<Loantype>.from(json["loantype"]!.map((x) => Loantype.fromJson(x)))
          .where((subStatus) => subStatus.name != "Topup")
          .toList();
    }
    if (json['testimonial'] != null) {
      testimonial = <Testimonial>[];
      json['testimonial'].forEach((v) {
        testimonial!.add(new Testimonial.fromJson(v));
      });
    }
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
    if (json['training_video_list'] != null) {
      trainingVideoList = <TrainingVideoData>[];
      json['training_video_list'].forEach((v) {
        trainingVideoList!.add(new TrainingVideoData.fromJson(v));
      });
    }
    myEarning = json['my_earning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    if (this.loantype != null) {
      data['loantype'] = this.loantype!.map((v) => v.toJson()).toList();
    }
    if (loanShorttype != null) {
      data['loantype'] = loanShorttype!.map((v) => v.toJson()).toList();
    }
    if (this.testimonial != null) {
      data['testimonial'] = this.testimonial!.map((v) => v.toJson()).toList();
    }
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    if (this.trainingVideoList != null) {
      data['training_video_list'] =
          this.trainingVideoList!.map((v) => v.toJson()).toList();
    }
    data['my_earning'] = this.myEarning;
    return data;
  }
}

class Banner {
  int? id;
  String? heading;
  String? title;
  String? description;
  String? type;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Banner(
      {this.id,
        this.heading,
        this.title,
        this.description,
        this.type,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Loantype {
  int? id;
  String? name;
  String? type;
  int? status;
  String? image;
  int? bank;
  String? parentId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Loantype(
      {this.id,
        this.name,
        this.type,
        this.status,
        this.image,
        this.bank,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Loantype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    image = json['image'];
    bank = json['bank'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['image'] = this.image;
    data['bank'] = this.bank;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Testimonial {
  int? id;
  int? customerId;
  String? name;
  String? rating;
  String? description;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? deletedStatus;

  Testimonial(
      {this.id,
        this.customerId,
        this.name,
        this.rating,
        this.description,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedStatus});

  Testimonial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    name = json['name'];
    rating = json['rating'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedStatus = json['deleted_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_status'] = this.deletedStatus;
    return data;
  }
}