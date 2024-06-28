import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/screens/add_bank_account/add_bank_account.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            color: primaryClNew,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        )),
                    const SizedBox(width: 20),
                    const Text(
                      "Withdraw",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 86,
                        width: MediaQuery.of(context).size.width,
                        color: primaryClNew,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    margin: const EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                      color: whiteColor,
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
                        const Text(
                          "Withdrawable Amount : ₹ 2000.00",
                          style: TextStyle(
                            color: textHeading,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Divider(color: primaryClNew.withOpacity(0.43)),
                        const SizedBox(height: 15),
                        const Text(
                          "Enter Amount",
                          style: TextStyle(
                            color: subHeading,
                            fontFamily: regular,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          height: 38,
                          child: MyTextFormField(
                            hint: "000",
                            controller: amount,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            readOnly: false,
                            border: const Color.fromRGBO(99, 110, 150, 1),
                            fillColor: whiteColor,
                            prefixIcon: Container(
                              width: 10,
                              padding: const EdgeInsets.all(12),
                              child: const Material(
                                  child: Center(
                                child: Text(
                                  "₹",
                                  style: TextStyle(
                                    color: subHeading,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 22),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                color: whiteColor,
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
                  const Text(
                    "Choose Bank Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        bankIcNew,
                        height: 32,
                        width: 41,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const AddBankAccount());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                          decoration: BoxDecoration(color: const Color.fromRGBO(242, 244, 250, 1), borderRadius: BorderRadius.circular(4), border: Border.all(color: primaryClNew, width: 0.5)),
                          child: const Text(
                            "Add Back Account",
                            style: TextStyle(
                              color: primaryClNew,
                              fontFamily: medium,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                color: whiteColor,
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
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: appBarClNew1)),
                        child: Image.asset(
                          withHisIc,
                          height: 32,
                          width: 41,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fund Transaction",
                            style: TextStyle(
                              color: subHeading,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Add Funds and Withdraw history",
                            style: TextStyle(
                              color: subHeading,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(17),
          width: MediaQuery.of(context).size.width,
          height: 183,
          decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    outIc,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 26),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                        text: "If you request a withdrawal now, the estimated credit time will be  ",
                        style: TextStyle(
                          color: subHeading,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: "11:30 pm,02 Apr 2024",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontFamily: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 19),
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: amount.text.isEmpty ? const Color.fromRGBO(233, 238, 255, 1) : null,
                    borderRadius: BorderRadius.circular(10),
                    gradient: amount.text.isEmpty
                        ? null
                        : const LinearGradient(
                            colors: [
                              Color(0xFF3CBFFF),
                              Color(0xFF0144DF),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                  ),
                  child: Center(
                    child: Text(
                      "PROCEED",
                      style: TextStyle(
                        color: amount.text.isEmpty ? const Color.fromRGBO(134, 147, 183, 1) : whiteColor,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
