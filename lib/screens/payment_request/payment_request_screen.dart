import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class PaymentRequestScreen extends StatefulWidget {
  const PaymentRequestScreen({super.key});

  @override
  State<PaymentRequestScreen> createState() => _PaymentRequestScreenState();
}

class _PaymentRequestScreenState extends State<PaymentRequestScreen> {
  TextEditingController search = TextEditingController();

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
                  "Payment Request",
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              const SizedBox(height: 10),
              MyTextFormField(
                hint: "Search For Bank Name Or Amount",
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
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: primaryClNew.withOpacity(0.20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "02 Apr 2024 at 09:30 AM",
                            style: TextStyle(
                              color: textLightGrey,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 11),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 40,
                                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(4), border: Border.all(color: primaryClNew.withOpacity(0.20), width: 1)),
                                child: Image.asset(yesBankLogoIc),
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Yes Bank",
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "**********5066",
                                    style: TextStyle(
                                      color: textLightGrey,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    "₹ 1500",
                                    style: TextStyle(
                                      color: draKText,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: index == 1
                                            ? const Color(0xFFFFE8E3)
                                            : index == 2
                                                ? const Color(0xFFD4F3E4)
                                                : const Color(0xFFFFF4E3)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          index == 1
                                              ? closeRedIc
                                              : index == 2
                                                  ? doneGreenNewIc
                                                  : playYellowIc,
                                          height: 12,
                                          width: 12,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          index == 1
                                              ? "REJECT"
                                              : index == 2
                                                  ? "APPROVED"
                                                  : "PENDING",
                                          style: TextStyle(
                                            color: index == 1
                                                ? const Color(0xFF631200)
                                                : index == 2
                                                    ? const Color(0xFF03241C)
                                                    : const Color(0xFF8C1900),
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: appBarClNew1,
                            height: 1,
                          ),
                          const SizedBox(height: 14),
                          index == 1 || index == 2
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: index == 1
                                        ? const Color(0xFFFFE8E3)
                                        : index == 2
                                            ? const Color(0xFFD4F3E4)
                                            : whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        index == 1
                                            ? closeRedIc
                                            : index == 2
                                                ? doneGreenNewIc
                                                : playYellowIc,
                                        height: 25,
                                        width: 25,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          index == 1
                                              ? "Your Account Details Not Match."
                                              : index == 2
                                                  ? "Your Withdrawal request has been processed. fund will be credited to your account by 11:30 Pm on 02 apr 2024"
                                                  : "",
                                          style: TextStyle(
                                            color: index == 1
                                                ? const Color(0xFF631200)
                                                : index == 2
                                                    ? const Color(0xFF03241C)
                                                    : const Color(0xFF8C1900),
                                            fontFamily: regular,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            border: Border.all(color: primaryClNew, width: 1),
                                            color: Colors.white,
                                          ),
                                          width: 154,
                                          height: 33,
                                          child: const Center(
                                            child: Text(
                                              'Cancel Req.',
                                              style: TextStyle(
                                                color: primaryClNew,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: medium,
                                                fontSize: 14,
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
                                              borderRadius: BorderRadius.circular(4),
                                              gradient: const LinearGradient(colors: [
                                                Color(0xFF3CBFFF),
                                                Color(0xFF0144DF),
                                              ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                          width: 154,
                                          height: 33,
                                          child: const Center(
                                            child: Text(
                                              'Update',
                                              style: TextStyle(
                                                color: whiteColor,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: medium,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
