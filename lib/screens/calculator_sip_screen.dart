import 'dart:math' as math;

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/widget/my_button.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';


class CalculatorSIPScreen extends StatefulWidget {
  const CalculatorSIPScreen({super.key});

  @override
  State<CalculatorSIPScreen> createState() => _CalculatorSIPScreenState();
}

class _CalculatorSIPScreenState extends State<CalculatorSIPScreen> {
  TextEditingController expectedAmountController = TextEditingController();
  TextEditingController returnTimeController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  double requiredInvestment = 0.0;
  int numberOfSIPs = 0;

  void calculateInvestment() {
    double expectedAmount = double.parse(expectedAmountController.text);
    int returnTimeInYears = int.parse(returnTimeController.text);
    double rate = double.parse(rateController.text) / 100;

    double monthlyRate = rate / 12;
    int numberOfMonths = returnTimeInYears * 12;

    double investmentAmount = expectedAmount / math.pow(1 + monthlyRate, numberOfMonths);

    setState(() {
      requiredInvestment = investmentAmount;
      numberOfSIPs = numberOfMonths;
    });
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
                  "SIP Calculator",
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Expected Amount",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              MyTextFormField(
                controller: expectedAmountController,
                hint: "Expected Amount",
                fillColor: Colors.white,
                obscureText: false,
                readOnly: false,
                keyboardType: TextInputType.number,
                border: primaryCl,
              ),
              const SizedBox(
                height: 14,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Interest %",
                  style: TextStyle(
                    color: textColorSec,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              MyTextFormField(
                controller: rateController,
                hint: "Interest %",
                fillColor: Colors.white,
                keyboardType: TextInputType.number,
                obscureText: false,
                readOnly: false,
                border: primaryCl,
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Year",
                            style: TextStyle(
                              color: textColorSec,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        MyTextFormField(
                          controller: returnTimeController,
                          hint: "Year",
                          fillColor: Colors.white,
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          readOnly: false,
                          border: primaryCl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                width: 200,
                child: MyButton(
                  onPressed: calculateInvestment,
                  color: primaryClNew,
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: whiteColor,
                      fontFamily: semiBold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                textAlign: TextAlign.center,
                'Required Investment Amount:\n${requiredInvestment.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                'Number of SIP Installments: \n$numberOfSIPs ',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
