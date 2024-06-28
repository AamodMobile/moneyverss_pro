import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/dashboard_controller.dart';
import 'package:fiinzy_pro/screens/all_blogs_screen.dart';
import 'package:fiinzy_pro/screens/blog_details_screen.dart';
import 'package:fiinzy_pro/screens/training_material_screen.dart';
import 'package:fiinzy_pro/screens/video_details_screen.dart';
import 'package:fiinzy_pro/service/api_url.dart';
import 'package:fiinzy_pro/widget/item_loan_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/get_device_type.dart';
import 'my_earning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController carouselController = CarouselController();
  int selectedIndex = 0;
  int ind = 0;
  var imageList = [bannerImg, bannerImg, bannerImg];
  static const String calculator = calculatorIc;
  static const String track = trackIc;
  static const String locker = safeIc;
  var essentials = [
    {
      'title': 'Calculator',
      'image': calculator,
    },
    {
      'title': 'Track Application',
      'image': track,
    },
    {
      'title': 'DG Locker',
      'image': locker,
    },
  ];
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<DashboardController>(),
      initState: (state) {
        Get.find<DashboardController>().dashboard();
      },
      builder: (contextCtrl) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: homeBgCl,
            body: Builder(
              builder: (context) {
                if (dashboardController.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                      backgroundColor: primaryCl,
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 14),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: borderNewCl)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height:
                                        GetDeviceType().getDeviceType(context)
                                            ? 18
                                            : 14,
                                    width:
                                        GetDeviceType().getDeviceType(context)
                                            ? 14
                                            : 10,
                                    color: primaryClNew,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Loan products".capitalize!,
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize:
                                          GetDeviceType().getDeviceType(context)
                                              ? 16
                                              : 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: contextCtrl.loanTypeList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio:
                                        GetDeviceType().getDeviceType(context)
                                            ? 1 / 1.1
                                            : 1 / 1.75,
                                    crossAxisSpacing: 45,
                                    crossAxisCount: 3,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ItemLoanType(
                                      loanTypeList:
                                          contextCtrl.loanTypeList[index],
                                      lastLoanType:
                                          contextCtrl.loanMainTypeList[
                                              contextCtrl.loanTypeList.length],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: GetDeviceType().getDeviceType(context)
                                ? 20
                                : 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CarouselSlider(
                              carouselController: carouselController,
                              options: CarouselOptions(
                                aspectRatio: 16 / 4.7,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                padEnds: false,
                                pauseAutoPlayOnTouch: true,
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                              ),
                              items: List.generate(
                                contextCtrl.bannerList.length,
                                (ind) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 160,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 1),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            color:
                                                Colors.grey.withOpacity(0.05))
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child:
                                          contextCtrl.bannerList[ind].image !=
                                                  ""
                                              ? CachedNetworkImage(
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    bannerImg,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  fit: BoxFit.fill,
                                                  height: 160,
                                                  imageUrl: contextCtrl
                                                      .bannerList[ind].image
                                                      .toString(),
                                                  placeholder: (a, b) =>
                                                      const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                )
                                              : Image.asset(
                                                  imageList[ind],
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  fit: BoxFit.fill,
                                                ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: GetDeviceType().getDeviceType(context)
                                ? 12
                                : 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contextCtrl.bannerList.length,
                            (ind) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              padding: const EdgeInsets.all(5),
                              height: 6,
                              width: ind == selectedIndex ? 11 : 6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ind == selectedIndex
                                      ? primaryClNew
                                      : borderNewCl),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: GetDeviceType().getDeviceType(context)
                                ? 24
                                : 14),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: borderNewCl),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Leads Summary",
                                  style: TextStyle(
                                    color: draKText,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize:
                                        GetDeviceType().getDeviceType(context)
                                            ? 18
                                            : 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: dividerClNew),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "2500",
                                                    style: TextStyle(
                                                      color: primaryClNew,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                              .getDeviceType(
                                                                  context)
                                                          ? 22
                                                          : 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "Total Leads",
                                                    style: TextStyle(
                                                      color: secondaryCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 18
                                                          : 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: primaryClNew,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  icMail,
                                                  color: Colors.white,
                                                  height: 18,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: dividerClNew),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "2500",
                                                    style: TextStyle(
                                                      color: greenCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 22
                                                          : 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "Fresh/New",
                                                    style: TextStyle(
                                                      color: secondaryCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 18
                                                          : 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: greenCl,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  icMail,
                                                  color: Colors.white,
                                                  height: 18,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                               /* SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border:
                                          Border.all(color: dividerClNew),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "2500",
                                                    style: TextStyle(
                                                      color: purpalCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 22
                                                          : 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "Follow Up-Today",
                                                    style: TextStyle(
                                                      color: secondaryCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 18
                                                          : 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: purpalCl,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(10),
                                                    bottomLeft:
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  icMail,
                                                  color: Colors.white,
                                                  height: 18,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border:
                                          Border.all(color: dividerClNew),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "2500",
                                                    style: TextStyle(
                                                      color: lightDrakPink,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 22
                                                          : 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "Interested Leads",
                                                    style: TextStyle(
                                                      color: secondaryCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 18
                                                          : 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: lightDrakPink,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(10),
                                                    bottomLeft:
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  icMail,
                                                  color: Colors.white,
                                                  height: 18,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )*/
                              ],
                            )),
                        SizedBox(
                            height: GetDeviceType().getDeviceType(context)
                                ? 24
                                : 14),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: borderNewCl),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Leads Status IN MV",
                                  style: TextStyle(
                                    color: draKText,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize:
                                    GetDeviceType().getDeviceType(context)
                                        ? 18
                                        : 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border:
                                          Border.all(color: dividerClNew),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "2500",
                                                    style: TextStyle(
                                                      color: kAmber,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 22
                                                          : 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "Pending",
                                                    style: TextStyle(
                                                      color: secondaryCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 18
                                                          : 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: kAmber,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(10),
                                                    bottomLeft:
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  icPendingLeads,
                                                  color: Colors.white,
                                                  height: 18,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border:
                                          Border.all(color: dividerClNew),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "2500",
                                                    style: TextStyle(
                                                      color: lightDarkGreenSec,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 22
                                                          : 18,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    "Assigned",
                                                    style: TextStyle(
                                                      color: secondaryCl,
                                                      fontFamily: semiBold,
                                                      fontStyle:
                                                      FontStyle.normal,
                                                      fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                          context)
                                                          ? 18
                                                          : 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding:
                                                const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: lightDarkGreenSec,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(10),
                                                    bottomLeft:
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  icAssignedLeads,
                                                  color: Colors.white,
                                                  height: 18,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                            height: GetDeviceType().getDeviceType(context)
                                ? 18
                                : 8),
                        Visibility(
                          visible: false,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 14,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(63, 90, 131, 0.31),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "My Earnings".capitalize!,
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: GetDeviceType()
                                                  .getDeviceType(context)
                                              ? 18
                                              : 14,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 9, vertical: 4),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            topLeft: Radius.circular(15),
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              primaryClNew,
                                              Color(0xFFA200BC),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Current Month",
                                            style: TextStyle(
                                              color: whiteColor,
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? 14
                                                  : 10,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: GetDeviceType().getDeviceType(context)
                                        ? 20
                                        : 10),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 19),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 22),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF1F5FF),
                                        borderRadius: BorderRadius.circular(6),
                                        border: const Border(
                                          bottom: BorderSide(
                                            color: primaryClNew,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "₹ ${contextCtrl.myEarning.value}",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType()
                                                    .getDeviceType(context)
                                                ? 20
                                                : 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 14,
                                      child: Container(
                                        height:
                                            GetDeviceType().getDeviceType(context)
                                                ? 30
                                                : 20,
                                        width:
                                            GetDeviceType().getDeviceType(context)
                                                ? 30
                                                : 20,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              color:
                                                  Colors.black.withOpacity(0.25),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            arrowBackIc,
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      right: 14,
                                      child: Container(
                                        height:
                                            GetDeviceType().getDeviceType(context)
                                                ? 30
                                                : 20,
                                        width:
                                            GetDeviceType().getDeviceType(context)
                                                ? 30
                                                : 20,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              color:
                                                  Colors.black.withOpacity(0.25),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            arrowForwordIC,
                                            height: 15,
                                            width: 15,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: GetDeviceType().getDeviceType(context)
                                        ? 23
                                        : 13),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const MyEarningScreen());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF189DFF),
                                              Color(0xFF0070C1),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)),
                                    width: MediaQuery.of(context).size.width,
                                    height: GetDeviceType().getDeviceType(context)
                                        ? 50
                                        : 40,
                                    child: Center(
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: GetDeviceType()
                                                  .getDeviceType(context)
                                              ? 20
                                              : 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: GetDeviceType().getDeviceType(context)
                                        ? 14
                                        : 4),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: GetDeviceType().getDeviceType(context)
                                ? 22
                                : 12),
                        /*  Text(
                    "Essentials".capitalize!,
                    style: const TextStyle(
                      color: draKText,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 135,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: essentials.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (essentials[index]["title"] == "Calculator") {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AllCalculatorScreen()));
                            } else if (essentials[index]["title"] == "DG Locker") {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const DigitalLocker()));
                            } else if (essentials[index]["title"] == "Track Application") {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApplicationScreen()));
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 5, top: 2, bottom: 2,left: 1.5),
                            padding: const EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * 0.29,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0xFFB5D1EA)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  offset: const Offset(0, 2),
                                  blurRadius: 1,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  essentials[index]["image"].toString(),
                                  fit: BoxFit.fill,
                                  height: 53,
                                  width: 53,
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    essentials[index]["title"]!,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: textHeading,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Training Videos",
                              style: TextStyle(
                                color: draKText,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)
                                    ? 18
                                    : 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const TrainingMaterialScreen());
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  color: primaryClNew,
                                  fontSize:
                                      GetDeviceType().getDeviceType(context)
                                          ? 16
                                          : 12,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 11),
                        SizedBox(
                          height: GetDeviceType().getDeviceType(context)
                              ? 220
                              : 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: contextCtrl.trainingVideoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => VideoDetailsScreen(
                                        videoData: contextCtrl
                                            .trainingVideoList[index],
                                      ));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height:
                                          GetDeviceType().getDeviceType(context)
                                              ? 220
                                              : 120,
                                      margin: const EdgeInsets.only(right: 6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          ApiUrl.imageUrl +
                                              contextCtrl
                                                  .trainingVideoList[index]
                                                  .videoThumbnail
                                                  .toString(),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        right: 0,
                                        left: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: Center(
                                          child: Image.asset(
                                            playIcNew,
                                            height: 34,
                                            width: 34,
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Blogs",
                              style: TextStyle(
                                color: draKText,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)
                                    ? 18
                                    : 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const AllBolgScreen());
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  color: primaryClNew,
                                  fontSize:
                                      GetDeviceType().getDeviceType(context)
                                          ? 16
                                          : 12,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 11),
                        Container(
                          /*height: GetDeviceType().getDeviceType(context)
                              ? 350
                              : 220,*/
                          height: (MediaQuery.of(context).size.width * 0.38)+(GetDeviceType().getDeviceType(context)
                              ? 95
                              : 70),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: contextCtrl.blogsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              String createdAtString = contextCtrl
                                  .blogsList[index].createdAt
                                  .toString();
                              DateTime createdAt =
                                  DateTime.parse(createdAtString);
                              String formattedDate =
                                  "${createdAt.day}-${createdAt.month}-${createdAt.year}";
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => BlogDetailsScreen(
                                        id: contextCtrl.blogsList[index].id
                                            .toString(),
                                        tittle: contextCtrl
                                            .blogsList[index].title
                                            .toString()));
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? 20
                                                  : 10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            /*height: GetDeviceType()
                                                    .getDeviceType(context)
                                                ? 240
                                                : 140,*/
                                            height : MediaQuery.of(context).size.width * 0.38,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        GetDeviceType()
                                                                .getDeviceType(
                                                                    context)
                                                            ? 20
                                                            : 10)),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      GetDeviceType()
                                                              .getDeviceType(
                                                                  context)
                                                          ? 20
                                                          : 10),
                                              child: contextCtrl
                                                          .blogsList[index]
                                                          .image !=
                                                      ""
                                                  ? CachedNetworkImage(
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        bannerImg,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      fit: BoxFit.fill,
                                                      height: 30,
                                                      width: 30,
                                                      imageUrl: contextCtrl
                                                          .blogsList[index]
                                                          .image
                                                          .toString(),
                                                      placeholder: (a, b) =>
                                                          const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )
                                                  : Image.asset(
                                                      bannerImg,
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          SizedBox(
                                            height: GetDeviceType()
                                                .getDeviceType(context)
                                                ? 40
                                                : 30,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Text(
                                                contextCtrl.blogsList[index].title
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: GetDeviceType()
                                                          .getDeviceType(context)
                                                      ? 16
                                                      : 12,
                                                  color: Colors.black,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: GetDeviceType()
                                                      .getDeviceType(context)
                                                  ? 15
                                                  : 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: GetDeviceType()
                                                          .getDeviceType(
                                                              context)
                                                      ? 20
                                                      : 10,
                                                ),
                                                SizedBox(
                                                  width: GetDeviceType()
                                                          .getDeviceType(
                                                              context)
                                                      ? 16
                                                      : 8,
                                                ),
                                                Text(
                                                  formattedDate,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: GetDeviceType()
                                                            .getDeviceType(
                                                                context)
                                                        ? 16
                                                        : 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
