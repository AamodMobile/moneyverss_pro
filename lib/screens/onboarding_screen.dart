import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/onboarding_controller.dart';
import 'package:fiinzy_pro/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  OnBoardingController con = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: screenBgCl,
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(onboardingBg))),
              child: _buildBody())),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12, width: MediaQuery.of(context).size.width),
              InkWell(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: secondaryCl,
                      fontFamily: bold,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 47),
              Image.asset(
                fiinzyLogo,
                height: 40,
                width: 98,
              ),
              const SizedBox(height: 14),
              SizedBox(width: MediaQuery.of(context).size.width, height: 460, child: _buildPageView()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        con.images.length,
                        (ind) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          padding: const EdgeInsets.all(5),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ind == con.currentPage.value ? primaryClNew : const Color(0xFFD9D9D9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  if (con.currentPage.value < 2) {
                    con.currentPage.value++;
                    _pageController.animateToPage(con.currentPage.value, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                  } else {
                    Get.to(() => const LoginScreen());
                  }
                },
                child: Image.asset(
                  buttonOnBoarding,
                  height: 75,
                  width: 75,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      itemCount: con.totalPages.value,
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
            }
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0.0, 100 * (1 - value)),
                // Adjust the offset as needed
                child: child,
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(
                con.images[index],
                height: 240,
                width: 315,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 110),
              Text(
                con.tittle[index],
                style: const TextStyle(
                  color: secondaryCl,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "In publishing and graphic design, Lorem ipsum \n is a placeholder text commonly used to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: secondaryCl,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 34),
            ],
          ),
        );
      },
      onPageChanged: (int index) {
        _currentPageNotifier.value = index;
        con.currentPage.value = index;
      },
    );
  }
}
