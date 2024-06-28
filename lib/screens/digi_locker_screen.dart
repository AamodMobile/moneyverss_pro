import 'dart:io';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/dg_locker_controller.dart';
import 'package:fiinzy_pro/screens/upload_docoment_screen.dart';


class DigitalLocker extends StatefulWidget {
  const DigitalLocker({super.key});

  @override
  State<DigitalLocker> createState() => _DigitalLockerState();
}

class _DigitalLockerState extends State<DigitalLocker> {
  DGLockerController controller = Get.put(DGLockerController());

  @override
  void initState() {
    controller.panCard.value = File("");
    controller.aadhaarCard.value = File("");
    controller.drivingLicence.value = File("");
    controller.bankDetails.value = File("");
    controller.otherDocuments.value = File("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 65),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: const BoxDecoration(color: homeBgCl),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Digi Locker",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 14,
                    ),
                    /* Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contextCtr.documentsList.length,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 150,
                            childAspectRatio: (200 / 100),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 4,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const UploadDocumentScreen(
                                              title: "Bank Details",
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            bankIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                     Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        contextCtr.documentsList[index].title.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    Image.asset(
                                      viewDocBt,
                                      width: MediaQuery.of(context).size.width,
                                      height: 36,
                                    ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const UploadDocumentScreen(
                                              title: "Bank Details",
                                              value: "bankDetails",
                                            image:  ""
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            bankIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Bank Details",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    /*user.user.value.bankDetailsImg == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : */
                                    Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const UploadDocumentScreen(
                                              title: "Aadhar Card",
                                              value: "aadhaarCard",
                                            image:  ""
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            adharIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Aadhaar Card",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                   /* user.user.value.aadharCardImg == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        :*/
                                    Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const UploadDocumentScreen(
                                              title: "Pan Card",
                                              value: "panCard",
                                            image:  ""
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            panNewIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(color: Color(0xFFE6ECEE), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Pan Card",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                   /* user.user.value.panCardImg == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : */
                                    Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const UploadDocumentScreen(
                                              title: "Driving LicenceImg",
                                              value: "drivingLicence",
                                            image:  ""
                                            )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            panNewIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE6ECEE),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(35),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Driving Licence",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                   /* user.user.value.drivingLicenceImg == ""
                                        ? Image.asset(
                                            uploadBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          )
                                        : */
                                    Image.asset(
                                            viewDocBt,
                                            width: MediaQuery.of(context).size.width,
                                            height: 36,
                                          ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const UploadDocumentScreen(
                                            title: "Other Doc",
                                            value: "otherDocuments",
                                            image:  ""
                                        )));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 8, spreadRadius: 0, color: Color.fromRGBO(0, 0, 0, 0.15))]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            docIc,
                                            height: 38,
                                            width: 41,
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE6ECEE),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(35),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 9),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        "Other Doc",
                                        style: TextStyle(
                                          color: draKText,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                   /* user.user.value.otherDocuments == ""
                                        ? Image.asset(
                                      uploadBt,
                                      width: MediaQuery.of(context).size.width,
                                      height: 36,
                                    )
                                        : */
                                    Image.asset(
                                      viewDocBt,
                                      width: MediaQuery.of(context).size.width,
                                      height: 36,
                                    ),
                                    const SizedBox(height: 11),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                       const Expanded(child: SizedBox())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
