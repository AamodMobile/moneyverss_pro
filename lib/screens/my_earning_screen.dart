import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/models/my_earning_list_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/my_earning_controller.dart';

class MyEarningScreen extends StatefulWidget {
  const MyEarningScreen({super.key});

  @override
  State<MyEarningScreen> createState() => _MyEarningScreenState();
}

class _MyEarningScreenState extends State<MyEarningScreen> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  static const String homeLoanIc = "assets/icons/home_loan.png";
  static const String moneyLoanIc = "assets/icons/mortgage_loan.png";
  static const String businessLoanIc = "assets/icons/business_loan.png";
  static const String personalLoanIc = "assets/icons/personal_loan.png";
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
  String filterBy = "current_month";

  MyEarningController myEarningController = Get.put(MyEarningController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<MyEarningController>(),
        initState: (state) {
          Get.find<MyEarningController>().getMyEarningList(filterBy, true);
        },
        builder: (contextCtrl) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 65),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: whiteColor, border: Border.fromBorderSide(BorderSide(color: Color(0xFFB6D3FF)))),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Image.asset(
                              icBack,
                              height: 24,
                              width: 24,
                            ),
                          )),
                      const Text(
                        "My Earnings",
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
              body: Column(
                children: [
                  TabBar(
                    onTap: (index) {
                      if (index == 1) {
                        setState(() {
                          filterBy = "last_month";
                          contextCtrl.getMyEarningList(filterBy, false);
                        });
                      } else if (index == 2) {
                        setState(() {
                          filterBy = "total_income";
                          contextCtrl.getMyEarningList(filterBy, false);
                        });
                      } else if (index == 0) {
                        setState(() {
                          filterBy = "current_month";
                          contextCtrl.getMyEarningList(filterBy, false);
                        });
                      }
                    },
                    controller: _tabController,
                    indicatorColor: primaryClNew,
                    unselectedLabelColor: primaryCl,
                    labelColor: primaryClNew,
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: medium,
                      color: primaryCl,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    labelStyle: const TextStyle(
                      fontFamily: medium,
                      color: primaryClNew,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    tabs: const [
                      Tab(
                        text: "Current Month",
                      ),
                      Tab(
                        text: "Last Month",
                      ),
                      Tab(
                        text: "Total Income",
                      ),
                    ],
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  (contextCtrl.loading)
                      ? const LoaderClass()
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
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
                                                style: const TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14,
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
                                                      Color(0xFF1159C8),
                                                      Color(0xFFA200BC),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "Current Month",
                                                    style: TextStyle(
                                                      color: whiteColor,
                                                      fontFamily: medium,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 13),
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                          margin: const EdgeInsets.symmetric(horizontal: 20),
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F5FF),
                                            borderRadius: BorderRadius.circular(6),
                                            border: const Border(
                                              bottom: BorderSide(
                                                color: Color(0xFF0066FF),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                money,
                                                height: 32,
                                                width: 40,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                "₹ ${contextCtrl.totalEarning}",
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  overflow: TextOverflow.ellipsis,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  /*Get.to(() =>
                                                  const WithdrawScreen());*/
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                      gradient: const LinearGradient(colors: [
                                                        Color(0xFF189DFF),
                                                        Color(0xFF0070C1),
                                                      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                                  child: Center(
                                                    child: Text(
                                                      contextCtrl.amountStatus == "0" ? "Pending" : "Released",
                                                      style: const TextStyle(
                                                        color: whiteColor,
                                                        fontFamily: medium,
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 13),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: greenCl,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                "Income",
                                                style: TextStyle(
                                                  color: greenCl,
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(width: 13),
                                              Container(
                                                height: 10,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                  color: textLightGrey,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              const Text(
                                                "Loans",
                                                style: TextStyle(
                                                  color: textLightGrey,
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        SizedBox(
                                          height: 180,
                                          child: SfCartesianChart(
                                            primaryXAxis: CategoryAxis(
                                              title: AxisTitle(
                                                text: 'Loans',
                                                textStyle: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  // Custom title text size
                                                  fontWeight: FontWeight.bold, // Custom title font weight
                                                ),
                                              ),
                                              labelPosition: ChartDataLabelPosition.outside,
                                              labelStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10, // Custom label text size
                                              ),
                                            ),
                                            primaryYAxis: NumericAxis(
                                              title: AxisTitle(
                                                text: 'Income',
                                                textStyle: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 8,
                                                  // Custom title text size
                                                  fontWeight: FontWeight.bold, // Custom title font weight
                                                ),
                                              ),
                                              labelPosition: ChartDataLabelPosition.outside,
                                              labelStyle: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 10, // Custom label text size
                                              ),
                                              minimum: 0,
                                              maximum: 20000,
                                              interval: 5000,
                                            ),
                                            series: <ChartSeries>[
                                              ColumnSeries<SalesData, String>(
                                                dataSource: <SalesData>[
                                                  SalesData('H.L', 200),
                                                  SalesData('M.L', 13000),
                                                  SalesData('B.L', 200),
                                                  SalesData('P.L', 13000),
                                                  SalesData('G.L', 13000),
                                                  SalesData('C.L', 13000),
                                                ],
                                                xValueMapper: (SalesData sales, _) => sales.month,
                                                yValueMapper: (SalesData sales, _) => sales.sales,
                                                dataLabelSettings: const DataLabelSettings(isVisible: true),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Divider(color: dividerClNew,height: 1,),
                                        const SizedBox(height: 8),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                               "* H.L  Home Loan",
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "* M.L  Mortagage Loan",
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "* B.L  Business Loan",
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "* P.L  Personal Loan",
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "* G.L  Gold Loan",
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "* C.L  Car Used Loan",
                                                style: TextStyle(
                                                  color: draKText,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 18),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Text(
                                    filterBy == "last_month"
                                        ? "Last Month applied application".capitalize!
                                        : filterBy == "current_month"
                                            ? "recently applied application".capitalize!
                                            : "Total applied application".capitalize!,
                                    style: const TextStyle(
                                      color: draKText,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    child: ListView.builder(
                                      itemCount: contextCtrl.myApplicationList.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return myLeadsListTile(contextCtrl.myApplicationList[index]);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ), /*TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 17.0, vertical: 17),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                blurRadius: 14,
                                                spreadRadius: 0,
                                                color: Color.fromRGBO(
                                                    63, 90, 131, 0.31),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 6),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Total this Month"
                                                          .capitalize!,
                                                      style: const TextStyle(
                                                        color: draKText,
                                                        fontFamily: semiBold,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 9,
                                                          vertical: 4),
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0xFF1159C8),
                                                            Color(0xFFA200BC),
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                        ),
                                                      ),
                                                      child: const Center(
                                                        child: Text(
                                                          "Current Month",
                                                          style: TextStyle(
                                                            color: whiteColor,
                                                            fontFamily: medium,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 13),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 8),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFF1F5FF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: const Border(
                                                    bottom: BorderSide(
                                                      color: Color(0xFF0066FF),
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      money,
                                                      height: 32,
                                                      width: 40,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      "₹ ${contextCtrl.totalEarning}",
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily: semiBold,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            const WithdrawScreen());
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10,
                                                                vertical: 3),
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                gradient: const LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF189DFF),
                                                                      Color(
                                                                          0xFF0070C1),
                                                                    ],
                                                                    begin: Alignment
                                                                        .centerLeft,
                                                                    end: Alignment
                                                                        .centerRight)),
                                                        child: const Center(
                                                          child: Text(
                                                            "Withdrawal",
                                                            style: TextStyle(
                                                              color: whiteColor,
                                                              fontFamily:
                                                                  medium,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 13),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 14,
                                                      decoration: BoxDecoration(
                                                        color: greenCl,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      "Income",
                                                      style: TextStyle(
                                                        color: greenCl,
                                                        fontFamily: medium,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 13),
                                                    Container(
                                                      height: 10,
                                                      width: 14,
                                                      decoration: BoxDecoration(
                                                        color: textLightGrey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      "Month",
                                                      style: TextStyle(
                                                        color: textLightGrey,
                                                        fontFamily: medium,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 12),
                                              SizedBox(
                                                height: 150,
                                                child: SfCartesianChart(
                                                  primaryXAxis: CategoryAxis(
                                                    title: AxisTitle(
                                                      text: 'Months',
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 8,
                                                        // Custom title text size
                                                        fontWeight: FontWeight
                                                            .bold, // Custom title font weight
                                                      ),
                                                    ),
                                                    labelPosition:
                                                        ChartDataLabelPosition
                                                            .outside,
                                                    labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          10, // Custom label text size
                                                    ),
                                                  ),
                                                  primaryYAxis: NumericAxis(
                                                    title: AxisTitle(
                                                      text: 'Income',
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 8,
                                                        // Custom title text size
                                                        fontWeight: FontWeight
                                                            .bold, // Custom title font weight
                                                      ),
                                                    ),
                                                    labelPosition:
                                                        ChartDataLabelPosition
                                                            .outside,
                                                    labelStyle: const TextStyle(
                                                      color: Colors.green,
                                                      fontSize:
                                                          10, // Custom label text size
                                                    ),
                                                    minimum: 0,
                                                    maximum: 20000,
                                                    interval: 5000,
                                                  ),
                                                  series: <ChartSeries>[
                                                    ColumnSeries<SalesData,
                                                        String>(
                                                      dataSource: <SalesData>[
                                                        SalesData('1', 200),
                                                        SalesData('2', 13000),
                                                        SalesData('3', 200),
                                                        SalesData('4', 13000),
                                                        SalesData('5', 11000),
                                                        SalesData('6', 1000),
                                                      ],
                                                      xValueMapper:
                                                          (SalesData sales,
                                                                  _) =>
                                                              sales.month,
                                                      yValueMapper:
                                                          (SalesData sales,
                                                                  _) =>
                                                              sales.sales,
                                                      dataLabelSettings:
                                                          const DataLabelSettings(
                                                              isVisible: true),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 18),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        Text(
                                          "recently applied application"
                                              .capitalize!,
                                          style: const TextStyle(
                                            color: draKText,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        MediaQuery.removePadding(
                                          context: context,
                                          removeTop: true,
                                          child: ListView.builder(
                                            itemCount: contextCtrl
                                                .myApplicationList.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return myLeadsListTile(contextCtrl
                                                  .myApplicationList[index]);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(),
                                const SizedBox(),
                              ]),*/
                        )
                ],
              ),
            ),
          );
        });
  }

  myLeadsListTile(RecentlyAppliedApplication myApplicationData) {
    return GestureDetector(
      onTap: () {
        //Get.to(() =>  ApplicationProcessScreen(id: leadData.id.toString(),));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: primaryClNew.withOpacity(0.43))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 44,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(color: const Color.fromRGBO(233, 238, 255, 1), borderRadius: BorderRadius.circular(6)),
                    child: Image.asset(hdfcIc),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Application No. ${myApplicationData.uniqueId.toString()}",
                          style: const TextStyle(
                            color: secondaryCl,
                            fontStyle: FontStyle.normal,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: semiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Name: ${myApplicationData.customerName.toString()}",
                          style: const TextStyle(
                            color: primaryClNew,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 238, 255, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "₹ ${myApplicationData.loanAmount.toString()}",
                      style: const TextStyle(
                        color: primaryClNew,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(4),
                            border: const Border(
                              left: BorderSide(
                                color: primaryClNew,
                                width: 2,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 4,
                                spreadRadius: 0,
                                color: Colors.black.withOpacity(0.15),
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lone Type",
                              style: TextStyle(
                                color: textGeryCl,
                                fontStyle: FontStyle.normal,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: medium,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              myApplicationData.loanType.toString(),
                              style: const TextStyle(
                                color: textHeading,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: semiBold,
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(width: 7),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(241, 241, 241, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: const Border(
                            left: BorderSide(
                              color: Color.fromRGBO(0, 22, 56, 1),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  callIcNew,
                                  height: 12,
                                  width: 12,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  myApplicationData.customerMobileNumber.toString(),
                                  style: const TextStyle(
                                    color: textHeading,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: medium,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Image.asset(
                                  mailIcNew,
                                  height: 12,
                                  width: 12,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Expanded(
                                  child: Text(
                                    myApplicationData.customerEmailId.toString(),
                                    style: const TextStyle(
                                      color: textHeading,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: medium,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              decoration: BoxDecoration(color: const Color.fromRGBO(245, 245, 245, 1), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Document Status",
                    style: TextStyle(
                      color: secondaryCl,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: semiBold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: myApplicationData.documentStatus.toString() == "In Progress"
                            ? lightRedSec
                            : myApplicationData.documentStatus.toString() == "Completed"
                                ? lightGreenSec
                                : lightPink,
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                    child: Center(
                      child: Text(
                        myApplicationData.documentStatus.toString(),
                        style: TextStyle(
                          color: myApplicationData.documentStatus.toString() == "In Progress"
                              ? kAmber
                              : myApplicationData.documentStatus.toString() == "Completed"
                                  ? greenSec
                                  : redCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
