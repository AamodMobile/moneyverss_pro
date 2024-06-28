
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CreditScoreScreen extends StatefulWidget {
  const CreditScoreScreen({super.key});

  @override
  State<CreditScoreScreen> createState() => _CreditScoreScreenState();
}

class _CreditScoreScreenState extends State<CreditScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondaryCl,
          centerTitle: false,
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                    size: 24,
                  )),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "CIBIL Score",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontFamily: medium,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            SfRadialGauge(
              enableLoadingAnimation: true,
              backgroundColor: Colors.white,
              title: const GaugeTitle(text: 'Credit Score'),
              axes: [
                RadialAxis(minimum: 300, maximum: 900, ranges: [
                  GaugeRange(startValue: 300, endValue: 722, color: Colors.red),
                  GaugeRange(
                      startValue: 723, endValue: 747, color: Colors.orange),
                  GaugeRange(
                      startValue: 748, endValue: 764, color: Colors.yellow),
                  GaugeRange(
                      startValue: 765,
                      endValue: 777,
                      color: Colors.greenAccent),
                  GaugeRange(
                      startValue: 778, endValue: 900, color: Colors.green),
                ], pointers: const [
                  NeedlePointer(value: 750),
                ], annotations: const [
                  GaugeAnnotation(
                    widget: Text(
                      '750.0',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  )
                ])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "Your Credit Score is ",
                        style: TextStyle(
                          color: secondaryCl,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontFamily: semiBold,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: "Good",
                          ),
                        ])),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.info,
                  color: blueCl,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: const TextSpan(
                    text: "Credit Report Date :- ",
                    style: TextStyle(
                      color: otherCl,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: semiBold,
                      fontSize: 12,
                    ),
                    children: [
                      TextSpan(
                        text: "14-May-2023",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 14,
                        ),
                      ),
                    ])),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                text: "Powered By  ",
                style: TextStyle(
                  color: otherCl,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontFamily: semiBold,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: "CIBIL",
                    style: TextStyle(
                      color: secondaryCl,
                      fontSize: 30,
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