class MyEarningListModel {
  bool? status;
  String? message;
  int? totalEarning;
  int? amountStatus;
  List<RecentlyAppliedApplication>? recentlyAppliedApplication;

  MyEarningListModel(
      {this.status,
        this.message,
        this.totalEarning,
        this.amountStatus,
        this.recentlyAppliedApplication});

  MyEarningListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalEarning = json['total_earning'];
    amountStatus = json['amount_status']??0;
    if (json['recently_applied_application'] != null) {
      recentlyAppliedApplication = <RecentlyAppliedApplication>[];
      json['recently_applied_application'].forEach((v) {
        recentlyAppliedApplication!
            .add(new RecentlyAppliedApplication.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['total_earning'] = this.totalEarning;
    data['amountStatus'] = this.amountStatus;
    if (this.recentlyAppliedApplication != null) {
      data['recently_applied_application'] =
          this.recentlyAppliedApplication!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentlyAppliedApplication {
  int? id;
  Null? customerId;
  String? uniqueId;
  String? customerName;
  String? customerMobileNumber;
  String? customerEmailId;
  int? applicantTypeId;
  Null? customerAge;
  String? loanTypeId;
  Null? annualIncomeId;
  String? bankId;
  String? loanSubTypeId;
  Null? loanAmountId;
  String? loanAmount;
  int? status;
  String? leadStatus;
  Null? stateId;
  Null? cityId;
  String? createdAt;
  String? updatedAt;
  String? applicantType;
  String? loanType;
  String? loanAmountRange;
  String? stateName;
  String? cityName;
  String? documentStatus;

  RecentlyAppliedApplication(
      {this.id,
        this.customerId,
        this.uniqueId,
        this.customerName,
        this.customerMobileNumber,
        this.customerEmailId,
        this.applicantTypeId,
        this.customerAge,
        this.loanTypeId,
        this.annualIncomeId,
        this.bankId,
        this.loanSubTypeId,
        this.loanAmountId,
        this.loanAmount,
        this.status,
        this.leadStatus,
        this.stateId,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.applicantType,
        this.loanType,
        this.loanAmountRange,
        this.stateName,
        this.cityName,
        this.documentStatus});

  RecentlyAppliedApplication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    uniqueId = json['unique_id'];
    customerName = json['customer_name'];
    customerMobileNumber = json['customer_mobile_number'];
    customerEmailId = json['customer_email_id'];
    applicantTypeId = json['applicant_type_id'];
    customerAge = json['customer_age'];
    loanTypeId = json['loan_type_id'];
    annualIncomeId = json['annual_income_id'];
    bankId = json['bank_id'];
    loanSubTypeId = json['loan_sub_type_id'];
    loanAmountId = json['loan_amount_id'];
    loanAmount = json['loan_amount'];
    status = json['status'];
    leadStatus = json['lead_status'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    applicantType = json['applicant_type'];
    loanType = json['loan_type'];
    loanAmountRange = json['loan_amount_range'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    documentStatus = json['document_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['unique_id'] = this.uniqueId;
    data['customer_name'] = this.customerName;
    data['customer_mobile_number'] = this.customerMobileNumber;
    data['customer_email_id'] = this.customerEmailId;
    data['applicant_type_id'] = this.applicantTypeId;
    data['customer_age'] = this.customerAge;
    data['loan_type_id'] = this.loanTypeId;
    data['annual_income_id'] = this.annualIncomeId;
    data['bank_id'] = this.bankId;
    data['loan_sub_type_id'] = this.loanSubTypeId;
    data['loan_amount_id'] = this.loanAmountId;
    data['loan_amount'] = this.loanAmount;
    data['status'] = this.status;
    data['lead_status'] = this.leadStatus;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['applicant_type'] = this.applicantType;
    data['loan_type'] = this.loanType;
    data['loan_amount_range'] = this.loanAmountRange;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['document_status'] = this.documentStatus;
    return data;
  }
}