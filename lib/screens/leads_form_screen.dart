import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/widget/my_button.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class LeadsFormScreen extends StatefulWidget {
  const LeadsFormScreen({super.key});

  @override
  State<LeadsFormScreen> createState() => _LeadsFormScreenState();
}

class _LeadsFormScreenState extends State<LeadsFormScreen> {
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
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: homeBgCl,
          appBar: AppBar(
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
                  "Lead Form",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: medium,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "LEAD CREATION FORM",
                    style: TextStyle(
                      color: blueCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Full Name",
                    style: TextStyle(
                        color: textColorSec,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  MyTextFormField(
                    hint: 'Enter Full Name',
                    obscureText: false,
                    readOnly: false,
                    border: primaryCl,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Mobile Number",
                    style: TextStyle(
                        color: textColorSec,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  MyTextFormField(
                    hint: 'Enter Mobile Number',
                    obscureText: false,
                    readOnly: false,
                    border: primaryCl,
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
                        fontSize: 14),
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
                              fontSize: 14),
                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: redCl,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )),
                          ...occupationList.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e["title"].toString(),
                              child: Text(e["title"],
                                  style: const TextStyle(
                                      fontFamily: regular,
                                      color: mainColor,
                                      fontSize: 14,
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
                        fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  const MyTextFormField(
                    hint: 'Enter PAN',
                    obscureText: false,
                    readOnly: false,
                    border: primaryCl,
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
                        fontSize: 14),
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
                              fontSize: 14),
                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: redCl,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )),
                          ...genderList.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e["title"].toString(),
                              child: Text(e["title"],
                                  style: const TextStyle(
                                      fontFamily: regular,
                                      color: mainColor,
                                      fontSize: 14,
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
                        fontSize: 14),
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
                              fontSize: 14),
                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: redCl,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryCl,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )),
                          ...employedList.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e["title"].toString(),
                              child: Text(e["title"],
                                  style: const TextStyle(
                                      fontFamily: regular,
                                      color: mainColor,
                                      fontSize: 14,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Loan Amount Required",
                    style: TextStyle(
                        color: textColorSec,
                        fontFamily: medium,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  const MyTextFormField(
                    hint: 'Enter Loan Amount Required',
                    obscureText: false,
                    readOnly: false,
                    border: primaryCl,
                    fillColor: whiteColor,
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "I confirm that Customer ha been informed about the Credit Bureau Disclaimer.",
                      style: TextStyle(
                          color: textColorSec,
                          fontFamily: medium,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12),
                    ),
                    value: isCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        isCheck = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  const SizedBox(height: 7),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(15, 67, 205, 0.1)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Inform Customer !!",
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "We keep customer’s details safe and not share with third parties without their permissions",
                          style: TextStyle(
                              color: textColorSec,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: MyButton(
                        onPressed: () {},
                        color: secondaryCl,
                        child: const Text(
                          'Submit Lead',
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
          )),
    );
  }
}
