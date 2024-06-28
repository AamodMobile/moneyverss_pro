import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/screens/login_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/address_delails_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/personal_and_address_details_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/personal_delails_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/successfully_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/upload_document_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/upload_documnet_and_category_screen.dart';

class SignUpScreen extends StatefulWidget {
  final bool isEdit;

  const SignUpScreen({super.key, required this.isEdit});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0;
  late final int _totalSteps;
  late PageController _pageController;
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      controller.userProfileGet();
      _totalSteps = 3;
      _pageController = PageController(initialPage: _currentStep);
    } else {
      controller.reset();
      _totalSteps = 3;
      _pageController = PageController(initialPage: _currentStep);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _incrementStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      if(widget.isEdit){
        Get.back();
        successToast(" Profile Update!!!");
      }else{
        Get.off(()=>const LoginScreen());
        successToast(" Profile Created!!!");
      }

    }
  }

  void _decrementedStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        if (_currentStep > 0) {
          setState(() {
            _currentStep--;
          });
          _pageController.animateToPage(
            _currentStep,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 2),
            child: ProgressIndicatorWidget(currentStep: _currentStep, totalSteps: _totalSteps),
          ),
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep--;
                      });
                      _pageController.animateToPage(
                        _currentStep,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: Image.asset(
                      icBack,
                      height: 24,
                      width: 24,
                    ),
                  )),
              Text(
                "Profile Details",
                style: TextStyle(
                  color: draKText,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    widget.isEdit?"Update Profile Details":"Create Your Account",
                    style: const TextStyle(
                      color: textGeryCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: medium,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Steps ${_currentStep + 1}/$_totalSteps',
                    style: const TextStyle(
                      color: textGeryCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: medium,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              widget.isEdit?Expanded(
                  child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PersonalDetails(
                    onNext: _incrementStep,
                    onPrevious: _decrementedStep,
                    controller: controller,
                  ),
                  AddressDetails(
                    onNext: _incrementStep,
                    onPrevious: _decrementedStep,
                    controller: controller,
                  ),
                  // BankDetails(onNext:_incrementStep ,onPrevious: _decrementedStep,),
                  UploadDocument(
                    onNext: _incrementStep,
                    onPrevious: _decrementedStep,
                    controller: controller,
                  ),
                  /* SuccessfullyCreated(
                    onNext: _incrementStep,
                    onPrevious: _decrementedStep,
                  ),*/
                ],
              )):Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AddressAndPersonalDetailsScreen(
                        onNext: _incrementStep,
                        onPrevious: _decrementedStep,
                        controller: controller,
                      ),
                      UploadDocumentAndCategoryScreen(
                        onNext: _incrementStep,
                        onPrevious: _decrementedStep,
                        controller: controller,
                      ),
                      SuccessfullyCreated(
                    onNext: _incrementStep,
                    onPrevious: _decrementedStep,
                  ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressIndicatorWidget({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double progress = (currentStep / totalSteps).clamp(0.0, 1.0);
    return RoundedLinearProgressIndicator(
      value: progress,
      color: primaryClNew,
      backgroundColor: otherCl,
      height: 2.0,
      borderRadius: BorderRadius.circular(10.0),
    );
  }
}

class RoundedLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;
  final Color backgroundColor;
  final double height;
  final BorderRadius borderRadius;

  const RoundedLinearProgressIndicator({
    Key? key,
    required this.value,
    this.color = secondaryCl,
    this.backgroundColor = otherCl,
    this.height = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: LinearProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: backgroundColor,
        minHeight: height,
      ),
    );
  }
}
