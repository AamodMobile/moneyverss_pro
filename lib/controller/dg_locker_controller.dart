import 'dart:io';

import 'package:get/get.dart';

class DGLockerController extends GetxController implements GetxService {
  Rx<File> panCard = File("").obs;
  Rx<File> aadhaarCard = File("").obs;
  Rx<File> drivingLicence = File("").obs;
  Rx<File> bankDetails = File("").obs;
  Rx<File> otherDocuments = File("").obs;
  Rx<File>  aadhaarCardBack = File("").obs;


}
