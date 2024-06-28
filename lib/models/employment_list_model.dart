

class EmploymentData {
  int? id;
  String? name;
  String? description;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  EmploymentData(
      {this.id,
        this.name,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
       });

  EmploymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}