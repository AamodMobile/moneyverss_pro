class MyPayoutListModel {
  int? id;
  int? partnerCategoryId;
  int? loanTypeId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? loanName;
  String? loanImage;
  List<PaySlab>? paySlab;

  MyPayoutListModel({
    this.id,
    this.partnerCategoryId,
    this.loanTypeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.loanName,
    this.loanImage,
    this.paySlab,
  });

  factory MyPayoutListModel.fromJson(Map<String, dynamic> json) => MyPayoutListModel(
    id: json["id"],
    partnerCategoryId: json["partner_category_id"],
    loanTypeId: json["loan_type_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    loanName: json["loan_name"],
    loanImage: json["loan_image"]??"",
    paySlab: json["pay_slab"] == null ? [] : List<PaySlab>.from(json["pay_slab"]!.map((x) => PaySlab.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "partner_category_id": partnerCategoryId,
    "loan_type_id": loanTypeId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "loan_name": loanName,
    "loan_image": loanImage,
    "pay_slab": paySlab == null ? [] : List<dynamic>.from(paySlab!.map((x) => x.toJson())),
  };
}

class PaySlab {
  int? id;
  int? payoutCommissionRatesId;
  String? loanAmountRange;
  String? rates;
  DateTime? createdAt;
  DateTime? updatedAt;

  PaySlab({
    this.id,
    this.payoutCommissionRatesId,
    this.loanAmountRange,
    this.rates,
    this.createdAt,
    this.updatedAt,
  });

  factory PaySlab.fromJson(Map<String, dynamic> json) => PaySlab(
    id: json["id"],
    payoutCommissionRatesId: json["payout_commission_rates_id"],
    loanAmountRange: json["loan_amount_range"],
    rates: json["rates"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "payout_commission_rates_id": payoutCommissionRatesId,
    "loan_amount_range": loanAmountRange,
    "rates": rates,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
