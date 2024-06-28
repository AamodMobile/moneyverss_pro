import 'dart:convert';
import 'dart:io';

import 'package:fiinzy_pro/constants/strings.dart';
import 'package:fiinzy_pro/service/api_client.dart';
import 'package:fiinzy_pro/service/api_url.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetConnect {
  static var client = http.Client();

  ///Login api
  static Future<http.Response> loginApi(String name, String mobile) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.login, body: {'name': name, 'mobile': mobile});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///sign up api
  static Future<http.Response> signUpApi(String name, String mobile, String email) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.login, body: {'name': name, 'mobile': mobile, "email": email});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///VerifyOtp api
  static Future<http.Response> verifyOtpApi(String name, String mobile, String otp) async {
    http.Response response;
    var result = await ApiClient.postData(ApiUrl.verifyOtp, body: {'name': name, 'mobile': mobile, 'otp': otp});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///Dashboard api
  static Future<http.Response> dashboardApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.dashboard,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///Update Profile
  static Future<dynamic> updateProfile(
    String name,
    String mobile,
    String panNo,
    String aadharNo,
    String email,
    String gender,
    String employmentId,
    String experienceId,
    String stateId,
    String cityId,
    String pinCode,
    String address,
    String panCard,
    String aadharCard,
    String aadharCardBack,
  ) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.updateProfile));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['name'] = name;
      request.fields['mobile_no'] = mobile;
      request.fields['pan_number'] = panNo;
      request.fields['aadhar_number'] = aadharNo;
      request.fields['email_address'] = email;
      request.fields['gender'] = gender;
      request.fields['employment_type'] = employmentId;
      request.fields['experience'] = experienceId;
      request.fields['state_id'] = stateId;
      request.fields['city_id'] = cityId;
      request.fields['pincode'] = pinCode;
      request.fields['address'] = address;
      if (panCard.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('pan_card', panCard);
        request.files.add(file);
      }
      if (aadharCard.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('aadhar_card', aadharCard);
        request.files.add(file);
      }
      if (aadharCardBack.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('aadhar_card_back', aadharCardBack);
        request.files.add(file);
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  /// get profile api
  static Future<http.Response> userProfileGet() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.getUserProfile,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// notificationsList
  static Future<http.Response> notificationsList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.notification, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// markAsRead
  static Future<http.Response> markAsRead() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.markAsRead, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// deleteNotification
  static Future<http.Response> deleteNotification() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.deleteNotification, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///employmentList api
  static Future<http.Response> employmentListApi(String loanTypeId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.getData(
      "${ApiUrl.employmentList}?loan_type_id=$loanTypeId",
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///occupations api
  static Future<http.Response> occupations() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.occupations,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///State List api
  static Future<http.Response> stateListApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.stateList,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///CityList api
  static Future<http.Response> cityListApi(String stateId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.cityList, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      "state_id": stateId
    });
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  static Future<dynamic> createLead(
    String loanTypeId,
    String employementTypeId,
    String occupationId,
    String name,
    String email,
    String mobileNo,
    String gender,
    String loanAmount,
    var voiceMassage,
  ) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.createLead));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['loan_type_id'] = loanTypeId;
      request.fields['employement_type_id'] = employementTypeId;
      request.fields['occupation_id'] = occupationId;
      request.fields['customer_name'] = name;
      request.fields['customer_email'] = email;
      request.fields['mobile_no'] = mobileNo;
      request.fields['gender'] = gender;
      request.fields['loan_amount'] = loanAmount;
      if (voiceMassage != null && voiceMassage.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('voice_message', voiceMassage);
        request.files.add(file);
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  ///lead list api
  static Future<http.Response> leadListApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.leadList,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// blog list api
  static Future<http.Response> blogsListGet() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.blogsList,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// Blog Details
  static Future<http.Response> blogDetailsGet(String id) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.blogDetails, headers: {'Authorization': 'Bearer $token'}, body: {"blog_id": id});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// logout
  static Future<http.Response> logout() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.logout,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// contactUs
  static Future<http.Response> contactUs() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.contactUs, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// aboutUs
  static Future<http.Response> cmsPages(String type) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.cmsPages, headers: {'Authorization': 'Bearer $token'}, body: {"type": type});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// faqs
  static Future<http.Response> faqs() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.faqs,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// companyPolicy
  static Future<http.Response> companyPolicy() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.companyPolicy,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// socialLinksGet
  static Future<http.Response> socialLinksGet() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.socialLinksGet,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// experienceList
  static Future<http.Response> experienceList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.experienceList,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///profileImage
  static Future<dynamic> profileImage(String profileImage) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.profileImage));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      if (profileImage.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('profile_image', profileImage);
        request.files.add(file);
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  /// delete Account
  static Future<http.Response> deleteAccount() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.deleteAccount,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// loanStatusHistory
  static Future<http.Response> loanStatusHistory(String id) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.loanStatusHistory, headers: {'Authorization': 'Bearer $token'}, body: {"lead_id": id});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// Documents List
  static Future<http.Response> documentsList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.documentsList, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  /// uploadDocument
  static Future<dynamic> uploadDocument(var documentId, var document, String id) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.uploadDocument));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['lead_id'] = id;
      if (documentId.isNotEmpty) {
        for (int i = 0; i < documentId.length; i++) {
          request.fields['document_id[]'] = documentId[i];
        }
      }
      if (document != null && document.isNotEmpty) {
        for (int i = 0; i < document.length; i++) {
          if (document[i] is String) {
          } else if (document[i] is File) {
            final File file = File(document[i].path);
            http.MultipartFile file2 = await http.MultipartFile.fromPath("document[]", file.path.toString());
            request.files.add(file2);
          }
        }
      }
      response = await http.Response.fromStream(await request.send());
      print(response.body);
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(jsonEncode({e.toString()}), 204, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    }
    return result;
  }

  ///MYYEarning list api
  static Future<http.Response> myEarningListApi(String filterBy) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.myEarningList,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {"filter_by": filterBy},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //TraningVideoCategoryList
  static Future<http.Response> getTrainingVideoCategoriesApi() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.traningVideoCategoryList, headers: {'Authorization': 'Bearer $token'});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //TraningVideoList
  static Future<http.Response> getTrainingVideoApi(String categoryId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(ApiUrl.traningVideoList, headers: {'Authorization': 'Bearer $token'}, body: {"category_id": categoryId});
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  //Partner Category List
  static Future<http.Response> partnerCategoryList() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.partnerCategoryList,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }

  ///Update Profile
  static Future<dynamic> registerApi(
    String name,
    String mobile,
    String aadharNo,
    String panCardNumber,
    String email,
    String gender,
    String employmentId,
    String experienceId,
    String stateId,
    String cityId,
    String pinCode,
    String address,
    String panCard,
    String aadharCard,
    String aadharCardBack,
    String partnerCategoryId,
  ) async {
    var result;
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    try {
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(ApiUrl.register));
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['mobile_no'] = mobile;
      request.fields['gender'] = gender;
      request.fields['state_id'] = stateId;
      request.fields['city_id'] = cityId;
      request.fields['pincode'] = pinCode;
      request.fields['address'] = address;
      request.fields['experience'] = experienceId;
      request.fields['employment_type'] = employmentId;
      request.fields['pan_card_number'] = panCardNumber;
      request.fields['address_proof_number'] = aadharNo;
      request.fields['partner_category_id'] = partnerCategoryId;

      if (panCard.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('pan_card_front_image', panCard);
        request.files.add(file);
      }
      if (aadharCard.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('address_proof_front_image', aadharCard);
        request.files.add(file);
      }
      if (aadharCardBack.isNotEmpty) {
        http.MultipartFile file = await http.MultipartFile.fromPath('address_proof_back_image', aadharCardBack);
        request.files.add(file);
      }
      response = await http.Response.fromStream(await request.send());
      if (response.body != null) {
        if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        } else if (response.statusCode == 404) {
          result = {'status_code': 400, 'message': '404'};
        } else if (response.statusCode == 401) {
          result = jsonDecode(response.body);
        }
      } else {
        result = {'status_code': 404, 'message': 'Unable to Connect to Server!'};
      }
    } catch (e) {
      result = http.Response(
        jsonEncode({e.toString()}),
        204,
        headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
      );
    }
    return result;
  }

  //My Payouts List
  static Future<http.Response> myPayouts() async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.myPayouts,
      headers: {'Authorization': 'Bearer $token'},
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  /// leadDocumentList
  static Future<http.Response> leadDocumentList(String leadId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.leadDocumentList,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "lead_id": leadId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
  /// leadDocumentDelete
  static Future<http.Response> leadDocumentDelete(String documentId,String customerId) async {
    http.Response response;
    var instance = await SharedPreferences.getInstance();
    var token = instance.getString(accessToken);
    var result = await ApiClient.postData(
      ApiUrl.leadDocumentDelete,
      headers: {'Authorization': 'Bearer $token'},
      body: {
        "document_id": documentId,
        "customer_id": customerId,
      },
    );
    response = http.Response(jsonEncode(result), 200, headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'});
    return response;
  }
}
