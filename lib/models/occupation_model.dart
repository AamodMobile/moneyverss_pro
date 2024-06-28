class OccupationsModel {
  int? id;
  String? title;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  OccupationsModel({
    this.id,
    this.title,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory OccupationsModel.fromJson(Map<String, dynamic> json) => OccupationsModel(
    id: json["id"],
    title: json["title"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
