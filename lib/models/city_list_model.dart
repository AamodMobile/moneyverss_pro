class CityData {
  dynamic cityCode;
  String? name;
  dynamic stateId;
  dynamic createdAt;
  dynamic updatedAt;

  CityData(
      {this.cityCode, this.name, this.stateId, this.createdAt, this.updatedAt});

  CityData.fromJson(Map<String, dynamic> json) {
    cityCode = json['city_code'];
    name = json['name'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_code'] = cityCode;
    data['name'] = name;
    data['state_id'] = stateId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}