import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/my_earning_controller.dart';
import 'package:fiinzy_pro/screens/my_earning_screen.dart';

import '../constants/get_device_type.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  MyEarningController controller = Get.put(MyEarningController());
  static const String homeLoanIc = "assets/icons/home_loan.png";
  static const String moneyLoanIc = "assets/icons/mortgage_loan.png";
  static const String businessLoanIc = "assets/icons/business_loan.png";
  static const String personalLoanIc = "assets/icons/personal_loan.png";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<MyEarningController>(),
        initState: (state) {
          Get.find<MyEarningController>().myPayoutsListGet(true);
        },
        builder: (contextCtr) {
          return Scaffold(
            backgroundColor: homeBgCl,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
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
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total this Month".capitalize!,
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: GetDeviceType().getDeviceType(context) ? 18 : 14,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
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
                                      fontSize: GetDeviceType().getDeviceType(context) ? 14 : 10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 11),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5FF),
                            borderRadius: BorderRadius.circular(6),
                            border: const Border(
                              bottom: BorderSide(
                                color: primaryClNew,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                money,
                                height: GetDeviceType().getDeviceType(context) ? 37 : 32,
                                width: GetDeviceType().getDeviceType(context) ? 45 : 40,
                              ),
                              const SizedBox(width: 10),
                              Obx(
                                () => Text(
                                  "₹ ${contextCtr.totalEarningPayOut.value}",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: GetDeviceType().getDeviceType(context) ? 20 : 16,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const MyEarningScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context) ? 20 : 10, vertical: GetDeviceType().getDeviceType(context) ? 5 : 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFF189DFF),
                                        Color(0xFF0070C1),
                                      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                  child: Center(
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 16 : 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Builder(builder: (context) {
                    if (contextCtr.loading) {
                      return const LoaderClass();
                    }
                    if (contextCtr.myPayoutsList.isEmpty) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 200,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No Payout Found",
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ));
                    }
                    return MediaQuery.removePadding(
                      context: context,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: contextCtr.myPayoutsList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: primaryCl, width: 0.5),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      width: GetDeviceType().getDeviceType(context) ? 37 : 32,
                                      height: GetDeviceType().getDeviceType(context) ? 37 : 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 5, spreadRadius: 0, color: Colors.black.withOpacity(0.25))],
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF189DFF),
                                          Color(0xFF0070C1),
                                        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                                      ),
                                      child: contextCtr.myPayoutsList[index].loanImage != ""
                                          ? CachedNetworkImage(
                                              errorWidget: (context, url, error) => Image.asset(
                                                bannerImg,
                                                fit: BoxFit.fill,
                                              ),
                                              fit: BoxFit.fill,
                                              height: GetDeviceType().getDeviceType(context) ? 40 : 30,
                                              width: GetDeviceType().getDeviceType(context) ? 40 : 30,
                                              imageUrl: contextCtr.myPayoutsList[index].loanImage.toString(),
                                              placeholder: (a, b) => const Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                            )
                                          : Image.asset(
                                              personalLoanIc,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    const SizedBox(width: 14),
                                    Text(
                                      contextCtr.myPayoutsList[index].loanName.toString(),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textHeading,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType().getDeviceType(context) ? 20 : 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black, width: 0.5)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0), // Adjust the value as needed
                                    child: Table(
                                      border: TableBorder.all(color: Colors.black, width: 0.5),
                                      children: [
                                        TableRow(
                                          decoration: BoxDecoration(color: Color(0xFFECECEC)), // Header row background color
                                          children: [
                                            TableCell(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Loan Amount Range (INR)",
                                                  style: TextStyle(
                                                    color: textHeading,
                                                    fontFamily: medium,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: GetDeviceType().getDeviceType(context) ? 14 : 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    "Payout Slab",
                                                    style: TextStyle(
                                                      color: textHeading,
                                                      fontSize: GetDeviceType().getDeviceType(context) ? 14 : 10,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: semiBold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Data rows
                                        for (int i = 0; i < contextCtr.myPayoutsList[index].paySlab!.length; i++)
                                          TableRow(
                                            children: [
                                              TableCell(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    contextCtr.myPayoutsList[index].paySlab![i].loanAmountRange.toString(),
                                                    style: TextStyle(
                                                      color: textHeading,
                                                      fontFamily: medium,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: GetDeviceType().getDeviceType(context) ? 14 : 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              TableCell(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      "${contextCtr.myPayoutsList[index].paySlab![i].rates.toString()}%",
                                                      style: TextStyle(
                                                        color: textHeading,
                                                        fontSize: GetDeviceType().getDeviceType(context) ? 14 : 10,
                                                        fontWeight: FontWeight.w600,
                                                        fontFamily: semiBold,
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
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        });
  }
}
