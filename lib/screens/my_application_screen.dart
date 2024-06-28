import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/get_device_type.dart';
import 'package:fiinzy_pro/controller/lead_controller.dart';
import 'package:fiinzy_pro/models/lead_list_model.dart';
import 'package:fiinzy_pro/screens/application_progress/application_progress.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class MyApplicationScreen extends StatefulWidget {
  const MyApplicationScreen({super.key});

  @override
  State<MyApplicationScreen> createState() => _MyApplicationScreenState();
}

class _MyApplicationScreenState extends State<MyApplicationScreen> {
  TextEditingController search = TextEditingController();
  LeadListController controller = Get.put(LeadListController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LeadListController>(),
      initState: (state) {
        Get.find<LeadListController>().getLeadList();
      },
      builder: (contextCtr) {
        return SafeArea(
          child: Scaffold(
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
                      "My Appications",
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
                const SizedBox(height: 14),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 17),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 14, spreadRadius: 0, color: Colors.black.withOpacity(0.15))]),
                  child: MyTextFormField(
                    hint: "Search By Name....",
                    controller: search,
                    obscureText: false,
                    readOnly: false,
                    border: const Color.fromRGBO(85, 153, 255, 0.43),
                    fillColor: whiteColor,
                    prefixIcon: Container(
                      height: 24,
                      width: 24,
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(searchIc),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Builder(
                  builder: (context) {
                    if (contextCtr.isLoading) {
                      return const LoaderClass();
                    }
                    if (contextCtr.leadDataList.isEmpty) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 300,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                              ),
                              Image.asset(
                                notApplication,
                                height: 229,
                                width: 229,
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "No  Application Found",
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: contextCtr.leadDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return myLeadsListTile(contextCtr.leadDataList[index]);
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
  myLeadsListTile(LeadData leadData) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>  ApplicationProcessScreen(id: leadData.id.toString()));
      },
      child:Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
        decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: primaryClNew.withOpacity(0.43))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height : GetDeviceType().getDeviceType(context)? 20 : 10,
              width : MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: GetDeviceType().getDeviceType(context)? 14 : 9),
              child: Row(
                crossAxisAlignment : CrossAxisAlignment.end,
                children : [
                  /*  Container(
                    height: 40,
                    width: 44,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(color: const Color.fromRGBO(233, 238, 255, 1), borderRadius: BorderRadius.circular(6)),
                    child: Image.asset(hdfcIc),
                  ),
                  const SizedBox(width: 8),*/
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Application No. ${leadData.uniqueId}",
                          style: TextStyle(
                            color: secondaryCl,
                            fontStyle: FontStyle.normal,
                            fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                            fontWeight: FontWeight.w500,
                            fontFamily: semiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name:${leadData.customerName}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryClNew,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: semiBold,
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Text(
                              "(${leadData.applicantType})",
                              style: TextStyle(
                                color: primaryClNew,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)? 1 : 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: semiBold,
                              ),
                            ),
                          ],
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
                    child:  Text(
                      "₹ ${leadData.loanAmount}",
                      style: TextStyle(
                        color: primaryClNew,
                        fontStyle: FontStyle.normal,
                        fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
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
                            Text(
                              "Loan Type",
                              style: TextStyle(
                                color: textGeryCl,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: medium,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${leadData.loanType}",
                              style: TextStyle(
                                color: textHeading,
                                fontStyle: FontStyle.normal,
                                fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
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
                                  height: GetDeviceType().getDeviceType(context)?15 : 12,
                                  width: GetDeviceType().getDeviceType(context)? 15 : 12,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Text(
                                  "+ 91 ${leadData.customerMobileNumber}",
                                  style: TextStyle(
                                    color: textHeading,
                                    fontStyle: FontStyle.normal,
                                    fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
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
                                  height: GetDeviceType().getDeviceType(context)? 15 : 12,
                                  width: GetDeviceType().getDeviceType(context)? 15 : 12,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                Expanded(
                                  child: Text(
                                    "${leadData.customerEmailId}",
                                    style: TextStyle(
                                      color: textHeading,
                                      fontStyle: FontStyle.normal,
                                      fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(color: const Color.fromRGBO(245, 245, 245, 1), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Application Status",
                    style: TextStyle(
                      color: secondaryCl,
                      fontStyle: FontStyle.normal,
                      fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: semiBold,
                    ),
                  ),

                  Column(
                    children: [
                      Text(
                        leadData.leadStatus.toString(),
                        style: TextStyle(
                          color: primaryClNew,
                          fontStyle: FontStyle.normal,
                          fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        decoration: BoxDecoration(
                            color: (leadData.leadSubStatus.toString() == "In Progress")
                                ? lightRedSec
                                : leadData.leadSubStatus.toString() == "Successfully Disbursed"
                                ? lightGreenSec
                                : lightPink,
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                        child: Center(
                          child: Text(
                            leadData.leadSubStatus.toString(),
                            style: TextStyle(
                              color:  leadData.leadSubStatus.toString() == "In Progress"
                                  ? kAmber
                                  : leadData.leadSubStatus.toString() == "Successfully Disbursed"
                                  ? greenSec
                                  : redCl,
                              fontStyle: FontStyle.normal,
                              fontSize: GetDeviceType().getDeviceType(context)? 14 : 10,
                              fontWeight: FontWeight.w600,
                              fontFamily: semiBold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
