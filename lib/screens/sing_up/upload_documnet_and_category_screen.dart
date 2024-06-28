import 'dart:io';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';
import 'package:fiinzy_pro/widget/upper_case_text_formatter.dart';

class UploadDocumentAndCategoryScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final UserController controller;

  const UploadDocumentAndCategoryScreen({super.key, required this.onNext, required this.onPrevious, required this.controller});

  @override
  State<UploadDocumentAndCategoryScreen> createState() => _UploadDocumentAndCategoryScreenState();
}

class _UploadDocumentAndCategoryScreenState extends State<UploadDocumentAndCategoryScreen> {
  final formKey = GlobalKey<FormState>();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<UserController>(),
      initState: (state) {
        Get.find<UserController>().partnerCategoryListGet();
      },
      builder: (contextCtr) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: homeBgCl,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Upload Document",
                      style: TextStyle(
                        color: blueCl,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 4,
                      width: 65,
                      decoration: BoxDecoration(
                        color: primaryClNew,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Identity Proof",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderNewCl),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 67,
                                height: 53,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE9EEFF),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Image.asset(panDocIc),
                              ),
                              const SizedBox(width: 11),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "PAN Card",
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                  /* Text(
                                    "Accepted Documents are",
                                    style: TextStyle(
                                      color: primaryCl,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),*/
                                ],
                              ),
                              const Spacer(),
                              Visibility(
                                visible: contextCtr.panCard.value.path != "",
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                      child: Image.asset(
                                        height: 20,
                                        deleteIcNew,
                                        fit: BoxFit.contain,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          MyTextFormField(
                            hint: 'Enter Pan Number',
                            controller: widget.controller.panNo,
                            validator: (v) {
                              return contextCtr.validatePAN(v!) ? null : "Enter Valid Pan Number";
                            },
                            obscureText: false,
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
                            readOnly: false,
                            keyboardType: TextInputType.name,
                            border: borderNewCl,
                            fillColor: whiteColor,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Material(
                                child: Image.asset(
                                  panDocIc,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    contextCtr.pickImage(context, "pan_card");
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: 120,
                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(color: const Color(0xFFE9EEFF), border: Border.all(color: borderNewCl), borderRadius: BorderRadius.circular(9)),
                                      child: contextCtr.panCard.value.path != ""
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(9),
                                              child: Image.file(
                                                File(contextCtr.panCard.value.path),
                                                height: 120,
                                                fit: BoxFit.fill,
                                              ))
                                          : Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  galleryIc,
                                                  height: 15,
                                                  width: 18,
                                                ),
                                                const SizedBox(width: 15),
                                                const Text(
                                                  "Pan Card Image",
                                                  style: TextStyle(
                                                    color: draKText,
                                                    fontFamily: medium,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Address Proof",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderNewCl),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 67,
                                height: 53,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: const Color(0xFFE9EEFF), borderRadius: BorderRadius.circular(9)),
                                child: Image.asset(aadharDocIc),
                              ),
                              const SizedBox(width: 11),
                              const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      "Aadhaar Card",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: draKText,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                    /*Text(
                                      "Accepted Documents are",
                                      style: TextStyle(
                                        color: primaryCl,
                                        fontFamily: regular,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: contextCtr.panCard.value.path != "",
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                      child: Image.asset(
                                        height: 20,
                                        deleteIcNew,
                                        fit: BoxFit.contain,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          MyTextFormField(
                            hint: 'Enter Aadhaar Number',
                            controller: widget.controller.aadharNo,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly, WhiteSpacerAfter4()],
                            validator: (v) {
                              return contextCtr.validateAadhaar(v!) ? null : "Enter Valid Aadhaar Number";
                            },
                            obscureText: false,
                            readOnly: false,
                            keyboardType: TextInputType.number,
                            border: borderNewCl,
                            maxLength: 14,
                            counterText: "",
                            fillColor: whiteColor,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Material(
                                child: Image.asset(
                                  aadharDocIc,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    contextCtr.pickImage(context, "aadhaar_card");
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: 120,
                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE9EEFF),
                                        border: Border.all(color: borderNewCl),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: contextCtr.aadhaarFrontImg.value.path != ""
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(9),
                                              child: Image.file(
                                                File(contextCtr.aadhaarFrontImg.value.path),
                                                height: 120,
                                                fit: BoxFit.fill,
                                              ))
                                          : Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  galleryIc,
                                                  height: 15,
                                                  width: 18,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Aadhaar Front Image ",
                                                  style: TextStyle(
                                                    color: draKText,
                                                    fontFamily: medium,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    contextCtr.pickImage(context, "aadhaar_card_back");
                                  },
                                  child: Obx(
                                    () => Container(
                                      height: 120,
                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE9EEFF),
                                        border: Border.all(color: borderNewCl),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      child: contextCtr.aadhaarBackImg.value.path != ""
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(9),
                                              child: Image.file(
                                                File(contextCtr.aadhaarBackImg.value.path),
                                                height: 120,
                                                fit: BoxFit.fill,
                                              ))
                                          : Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  galleryIc,
                                                  height: 15,
                                                  width: 18,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "Aadhaar Back Image ",
                                                  style: TextStyle(
                                                    color: draKText,
                                                    fontFamily: medium,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Become A Partner",
                      style: TextStyle(
                        color: blueCl,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 4,
                      width: 65,
                      decoration: BoxDecoration(
                        color: primaryClNew,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: borderNewCl),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Partner Category",
                            style: TextStyle(
                              color: draKText,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MediaQuery.removePadding(
                            context: context,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: contextCtr.partnerCategoryList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Obx(
                                      () => Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString() ? homeBgCl : white,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: borderNewCl)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString()) {
                                                      contextCtr.partnerCategoryId.value = "0";
                                                    } else {
                                                      contextCtr.partnerCategoryId.value = contextCtr.partnerCategoryList[index].id.toString();
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 24,
                                                    width: 24,
                                                    decoration: BoxDecoration(
                                                      color: contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString() ? greenCl : white,
                                                      border: Border.all(color: borderNewCl),
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    child: contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString()
                                                        ? const Center(
                                                            child: Icon(
                                                              Icons.done,
                                                              size: 14,
                                                              color: Colors.white,
                                                            ),
                                                          )
                                                        : const Opacity(
                                                            opacity: 0.0,
                                                            child: Icon(
                                                              Icons.account_circle,
                                                              size: 14,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  contextCtr.partnerCategoryList[index].name.toString(),
                                                  style: TextStyle(
                                                    color: draKText,
                                                    fontFamily: contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString() ? semiBold : medium,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString() ? 16 : 14,
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if(selectedIndex==index){
                                                        selectedIndex=-1;
                                                      }else{
                                                        selectedIndex = index;
                                                      }

                                                    });
                                                  },
                                                  child: Image.asset(
                                                    ((contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString())||( index == selectedIndex)) ? riArrowUp : riArrowDown,
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if ((contextCtr.partnerCategoryId.value == contextCtr.partnerCategoryList[index].id.toString()) ||( index == selectedIndex))
                                              Column(
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    contextCtr.partnerCategoryList[index].description.toString(),
                                                    style: const TextStyle(
                                                      color: draKText,
                                                      fontFamily: medium,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12)
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
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
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (contextCtr.panCard.value.path == "") {
                              errorToast("Add Pan card Image ");
                            } else if (contextCtr.aadhaarFrontImg.value.path == "") {
                              errorToast("Add Aadhaar Front Image ");
                            } else if (contextCtr.aadhaarBackImg.value.path == "") {
                              errorToast("Add Aadhaar Back Image");
                            } else if (contextCtr.partnerCategoryId.value == "") {
                              errorToast("Select Partner Category");
                            } else {
                              var result = await widget.controller.register();
                              if (result == true) {
                                widget.onNext();
                              } else {
                                errorToast("something want wrong");
                              }
                            }
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
          ),
        );
      },
    );
  }
}

class WhiteSpacerAfter4 extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
