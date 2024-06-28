import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/create_lead_controller.dart';
import 'package:fiinzy_pro/screens/create_lead/personal_details_customer_screen.dart';
import 'package:fiinzy_pro/screens/create_lead/select_loan_type.dart';
import 'package:fiinzy_pro/screens/dashborad_screen.dart';
import 'package:fiinzy_pro/screens/sing_up/sign_up_screen.dart';

import '../../constants/get_device_type.dart';

class CreateLeadScreen extends StatefulWidget {
  final String tittle;
  final bool isBottom;
  final String type;

  const CreateLeadScreen({super.key, required this.tittle, required this.isBottom, required this.type});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
  int _currentStep = 0;
  late final int _totalSteps;
  late PageController _pageController;
  CreateLeadLoanController controller = Get.put(CreateLeadLoanController());

  @override
  void initState() {
    super.initState();
    controller.loanTypeName.value = widget.tittle;
    controller.loanTypeId.value = widget.type;
    _totalSteps = 2;
    _pageController = PageController(initialPage: _currentStep);
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
      /*if(controller.mobileNo.text.isEmpty){
        errorToast("Enter mobile number");
      }else if(controller.name.text.isEmpty){
        errorToast("Enter your name");
      }else if(controller.emailAddress.text.isEmpty){
        errorToast("Enter email address");
      }elseif(controller.occupationID.isEmpty){
        errorToast("Select your occupation");
      }else if(controller.loanAmount.text.isEmpty){
        errorToast("Enter enter your loan amount");
      }*/if(controller.employmentID.isEmpty){
        errorToast("Select your employment type");
      }else {
        controller.createLeadApi();
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
          appBar: widget.isBottom
              ? null
              : AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: appBarClNew1,
                  centerTitle: false,
                  bottom: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 2),
                    child: ProgressIndicatorWidget(currentStep: _currentStep, totalSteps: _totalSteps),
                  ),
                  title: Row(
                    children: [
                      Image.asset(
                        imgSplashLogo,
                        height: 22,
                        fit: BoxFit.contain,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DashBoardScreen(ctrIndex: 0,)));
                          }
                        },
                        child: Container(
                          height: GetDeviceType().getDeviceType(context)?25 : 22,
                          width: GetDeviceType().getDeviceType(context)?25 : 22,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                              size: 14,
                            ),
                          ),
                        )),
                    const SizedBox(width: 10),
                    Obx(
                      () => Text(
                        controller.loanTypeName.toString(),
                        style: TextStyle(
                          color: textGeryCl,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontFamily: medium,
                          fontSize: GetDeviceType().getDeviceType(context)?16 : 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Steps ${_currentStep + 1}/$_totalSteps',
                      style: TextStyle(
                        color: textGeryCl,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: medium,
                        fontSize: GetDeviceType().getDeviceType(context)?16 : 12,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                    child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SelectLoanType(
                      onNext: _incrementStep,
                      onPrevious: _decrementedStep,
                      controller: controller,
                    ),
                    PersonalDetailsCustomer(
                      onNext: _incrementStep,
                      onPrevious: _decrementedStep,
                      controller: controller,
                    )
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
