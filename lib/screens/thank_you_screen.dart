

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/screens/dashborad_screen.dart';
import 'package:fiinzy_pro/widget/my_button.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({super.key});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                thankYouBgImg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Image.asset(
                  thankYouImg,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  '"Look out for an email confirmation that includes all the specifics of your order."',
                  maxLines: 2,
                  style: TextStyle(
                      color: secondaryCl,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: medium,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize:14),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 49,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: MyButton(
                  color: mainColor,
                  onPressed: (){
                    Get.offAll(()=>  DashBoardScreen(ctrIndex: 0,));
                  },
                  child: const Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                          color: whiteColor,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
