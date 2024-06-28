class ExperienceModel {
  String? value;
  String? title;

  ExperienceModel({
    this.value,
    this.title,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
    value: json["value"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "title": title,
  };
}
