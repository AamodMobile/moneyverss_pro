class PartnerCategoryListModel {
  int? id;
  String? name;
  String? description;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  PartnerCategoryListModel({
    this.id,
    this.name,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory PartnerCategoryListModel.fromJson(Map<String, dynamic> json) => PartnerCategoryListModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
