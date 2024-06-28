import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/service/api_url.dart';
import 'package:fiinzy_pro/widget/upper_case_text_formatter.dart';
import 'package:flutter/cupertino.dart';

import '../../widget/text_filed_widget.dart';

class UploadDocument extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final UserController controller;

  const UploadDocument({
    super.key,
    required this.onNext,
    required this.onPrevious,
    required this.controller,
  });

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<UserController>(),
      initState: (state) {
        Get.find<UserController>();
      },
      builder: (contextCtr) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: homeBgCl,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
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
                            Spacer(),
                            Visibility(
                              visible: contextCtr.panCard.value.path != "",
                              child: InkWell(
                                onTap: (){

                                },
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    child: Image.asset(
                                      height: 20, deleteIcNew, fit: BoxFit.contain,)),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE9EEFF),
                                        border: Border.all(color: borderNewCl),
                                        borderRadius: BorderRadius.circular(9)),
                                    child: contextCtr.user.value.panCardFrontImage != ""
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: CachedNetworkImage(
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                bannerImg,
                                                fit: BoxFit.fill,
                                              ),
                                              fit: BoxFit.fill,
                                              height: 120,
                                              imageUrl:  ApiUrl.imageUrl+contextCtr
                                                  .user.value.panCardFrontImage
                                                  .toString(),
                                              placeholder: (a, b) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          )
                                        : contextCtr.panCard.value.path != ""
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                child: Image.file(
                                                  File(contextCtr
                                                      .panCard.value.path),
                                                  height: 120,
                                                  fit: BoxFit.fill,
                                                ))
                                            : Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    galleryIc,
                                                    height: 15,
                                                    width: 18,
                                                  ),
                                                  const SizedBox(width: 15),
                                                  const Text(
                                                    "Pan Card Upload",
                                                    style: TextStyle(
                                                      color: draKText,
                                                      fontFamily: medium,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
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
                              decoration: BoxDecoration(
                                  color: const Color(0xFFE9EEFF),
                                  borderRadius: BorderRadius.circular(9)),
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
                                onTap: (){

                                },
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 8),
                                    child: Image.asset(
                                        height: 20, deleteIcNew, fit: BoxFit.contain,)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          hint: 'Enter Aadhar Number',
                          controller: widget.controller.aadharNo,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Enter Aadhar Number";
                            }
                            return null;
                          },
                          obscureText: false,
                          readOnly: false,
                          keyboardType: TextInputType.name,
                          border: borderNewCl,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE9EEFF),
                                      border: Border.all(color: borderNewCl),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: contextCtr.user.value.addressProofFrontImage !=
                                            ""
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: CachedNetworkImage(
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                bannerImg,
                                                fit: BoxFit.fill,
                                              ),
                                              fit: BoxFit.fill,
                                              height: 120,
                                              imageUrl:  ApiUrl.imageUrl+contextCtr
                                                  .user.value.addressProofFrontImage
                                                  .toString(),
                                              placeholder: (a, b) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          )
                                        : contextCtr.aadhaarFrontImg.value
                                                    .path !=
                                                ""
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                child: Image.file(
                                                  File(contextCtr
                                                      .aadhaarFrontImg
                                                      .value
                                                      .path),
                                                  height: 120,
                                                  fit: BoxFit.fill,
                                                ))
                                            : Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
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
                                  contextCtr.pickImage(
                                      context, "aadhaar_card_back");
                                },
                                child: Obx(
                                  () => Container(
                                    height: 120,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE9EEFF),
                                      border: Border.all(color: borderNewCl),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: contextCtr
                                                .user.value.addressProofBackImage !=
                                            ""
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            child: CachedNetworkImage(
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                bannerImg,
                                                fit: BoxFit.fill,
                                              ),
                                              fit: BoxFit.fill,
                                              height: 120,
                                              imageUrl: ApiUrl.imageUrl+contextCtr
                                                  .user.value.addressProofBackImage
                                                  .toString(),
                                              placeholder: (a, b) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          )
                                        : contextCtr.aadhaarBackImg.value
                                                    .path !=
                                                ""
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                                child: Image.file(
                                                  File(contextCtr.aadhaarBackImg
                                                      .value.path),
                                                  height: 120,
                                                  fit: BoxFit.fill,
                                                ))
                                            : Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FontStyle.normal,
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
                  const SizedBox(height: 100)
                ],
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
                          var result = await widget.controller.updateProfile();
                          if (result == true) {
                            widget.onNext();
                          } else {
                            errorToast("something want wrong");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF3CBFFF),
                                    Color(0xFF0144DF),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
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
