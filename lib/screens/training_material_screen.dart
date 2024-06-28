import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/training_video_list_controller.dart';
import 'package:fiinzy_pro/screens/video_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/get_device_type.dart';
import '../service/api_url.dart';
import 'blog_details_screen.dart';

class TrainingMaterialScreen extends StatefulWidget {
  const TrainingMaterialScreen({super.key});

  @override
  State<TrainingMaterialScreen> createState() => _TrainingMaterialScreenState();
}

class _TrainingMaterialScreenState extends State<TrainingMaterialScreen> {
  static const String homeLoanIc = "assets/icons/cash_loan.png";
  static const String moneyLoanIc = "assets/icons/cash_loan.png";
  static const String businessLoanIc = "assets/icons/cash_loan.png";
  static const String personalLoanIc = "assets/icons/cash_loan.png";
  var myCategory = [
    {
      'title': 'Home Loan',
      'image': homeLoanIc,
    },
    {
      'title': 'Mortgage Loan',
      'image': moneyLoanIc,
    },
    {
      'title': 'Business Loan',
      'image': businessLoanIc,
    },
    {
      'title': 'Personal Loan',
      'image': personalLoanIc,
    },
  ];

  TrainingVideoListController controller = Get.put(TrainingVideoListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder(
          init: Get.find<TrainingVideoListController>(),
          initState: (state){
            Get.find<TrainingVideoListController>().getTrainingVideoCategoryList();
          },
          builder: (contextCtrl){
            return Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 65),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16,),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      border: Border.fromBorderSide(
                          BorderSide(color: Color(0xFFB6D3FF)))),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
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
                        "Training Material",
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
              body: (contextCtrl.loading)
                  ? const LoaderClass()
                  : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.011,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Training Categories".toUpperCase(),
                        style: const TextStyle(
                            color: blueCl,
                            fontFamily: bold,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.011,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.30,
                      margin: const EdgeInsets.only(left: 18, right: 18),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: contextCtrl.trainingCategoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    contextCtrl.getTrainingVideoList(contextCtrl.trainingCategoryList[index].id.toString());
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 26),
                                  padding: const EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * 0.17,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                        const Color(0xFF000000).withOpacity(0.15),
                                        offset: const Offset(0, 1),
                                        blurRadius: 17,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    homeLoanIc,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.011,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                                child: Text(
                                  contextCtrl.trainingCategoryList[index].title.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: textHeading,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: bold,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Training Videos".toUpperCase(),
                        style: const TextStyle(
                            color: blueCl,
                            fontFamily: bold,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                    Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 12),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contextCtrl.trainingVideoList.length,
                          itemBuilder: (BuildContext context,int index){
                            return InkWell(
                              onTap: (){
                                Get.to(()=>VideoDetailsScreen(videoData: contextCtrl.trainingVideoList[index],));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 14),
                                    height: 140,
                                    width: 252,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Image.network(ApiUrl.imageUrl+contextCtrl.trainingVideoList[index].videoThumbnail.toString(), fit: BoxFit.fill,),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 14),
                                    height: 140,
                                    width: 252,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Center(
                                      child: Image.asset(playIc,height: 50,width: 50,),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Text(
                        "Blogs".toUpperCase(),
                        style: const TextStyle(
                            color: blueCl,
                            fontFamily: bold,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: contextCtrl.blogList.length,
                      itemBuilder: (BuildContext context, int index) {
                        String createdAtString = contextCtrl.blogList[index].createdAt.toString();
                        DateTime createdAt = DateTime.parse(createdAtString);
                        String formattedDate = "${createdAt.day}-${createdAt.month}-${createdAt.year}";
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => BlogDetailsScreen(id: contextCtrl.blogList[index].id.toString(), tittle: contextCtrl.blogList[index].title.toString()));
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)? 20 : 10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: GetDeviceType().getDeviceType(context)? 240 : 140,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)? 20 : 10)),
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(GetDeviceType().getDeviceType(context)?20 : 10),
                                        child: contextCtrl.blogList[index].image != ""
                                            ? CachedNetworkImage(
                                          errorWidget: (context, url, error) => Image.asset(
                                            bannerImg,
                                            fit: BoxFit.fill,
                                          ),
                                          fit: BoxFit.fill,
                                          height: 30,
                                          width: 30,
                                          imageUrl: contextCtrl.blogList[index].image.toString(),
                                          placeholder: (a, b) => const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                            : Image.asset(
                                          bannerImg,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        contextCtrl.blogList[index].title.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                          color: Colors.black,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(height: GetDeviceType().getDeviceType(context)? 20 : 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            size: GetDeviceType().getDeviceType(context)? 20 : 10,
                                          ),
                                          SizedBox(
                                            width: GetDeviceType().getDeviceType(context)? 16 : 8,
                                          ),
                                          Text(
                                            formattedDate,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
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
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            );
          }
        ));
  }
}
