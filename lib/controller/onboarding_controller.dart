



import 'package:fiinzy_pro/constants/constants.dart';

class OnBoardingController extends GetxController implements GetxService {
  var currentPage = 0.obs;
  final totalPages = 3.obs;

  var images = [sliderOneImg, sliderTwoImg, sliderThreeImg].obs;
  var tittle = ["Fiinzy Made offer You", "Check Credit Score For Free", "Your Credit Search Simplified"].obs;
}