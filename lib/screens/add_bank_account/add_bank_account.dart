import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({super.key});

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
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
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            alignment: Alignment.center,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 22,
                      width: 22,
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
                const SizedBox(width: 20),
                const Text(
                  "Add Bank Account",
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
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),

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
                  const SizedBox(height: 10),
                  const Text(
                    "IFSC Code",
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
                    hint: 'Enter IFSC Code',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter IFSC Code";
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
                    "Account Holder Name",
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
                    hint: 'Enter Account Holder Name',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Enter Account Holder Name";
                      }
                      return null;
                    },
                    obscureText: false,
                    readOnly: false,
                    keyboardType: TextInputType.name,
                    border: borderNewCl,
                    fillColor: whiteColor,
                  ),
                  const SizedBox(height:10),
                  const Text(
                    "Select Account Type",
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
                  const SizedBox(height: 100)
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width,
          height: 149,
          child: Column(
            children: [
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  children: [
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFB6D3FF)), // Border color
                        borderRadius: BorderRadius.circular(2), // Adjust the radius as needed
                      ),
                      child: Checkbox(
                        value: isCheck,
                        onChanged: (bool? newValue) {
                          if (newValue != null) {
                            setState(() {
                              isCheck = newValue;
                            });
                          }
                        },
                        checkColor: Colors.white,
                        activeColor: const Color(0xFF0066FF), // Color when clicked
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Remove extra padding
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                        child: InkWell(
                          onTap: () {

                          },
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                              text: "i Accept All Above bank information is correct.",
                              style: TextStyle(
                                color: secondary2Cl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                              ),
                            ),
                          ),)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    FocusScope.of(context).requestFocus(FocusNode());

                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(colors: [
                        Color(0xFF3CBFFF),
                        Color(0xFF0144DF),
                      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                  width: MediaQuery.of(context).size.width,
                  height: 51,
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
            ],
          ),
        ),
      ),
    );
  }
}
