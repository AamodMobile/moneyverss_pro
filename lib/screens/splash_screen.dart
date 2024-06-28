import 'dart:async';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/screens/dashborad_screen.dart';
import 'package:fiinzy_pro/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _animation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigator();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBgCl,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(splashBg), fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            FadeTransition(
              opacity: _animation1,
              child: Image.asset(loadingGif, width: 50, height: 50),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                FadeTransition(
                  opacity: _animation2,
                  child: Image.asset(imgSplashLogo, width: 250, fit: BoxFit.contain,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _navigator() async {
    Timer(
      const Duration(seconds: 1),
      () async {
        FocusScope.of(context).requestFocus(FocusNode());
        var pref = await SharedPreferences.getInstance();
        var token = pref.getString(accessToken);
        if (token != null) {
          Get.offAll(() =>  DashBoardScreen(ctrIndex: 0,));
        } else {
          Get.off(() => const LoginScreen());
        }
      },
    );
  }
}
