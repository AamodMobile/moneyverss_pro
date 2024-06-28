import 'dart:io';
import 'package:fiinzy_pro/constants/all_logs.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/widget/my_button.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  PageController pageController = PageController();

  @override
  void initState() {
    stepsList = [
      CustomStep(
        title: 'Personal',
        page: Personal(
          onNext: () {
            if (currentPage < stepsList.length - 1) {
              setState(() {
                currentPage++;
              });
              pageController.animateToPage(
                currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else {}
          },
        ),
      ),
      CustomStep(
        title: 'Addresses',
        page: Address(
          onNext: () {
            if (currentPage < stepsList.length - 1) {
              setState(() {
                currentPage++;
              });
              pageController.animateToPage(
                currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else {}
          },
        ),
      ),
      CustomStep(
        title: 'Bank Details',
        page: BankDetails(
          onNext: () {
            if (currentPage < stepsList.length - 1) {
              setState(() {
                currentPage++;
              });
              pageController.animateToPage(
                currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else {}
          },
        ),
      ),
      CustomStep(
        title: 'Upload Docs',
        page: UploadDocs(
          onNext: () {
            if (currentPage < stepsList.length - 1) {
              setState(() {
                currentPage++;
              });
              pageController.animateToPage(
                currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else {}
          },
        ),
      ),
      CustomStep(
        title: 'Preview',
        page: const Placeholder(
          color: Colors.deepPurple,
        ),
      ),
    ];
    super.initState();
  }

  late List<CustomStep> stepsList;
  int currentPage = 0;

  buildStep(int index) {
    return SizedBox(
      height: 90,
      width: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index <= currentPage
                  ? blueCl
                  : const Color.fromRGBO(15, 67, 205, 0.2),
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
                child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
          ),
          Expanded(
            child: Text(
              stepsList[index].title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: index <= currentPage ? blueCl : mainColor,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildStepDivider(int index) {
    return SizedBox(
      height: 90,
      child: Container(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: const Offset(0, 18),
          child: Container(
              color: index < currentPage
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              width: 36,
              height: 1),
        ),
      ),
    );
  }

  _buildStepper(int currentStep) {
    List<Widget> stepperItems = [];
    for (int index = 0; index < stepsList.length; index++) {
      stepperItems.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildStep(index),
            if (index < stepsList.length - 1) buildStepDivider(index),
          ],
        ),
      );
    }

    return Center(
      child: SizedBox(
        height: 110,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: stepperItems,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        /* appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondaryCl,
          centerTitle: false,
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                    size: 24,
                  )),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Registration",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: medium,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),*/
        body: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: SizedBox(
                height: 90,
                child: _buildStepper(currentPage),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: stepsList.length,
                itemBuilder: (ctx, index) => stepsList[index].page,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CustomStep {
  final String title;
  final Widget page;

  CustomStep({required this.title, required this.page});
}

class Personal extends StatefulWidget {
  final VoidCallback onNext;

  const Personal({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  String? selectedOccupation;
  List occupationList = [
    {"title": "Student", "value": "1"},
    {"title": "Self Employed", "value": "2"},
    {"title": "Govt Employed", "value": "3"},
    {"title": "Retired", "value": "4"},
    {"title": "Unemployed", "value": "5"},
    {"title": " Owner-Operator", "value": "6"},
  ];
  String? selectedGander;
  List genderList = [
    {"title": "Male", "value": "1"},
    {"title": "Female", "value": "2"},
    {"title": "other", "value": "3"},
  ];
  String? selectedEmployed;
  List employedList = [
    {"title": "Full-Time Employment", "value": "1"},
    {"title": "Part-Time Employment", "value": "2"},
    {"title": "Different Types of Employment", "value": "3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Full Name",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              MyTextFormField(
                hint: 'Enter Full Name',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Material(
                    child: Image.asset(
                      userIc,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Mobile Number",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              MyTextFormField(
                hint: 'Enter Mobile Number',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Material(
                    child: Image.asset(
                      telephoneIc,
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Occupation",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String?>(
                    icon: const ImageIcon(
                      AssetImage(dropDownArrow),
                      size: 20,
                    ),
                    dropdownColor: Colors.white,
                    iconDisabledColor: primaryCl,
                    iconEnabledColor: primaryCl,
                    menuMaxHeight: 400,
                    validator: (v) {
                      if (v == "") {
                        return "Select Occupation";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Occupation",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB4B4B4),
                          fontFamily: regular,
                          fontSize: 12),
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: redCl,
                        fontFamily: regular,
                        fontSize: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    isDense: true,
                    hint: const Text(
                      "Select Occupation",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: regular,
                          fontSize: 12),
                    ),
                    value: selectedOccupation,
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "Occupation",
                            style: TextStyle(
                                fontFamily: regular,
                                color: textLightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      ...occupationList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e["title"].toString(),
                          child: Text(e["title"],
                              style: const TextStyle(
                                  fontFamily: regular,
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedOccupation = value.toString();
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "PAN Number",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter PAN',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Gender",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String?>(
                    icon: const ImageIcon(
                      AssetImage(dropDownArrow),
                      size: 20,
                    ),
                    dropdownColor: Colors.white,
                    iconDisabledColor: primaryCl,
                    iconEnabledColor: primaryCl,
                    menuMaxHeight: 400,
                    validator: (v) {
                      if (v == "") {
                        return "Select Gander";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Gander",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB4B4B4),
                          fontFamily: regular,
                          fontSize: 12),
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: redCl,
                        fontFamily: regular,
                        fontSize: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    isDense: true,
                    hint: const Text(
                      "Select Gander",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: regular,
                          fontSize: 12),
                    ),
                    value: selectedGander,
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "Gander",
                            style: TextStyle(
                                fontFamily: regular,
                                color: textLightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      ...genderList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e["title"].toString(),
                          child: Text(e["title"],
                              style: const TextStyle(
                                  fontFamily: regular,
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedGander = value.toString();
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Employment Type",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String?>(
                    icon: const ImageIcon(
                      AssetImage(dropDownArrow),
                      size: 20,
                    ),
                    dropdownColor: Colors.white,
                    iconDisabledColor: primaryCl,
                    iconEnabledColor: primaryCl,
                    menuMaxHeight: 400,
                    validator: (v) {
                      if (v == "") {
                        return "Select Employment Type";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Employment Type",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB4B4B4),
                          fontFamily: regular,
                          fontSize: 12),
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: redCl,
                        fontFamily: regular,
                        fontSize: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    isDense: true,
                    hint: const Text(
                      "Select Employment Type",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: regular,
                          fontSize: 12),
                    ),
                    value: selectedEmployed,
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "Employment Type",
                            style: TextStyle(
                                fontFamily: regular,
                                color: textLightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      ...employedList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e["title"].toString(),
                          child: Text(e["title"],
                              style: const TextStyle(
                                  fontFamily: regular,
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedEmployed = value.toString();
                      });
                    }),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  child: MyButton(
                    onPressed: () {
                      /* if (typeOfUser == -1) {
                  final snackBar = SnackBar(
                    backgroundColor: redCl,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.up,
                    content: const Text("Please Select Type"),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {*/
                      widget.onNext();
                      //  }
                    },
                    color: secondaryCl,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: whiteColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Address extends StatefulWidget {
  final VoidCallback onNext;

  const Address({super.key, required this.onNext});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String? selectedState;
  List stateList = [
    {"title": "Rajasthan", "value": "1"},
    {"title": "Punjab", "value": "2"},
    {"title": "Haryana", "value": "3"},
    {"title": "Gujarat", "value": "4"},
  ];
  String? selectedCity;
  List cityList = [
    {"title": "City1", "value": "1"},
    {"title": "City2", "value": "2"},
    {"title": "City3", "value": "3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "State",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String?>(
                    icon: const ImageIcon(
                      AssetImage(dropDownArrow),
                      size: 20,
                    ),
                    dropdownColor: Colors.white,
                    iconDisabledColor: primaryCl,
                    iconEnabledColor: primaryCl,
                    menuMaxHeight: 400,
                    validator: (v) {
                      if (v == "") {
                        return "Select State";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "State",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB4B4B4),
                          fontFamily: regular,
                          fontSize: 12),
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: redCl,
                        fontFamily: regular,
                        fontSize: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    isDense: true,
                    hint: const Text(
                      "Select State",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: regular,
                          fontSize: 12),
                    ),
                    value: selectedState,
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "State",
                            style: TextStyle(
                                fontFamily: regular,
                                color: textLightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      ...stateList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e["title"].toString(),
                          child: Text(e["title"],
                              style: const TextStyle(
                                  fontFamily: regular,
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedState = value.toString();
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "City",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String?>(
                    icon: const ImageIcon(
                      AssetImage(dropDownArrow),
                      size: 20,
                    ),
                    dropdownColor: Colors.white,
                    iconDisabledColor: primaryCl,
                    iconEnabledColor: primaryCl,
                    menuMaxHeight: 400,
                    validator: (v) {
                      if (v == "") {
                        return "Select City";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "City",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB4B4B4),
                          fontFamily: regular,
                          fontSize: 12),
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: redCl,
                        fontFamily: regular,
                        fontSize: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    isDense: true,
                    hint: const Text(
                      "Select City",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: regular,
                          fontSize: 12),
                    ),
                    value: selectedCity,
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "City",
                            style: TextStyle(
                                fontFamily: regular,
                                color: textLightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      ...cityList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e["title"].toString(),
                          child: Text(e["title"],
                              style: const TextStyle(
                                  fontFamily: regular,
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value.toString();
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Address",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter Address',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Pin code",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter Pin code',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  child: MyButton(
                    onPressed: () {
                      /* if (typeOfUser == -1) {
                  final snackBar = SnackBar(
                    backgroundColor: redCl,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.up,
                    content: const Text("Please Select Type"),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {*/
                      widget.onNext();
                      //  }
                    },
                    color: secondaryCl,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: whiteColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class BankDetails extends StatefulWidget {
  final VoidCallback onNext;

  const BankDetails({super.key, required this.onNext});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  String? selectedBank;
  List bankList = [
    {"title": "SBI", "value": "1"},
    {"title": "HDFC", "value": "2"},
    {"title": "YES Bank", "value": "3"},
    {"title": "ICICI Bank", "value": "4"},
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text(
                    "Account Type",
                    style: TextStyle(
                        color: mainColor,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: selectedIndex == 0 ? secondaryCl : lightGry,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Saving",
                          style: TextStyle(
                              color:
                                  selectedIndex == 0 ? whiteColor : mainColor,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: selectedIndex == 1 ? secondaryCl : lightGry,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Current",
                          style: TextStyle(
                              color:
                                  selectedIndex == 1 ? whiteColor : mainColor,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Bank Name",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField<String?>(
                    icon: const ImageIcon(
                      AssetImage(dropDownArrow),
                      size: 20,
                    ),
                    dropdownColor: Colors.white,
                    iconDisabledColor: primaryCl,
                    iconEnabledColor: primaryCl,
                    menuMaxHeight: 400,
                    validator: (v) {
                      if (v == "") {
                        return "Select Bank";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Select Bank",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFB4B4B4),
                          fontFamily: regular,
                          fontSize: 12),
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: redCl,
                        fontFamily: regular,
                        fontSize: 12,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: homeBgCl,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    isDense: true,
                    hint: const Text(
                      "Select Bank",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          fontFamily: regular,
                          fontSize: 12),
                    ),
                    value: selectedBank,
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem(
                          value: "",
                          child: Text(
                            "Select Bank",
                            style: TextStyle(
                                fontFamily: regular,
                                color: textLightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                      ...bankList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          value: e["title"].toString(),
                          child: Text(e["title"],
                              style: const TextStyle(
                                  fontFamily: regular,
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        );
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedBank = value.toString();
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "IFSC Code",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter IFSC Code',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Branch Address",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter Branch Address',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Account Number",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter Account Number',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Confirm Account Number",
                style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
              ),
              const SizedBox(height: 5),
              const MyTextFormField(
                hint: 'Enter Account Number',
                obscureText: false,
                readOnly: false,
                border: homeBgCl,
                fillColor: whiteColor,
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  child: MyButton(
                    onPressed: () {
                      /* if (typeOfUser == -1) {
                  final snackBar = SnackBar(
                    backgroundColor: redCl,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.up,
                    content: const Text("Please Select Type"),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {*/
                      widget.onNext();
                      //  }
                    },
                    color: secondaryCl,
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: whiteColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadDocs extends StatefulWidget {
  final VoidCallback onNext;

  const UploadDocs({super.key, required this.onNext});

  @override
  State<UploadDocs> createState() => _UploadDocsState();
}

class _UploadDocsState extends State<UploadDocs> {
  bool isSelected = false;
  bool isId = false;
  File? pickedImageFile;
  File? aadharFornt, adharBack;
  File? panFornt, panBack;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: isSelected == false
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                          isId = true;
                        });
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 225,
                          decoration: BoxDecoration(
                              color: homeBgCl,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              const SizedBox(height: 7),
                              Image.asset(
                                businessCard,
                                height: 60,
                                width: 65,
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Identity Proof',
                                style: TextStyle(
                                  color: blueCl,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 7),
                              const Divider(
                                height: 1,
                                color: blueCl,
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Accepted Documents are',
                                style: TextStyle(
                                  color: mainColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: semiBold,
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                'PAN Card',
                                style: TextStyle(
                                  color: blueCl,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: semiBold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 7),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = true;
                          isId = false;
                        });
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: 225,
                          decoration: BoxDecoration(
                              color: homeBgCl,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              const SizedBox(height: 7),
                              Image.asset(
                                cardId,
                                height: 60,
                                width: 65,
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Address Proof',
                                style: TextStyle(
                                  color: blueCl,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 7),
                              const Divider(
                                height: 1,
                                color: blueCl,
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'Accepted Documents are',
                                style: TextStyle(
                                  color: mainColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: semiBold,
                                  fontSize: 12,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  'Aadhar Card, Driving Licences ,Passport',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: blueCl,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: semiBold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        child: MyButton(
                          onPressed: () {
                            /* if (typeOfUser == -1) {
                  final snackBar = SnackBar(
                    backgroundColor: redCl,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.up,
                    content: const Text("Please Select Type"),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {*/
                            widget.onNext();
                            //  }
                          },
                          color: secondaryCl,
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: whiteColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 43,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: lightGry),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          const SizedBox(
                            height: 43,
                            child: VerticalDivider(
                              width: 1,
                              color: textLightGrey,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            isId ? 'PAN Card' : "Aadhaar Card",
                            style: const TextStyle(
                              color: mainColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: medium,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        galleryBottomSheet(
                            context, isId ? "Pan Card" : "Aadhaar Card");
                      },
                      child: Container(
                        height: 199,
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ]),
                        child: Stack(
                          children: [
                            isId == true
                                ? panFornt?.path == "" || panFornt?.path == null
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                          dashBorderImg,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Image.file(
                                        panFornt!,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      )
                                : aadharFornt?.path == "" ||
                                        aadharFornt?.path == null
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                          dashBorderImg,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Image.file(
                                        aadharFornt!,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      ),
                            isId == true
                                ? panFornt?.path == "" || panFornt?.path == null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Image.asset(
                                            uploadDoc,
                                            height: 80,
                                            width: 80,
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Text(
                                            isId
                                                ? 'Upload your PAN front image'
                                                : 'Upload your Aadhaar front image',
                                            style: const TextStyle(
                                              color: blueCl,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: medium,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                                : aadharFornt?.path == "" ||
                                        aadharFornt?.path == null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Image.asset(
                                            uploadDoc,
                                            height: 80,
                                            width: 80,
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Text(
                                            isId
                                                ? 'Upload your PAN front image'
                                                : 'Upload your Aadhaar front image',
                                            style: const TextStyle(
                                              color: blueCl,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: medium,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        galleryBottomSheet(context,
                            isId ? "Pan Card Back" : "Aadhaar Card Back");
                      },
                      child: Container(
                        height: 199,
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: whiteColor,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(0, 0, 0, 0.25))
                            ]),
                        child: Stack(
                          children: [
                            isId == true
                                ? panBack?.path == "" || panBack?.path == null
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                          dashBorderImg,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Image.file(
                                        panBack!,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      )
                                : adharBack?.path == "" ||
                                        adharBack?.path == null
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                          dashBorderImg,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : Image.file(
                                        adharBack!,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      ),
                            isId == true
                                ? panBack?.path == "" || panBack?.path == null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Image.asset(
                                            uploadDoc,
                                            height: 80,
                                            width: 80,
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Text(
                                            isId
                                                ? 'Upload your PAN back image'
                                                : 'Upload your Aadhaar back image',
                                            style: const TextStyle(
                                              color: blueCl,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: medium,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                                : adharBack?.path == "" ||
                                        adharBack?.path == null
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Image.asset(
                                            uploadDoc,
                                            height: 80,
                                            width: 80,
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Text(
                                            isId
                                                ? 'Upload your PAN back image'
                                                : 'Upload your Aadhaar back image',
                                            style: const TextStyle(
                                              color: blueCl,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: medium,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        child: MyButton(
                          onPressed: () {
                            setState(() {
                              isSelected = false;
                            });
                          },
                          color: secondaryCl,
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: whiteColor,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }

  void galleryBottomSheet(BuildContext ctx, String tittle) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery, ctx, tittle);
                  },
                  leading: const Icon(Icons.photo_album),
                  title: const Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera, ctx, tittle);
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: const Icon(Icons.close),
                  title: const Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void _getImage(ImageSource source, BuildContext context, String title) async {
      try {
        final XFile? pickedFile = await picker.pickImage(
          source: source,
        );
        setState(() {
          pickedImageFile = File(pickedFile!.path);
        });
        await cropImage(title);
      } catch (e) {
        Log.console("Error while picking image $e");
      }
  }

  Future<void> cropImage(String title) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Crop Image",
              toolbarColor: secondaryCl,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Crop Image",
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          if (isId == true) {
            if (title == "Pan Card") {
              panFornt = File(croppedFile.path);
            } else if (title == "Pan Card Back") {
              panBack = File(croppedFile.path);
            }
          } else {
            if (title == "Aadhaar Card") {
              aadharFornt = File(croppedFile.path);
            } else if (title == "Aadhaar Card Back") {
              adharBack = File(croppedFile.path);
            }
          }
        });
      }
    } catch (e) {
      Log.console("Crash error ${e.toString()}");
    }
  }

}
