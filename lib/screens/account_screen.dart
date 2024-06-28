import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/screens/all_blogs_screen.dart';
import 'package:fiinzy_pro/screens/cms_screen.dart';
import 'package:fiinzy_pro/screens/contact_screen.dart';
import 'package:fiinzy_pro/screens/faqs_screen.dart';
import 'package:fiinzy_pro/screens/my_application_screen.dart';
import 'package:fiinzy_pro/screens/my_earning_screen.dart';
import 'package:fiinzy_pro/screens/payment_request/payment_request_screen.dart';
import 'package:fiinzy_pro/screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/get_device_type.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        initState: (state) {
          Get.find<UserController>().userProfileGet();
          Get.find<UserController>().socialLinksGet();
        },
        builder: (contextCtr) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: homeBgCl,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Visibility(
                    visible: false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 17),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.12),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Earnings",
                                    style: TextStyle(
                                      color: primaryCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "₹ 1000.00",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: GetDeviceType().getDeviceType(context)? 20 : 16,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    arrowForwordIC,
                                    height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                    width: GetDeviceType().getDeviceType(context)? 14 : 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: const BoxDecoration(color: Color(0xFFF2F4FA)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  clockArrowHalfIc,
                                  height: GetDeviceType().getDeviceType(context)? 17 : 12,
                                  width: GetDeviceType().getDeviceType(context)? 17 : 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Last Update at 10:50 am on 02 apr. 2024",
                                  style: TextStyle(
                                    color: primaryCl,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: primaryClNew, width: 1),
                                      color: Colors.white,
                                    ),
                                    width: GetDeviceType().getDeviceType(context)? 180 : 154,
                                    height: GetDeviceType().getDeviceType(context)? 40 : 33,
                                    child: Center(
                                      child: Text(
                                        'Withdrawal',
                                        style: TextStyle(
                                          color: primaryClNew,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: medium,
                                          fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF3CBFFF),
                                          Color(0xFF0144DF),
                                        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                    width: GetDeviceType().getDeviceType(context)? 180 : 154,
                                    height: GetDeviceType().getDeviceType(context)? 40 : 33,
                                    child: Center(
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: medium,
                                          fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      Get.to(() => const ProfileScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 17),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.12),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: GetDeviceType().getDeviceType(context)? 40 : 30,
                                width: GetDeviceType().getDeviceType(context)? 40 : 30,
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: userController.user.value.image != ""
                                      ? CachedNetworkImage(
                                          errorWidget: (context, url, error) => Image.asset(
                                            defult,
                                            fit: BoxFit.fill,
                                          ),
                                          fit: BoxFit.fill,
                                          height: GetDeviceType().getDeviceType(context)? 40 : 30,
                                          width: GetDeviceType().getDeviceType(context)? 40 : 30,
                                          imageUrl: userController.user.value.image.toString(),
                                          placeholder: (a, b) => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : Image.asset(
                                          defult,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi,${contextCtr.user.value.name ?? ""}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                                    ),
                                  ),
                                   Text(
                                    "MV${contextCtr.user.value.id}",
                                    style: TextStyle(
                                      color: primaryCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: GetDeviceType().getDeviceType(context)? 14 :10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: Colors.black.withOpacity(0.25),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    arrowForwordIC,
                                    height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                    width: GetDeviceType().getDeviceType(context)? 14 : 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                       /*   Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1F5FF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 6),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 12 : 6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "80% complete",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                        ),
                                      ),
                                      Text(
                                        "Add Details",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryClNew,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                LinearProgressIndicator(
                                  value: 80 / 100,
                                  valueColor: AlwaysStoppedAnimation<Color>(primaryClNew),
                                  backgroundColor: primaryCl,
                                  minHeight: GetDeviceType().getDeviceType(context)? 4 : 2,
                                ),
                              ],
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 17),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DASH",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF1F5FF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4),
                                ),
                              ),
                              child: Text(
                                "Report and Statements",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryClNew,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Modern Back Office For Partners",
                          style: TextStyle(
                            color: primaryCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: (){
                            Get.to(()=>const MyApplicationScreen());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                criclePaper,
                                height: GetDeviceType().getDeviceType(context)? 35 :28,
                                width: GetDeviceType().getDeviceType(context)? 35 : 28,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "My Application",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        InkWell(
                          onTap: (){
                            Get.to(()=>const MyEarningScreen());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                cricleMoneyIc,
                                height: GetDeviceType().getDeviceType(context)? 35 :28,
                                width: GetDeviceType().getDeviceType(context)? 35 :28,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "My Earning",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        //const SizedBox(height: 15),
                        Visibility(
                          visible: false,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const PaymentRequestScreen());
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  paymentWithdrawIc,
                                  height: GetDeviceType().getDeviceType(context)? 35 :28,
                                  width: GetDeviceType().getDeviceType(context)? 35 :28,
                                ),
                                const SizedBox(width: 9),
                                Text(
                                  "Payment Request",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  arrowForwordIC,
                                  height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                  width: GetDeviceType().getDeviceType(context)? 14 : 10,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 17),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Help And Support",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                          ),
                        ),
                        Text(
                          "How Can I Help You",
                          style: TextStyle(
                            color: primaryCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ContactUsScreen());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                contactUsIc,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Contact Us",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => const FaqsScreen());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                fqIc,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Faq",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => const AllBolgScreen());
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                blogsWIc,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Blogs",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            shareApp();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                shareNewIc,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Share App",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            openStore();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                rateNewIC,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Rate App",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => const CMSScreen(tittle: "About Us"));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                paperNewIC,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "About Us",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => const CMSScreen(tittle: "Term and conditions"));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                paperNewIC,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Term And Conditions",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromRGBO(85, 153, 255, 0.43),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Get.to(() => const CMSScreen(tittle: "Privacy policy"));
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                paperNewIC,
                                height: GetDeviceType().getDeviceType(context)? 25 : 20,
                                width: GetDeviceType().getDeviceType(context)? 25 : 20,
                              ),
                              const SizedBox(width: 9),
                              Text(
                                "Privacy Policy",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                arrowForwordIC,
                                height: GetDeviceType().getDeviceType(context)? 14 : 10,
                                width: GetDeviceType().getDeviceType(context)? 14 : 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Visibility(
                    visible: false,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.12),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Join Our Community",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: GetDeviceType().getDeviceType(context)? 18 : 14,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (contextCtr.facebook != "") {
                                    launchSocialMediaLink(contextCtr.facebook);
                                  } else {
                                    errorToast("No Link Found");
                                  }
                                },
                                child: Image.asset(
                                  facebookIc,
                                  height: GetDeviceType().getDeviceType(context)? 36 : 30,
                                  width: GetDeviceType().getDeviceType(context)? 36 : 30,
                                ),
                              ),
                              const SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {
                                  if (contextCtr.whatsapp != "") {
                                    launchSocialMediaLink(contextCtr.whatsapp);
                                  } else {
                                    errorToast("No Link Found");
                                  }
                                },
                                child: Image.asset(
                                  whatsappIc,
                                  height: GetDeviceType().getDeviceType(context)? 36 : 30,
                                  width: GetDeviceType().getDeviceType(context)? 36 : 30,
                                ),
                              ),
                              const SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {
                                  if (contextCtr.youtube != "") {
                                    launchSocialMediaLink(contextCtr.youtube);
                                  } else {
                                    errorToast("No Link Found");
                                  }
                                },
                                child: Image.asset(
                                  youtubeIc,
                                  height: GetDeviceType().getDeviceType(context)? 36 : 30,
                                  width: GetDeviceType().getDeviceType(context)? 36 : 30,
                                ),
                              ),
                              const SizedBox(width: 30),
                              GestureDetector(
                                onTap: () {
                                  if (contextCtr.instagram != "") {
                                    launchSocialMediaLink(contextCtr.instagram);
                                  } else {
                                    errorToast("No Link Found");
                                  }
                                },
                                child: Image.asset(
                                  instagramIc,
                                  height: GetDeviceType().getDeviceType(context)? 36 : 30,
                                  width: GetDeviceType().getDeviceType(context)? 36 : 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        logoutDialog();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            logoutNewIc,
                            height: GetDeviceType().getDeviceType(context)? 25 : 20,
                            width: GetDeviceType().getDeviceType(context)? 25 : 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Logout",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: semiBold,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black.withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        deleteAccount();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            deleteIcNew,
                            height: GetDeviceType().getDeviceType(context)? 25 : 20,
                            width: GetDeviceType().getDeviceType(context)? 25 : 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Delete Account",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: semiBold,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ));
        });
  }

  void logoutDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      offIc,
                      height: 158,
                      width: 158,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Are You Sure you want To Logout ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(278, 47),
                        backgroundColor: primaryClNew,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Yes, Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () async {
                        userController.logout();
                      },
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const SizedBox(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: draKText,
                            fontSize: 14,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> openStore() async {
    String packageName = 'com.fiinzy';
    String appStoreUrl = 'https://apps.apple.com/app/$packageName';
    String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    if (await canLaunchUrl(Uri.parse(appStoreUrl)) && !Platform.isAndroid) {
      await launchUrl(Uri.parse(appStoreUrl));
    } else if (await canLaunchUrl(Uri.parse(playStoreUrl)) && Platform.isAndroid) {
      await launchUrl(Uri.parse(playStoreUrl));
    } else {
      throw 'Could not launch store';
    }
  }

  Future<void> shareApp() async {
    String packageName = 'com.fiinzy';
    String appStoreUrl = 'https://apps.apple.com/app/$packageName';
    String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
    if (!Platform.isAndroid) {
      await Share.share('Fiinzy  App Download From App Store:-'
          '\n $appStoreUrl"');
    } else if (Platform.isAndroid) {
      await Share.share('Fiinzy  App Download From Play Store:-'
          '\n $playStoreUrl"');
    } else {
      throw 'Could not launch store';
    }
  }

  void deleteAccount() {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      deleteIcNew,
                      height: 158,
                      width: 158,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Are You Sure you want To Delete Account ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(278, 47),
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Yes, Delete",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onPressed: () {
                        userController.deleteAccountApi();
                      },
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const SizedBox(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: draKText,
                            fontSize: 14,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void launchSocialMediaLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
