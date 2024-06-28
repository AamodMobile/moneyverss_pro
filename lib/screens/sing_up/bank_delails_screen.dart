import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class BankDetails extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  const BankDetails({super.key, required this.onNext, required this.onPrevious});

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final formKey = GlobalKey<FormState>();
  String? selectedOccupation;
  List occupationList = [
    {"title": "Student", "value": "1"},
    {"title": "Self Employed", "value": "2"},
    {"title": "Govt Employed", "value": "3"},
    {"title": "Retired", "value": "4"},
    {"title": "Unemployed", "value": "5"},
    {"title": " Owner-Operator", "value": "6"},
  ];
  String accountType = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: homeBgCl,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  const Text(
                    "Bank Details",
                    style: TextStyle(color: blueCl, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontFamily: semiBold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 4,
                    width: 65,
                    decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Account Type",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 'saving',
                        groupValue: accountType,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              accountType = value;
                            }
                          });
                        },
                      ),
                      const Text(
                        'Saving',
                        style: TextStyle(
                          color: draKText,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                      Radio(
                        value: 'current',
                        groupValue: accountType,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              accountType = value;
                            }
                          });
                        },
                      ),
                      const Text(
                        'Current',
                        style: TextStyle(
                          color: draKText,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Bank Name",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonFormField<String?>(
                        icon: const Padding(
                          padding: EdgeInsets.all(2),
                          child: ImageIcon(
                            AssetImage(dropDownArrow),
                            size: 18,
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          hintText: "Select Bank",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8F8F8F),
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: redCl,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
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
                            fontSize: 12,
                          ),
                        ),
                        value: selectedOccupation,
                        isExpanded: true,
                        items: [
                          const DropdownMenuItem(
                              value: "",
                              child: Text(
                                "Select Bank",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: Color(0xFF8F8F8F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                          ...occupationList.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e["title"].toString(),
                              child: Text(e["title"],
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: mainColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedOccupation = value.toString();
                          });
                        }),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "City",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonFormField<String?>(
                        icon: const Padding(
                          padding: EdgeInsets.all(2),
                          child: ImageIcon(
                            AssetImage(dropDownArrow),
                            size: 18,
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          hintText: "Select City",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8F8F8F),
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          errorStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: redCl,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: borderNewCl,
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
                            fontSize: 12,
                          ),
                        ),
                        value: selectedOccupation,
                        isExpanded: true,
                        items: [
                          const DropdownMenuItem(
                              value: "",
                              child: Text(
                                "Select City",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: Color(0xFF8F8F8F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                          ...occupationList.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e["title"].toString(),
                              child: Text(e["title"],
                                  style: const TextStyle(
                                    fontFamily: regular,
                                    color: mainColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  )),
                            );
                          }).toList(),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedOccupation = value.toString();
                          });
                        }),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Branch Address",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextFormField(
                    hint: 'Enter Branch Address',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter Branch Address";
                      }
                      return null;
                    },
                    obscureText: false,
                    readOnly: false,
                    keyboardType: TextInputType.name,
                    border: borderNewCl,
                    fillColor: whiteColor,
                  ),
                  const SizedBox(height: 10),

                  const Text(
                    "Account Number",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextFormField(
                    hint: 'Enter Account Number',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter Account Number";
                      }
                      return null;
                    },
                    obscureText: false,
                    readOnly: false,
                    keyboardType: TextInputType.name,
                    border: borderNewCl,
                    fillColor: whiteColor,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Confirm Account Number",
                    style: TextStyle(
                      color: draKText,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextFormField(
                    hint: 'Enter Account Number',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter Account Number";
                      }
                      return null;
                    },
                    obscureText: false,
                    readOnly: false,
                    keyboardType: TextInputType.name,
                    border: borderNewCl,
                    fillColor: whiteColor,
                  ),

                  const SizedBox(height: 100)
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            color: homeBgCl,
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          widget.onNext();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF3CBFFF),
                              Color(0xFF0144DF),
                            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                        width: 200,
                        height: 46,
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: whiteColor,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}