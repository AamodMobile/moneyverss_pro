import 'dart:io';

import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/dashboard_controller.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/screens/account_screen.dart';
import 'package:fiinzy_pro/screens/create_lead/create_lead_screen.dart';
import 'package:fiinzy_pro/screens/earning_screen.dart';
import 'package:fiinzy_pro/screens/home_screen.dart';
import 'package:fiinzy_pro/screens/leads_screen.dart';
import 'package:fiinzy_pro/screens/notification_screen.dart';
import 'package:get/get.dart';

import '../constants/get_device_type.dart';
import '../utils/fab_bottom_appbar_item.dart';

class DashBoardScreen extends StatefulWidget {
  int ctrIndex;
   DashBoardScreen({super.key,  required this.ctrIndex});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static List<Widget> widgetOptions = [
    const HomeScreen(),
    const LeadsScreen(),
    const EarningScreen(),
    const AccountScreen(),
    const CreateLeadScreen(tittle: '', isBottom: true, type: ""),
  ];
  int timeIndex = -1;
  final List time = [
    "10 Am -11 Am",
    "11 Am -12 Pm",
    "12 Pm -1 Pm",
    "2 Pm -3 Pm",
  ];
  int selectedRating = 0;
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    dashboardController.getContNotification();
    userController.userProfileGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          final navigator = Navigator.of(context);
          bool willLeave = false;
          if (dashboardController.selectedIndex.value != 0) {
            _onItemTapped(0);
          } else {
            await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                backgroundColor: screenBgCl,
                title: const Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(
                    color: primaryClNew,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      willLeave = true;
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryClNew,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: primaryClNew,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (willLeave) {
            navigator.pop();
          }
        },
        child: GetBuilder(
            init: Get.find<UserController>(),
            initState: (state) {
              Get.find<UserController>().userProfileGet();
            },
            builder: (contextCtr) {
              return SafeArea(
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor: homeBgCl,
                  appBar: PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width,
                        GetDeviceType().getDeviceType(context) ? 75 : 65),
                    child: Container(
                        height:
                            GetDeviceType().getDeviceType(context) ? 75 : 65,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        decoration: const BoxDecoration(
                            color: whiteColor,
                            border: Border.fromBorderSide(
                                BorderSide(color: Color(0xFFB6D3FF)))),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: false,
                                  child: SizedBox(
                                    width:
                                        GetDeviceType().getDeviceType(context)
                                            ? 160
                                            : 80,
                                    child: Text(
                                      "Hi ${contextCtr.user.value.name ?? ""}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: primaryClNew,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: GetDeviceType()
                                                .getDeviceType(context)
                                            ? 14
                                            : 11,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    dashboardController.markAsRead();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NotificationScreen()));
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: GetDeviceType()
                                                .getDeviceType(context)
                                            ? 40
                                            : 30,
                                        width: GetDeviceType()
                                                .getDeviceType(context)
                                            ? 40
                                            : 30,
                                        padding: EdgeInsets.all(GetDeviceType()
                                                .getDeviceType(context)
                                            ? 10
                                            : 6),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: whiteColor,
                                        ),
                                        child: Image.asset(
                                          notificationIc,
                                          fit: BoxFit.contain,
                                          color: primaryClNew,
                                        ),
                                      ),
                                      Positioned(
                                        top: GetDeviceType()
                                                .getDeviceType(context)
                                            ? -4
                                            : -3,
                                        right: GetDeviceType()
                                                .getDeviceType(context)
                                            ? -4
                                            : -3,
                                        child: Obx(
                                          () => Container(
                                            height: GetDeviceType()
                                                    .getDeviceType(context)
                                                ? 18
                                                : 15,
                                            width: GetDeviceType()
                                                    .getDeviceType(context)
                                                ? 18
                                                : 15,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: primaryClNew,
                                            ),
                                            child: Center(
                                              child: Text(
                                                dashboardController
                                                    .notificationCont.value,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: whiteColor,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: GetDeviceType()
                                                          .getDeviceType(
                                                              context)
                                                      ? 10
                                                      : 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  imgMoneyverssHome,
                                  height: GetDeviceType().getDeviceType(context)
                                      ? 45
                                      : 25,
                                ),
                              ),
                            ),
                          ],
                        )
                        /*Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Row(
                              children: [
                                */ /*GestureDetector(
                                  onTap: () {
                                    _onItemTapped(3);
                                  },
                                  child: Container(
                                    height: GetDeviceType().getDeviceType(context)? 45 : 35,
                                    width: GetDeviceType().getDeviceType(context)? 45 : 35,
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: userController.user.value.image != ""
                                          ? CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                              bannerImg,
                                              fit: BoxFit.fill,
                                            ),
                                        fit: BoxFit.fill,
                                        imageUrl: userController.user.value.image.toString(),
                                        placeholder: (a, b) =>
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                          : Image.asset(
                                        defult,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: GetDeviceType().getDeviceType(context)?15 : 5),*/ /*
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          "Hi ${contextCtr.user.value.customerName ?? ""}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: primaryClNew,
                                            fontFamily: semiBold,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: GetDeviceType().getDeviceType(context)? 14 : 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Image.asset(
                                  fiinzyLogo,
                                  height: GetDeviceType().getDeviceType(context)?35 : 25,
                                  width: GetDeviceType().getDeviceType(context)? 150 : 150,
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              dashboardController.markAsRead();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: GetDeviceType().getDeviceType(context)? 40 : 30,
                                  width: GetDeviceType().getDeviceType(context)? 40 : 30,
                                  padding: EdgeInsets.all(GetDeviceType().getDeviceType(context)? 10 : 6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: whiteColor,
                                  ),
                                  child: Image.asset(
                                    notificationIc,
                                    fit: BoxFit.contain,
                                    color: primaryClNew,
                                  ),
                                ),
                                Positioned(
                                  top: GetDeviceType().getDeviceType(context)? -4 : -3,
                                  right: GetDeviceType().getDeviceType(context)? -4 : -3,
                                  child: Obx(
                                        () =>
                                        Container(
                                          height: GetDeviceType().getDeviceType(context)? 18 : 15,
                                          width: GetDeviceType().getDeviceType(context)? 18 : 15,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: primaryClNew,
                                          ),
                                          child: Center(
                                            child: Text(
                                              dashboardController.notificationCont.value,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: whiteColor,
                                                fontFamily: semiBold,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: GetDeviceType().getDeviceType(context)? 10 : 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),*/
                        ),
                  ),
                  body: Column(
                    children: [
                      Obx(
                        ()=> Expanded(
                          child: widgetOptions.elementAt(dashboardController.selectedIndex.value),
                        ),
                      )
                    ],
                  ),
                  floatingActionButton: Obx(()=>Padding(
                    padding: EdgeInsets.all(6),
                    child: InkWell(
                      onTap: (){
                        dashboardController.selectedIndex.value = 4;
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 2,
                                spreadRadius: 0,
                                color: Colors.black.withOpacity(0.2525),
                              ),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            icAdd,
                            color: dashboardController.selectedIndex.value == 4 ? primaryClNew : primaryCl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  )),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: FABBottomAppBar(
                      backgroundColor: Colors.white,
                      color: primaryCl,
                      selectedColor: primaryClNew,
                      items: [
                        FABBottomAppBarItem(iconData: homeIc, text: 'Home', controller : dashboardController, ),
                        FABBottomAppBarItem(iconData: folderIc, text: 'My Files', controller : dashboardController, ),
                        FABBottomAppBarItem(iconData: percentIc, text: 'My Payout', controller : dashboardController, ),
                        FABBottomAppBarItem(iconData: userSecIc, text: 'Account', controller : dashboardController, ),
                      ],
                    ),
                  ), /*bottomNavigationBar : Container(
                    height: 65,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(-4, 1),
                          blurRadius: 30, // Blur radius
                          spreadRadius: 0, // Spread radius
                        ),
                      ],
                    ),
                    child: BottomNavigationBar(
                      selectedFontSize: 10,
                      unselectedFontSize: 10,
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      iconSize: 22,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      selectedItemColor: primaryClNew,
                      unselectedItemColor: primaryCl,
                      selectedLabelStyle: const TextStyle(
                        color: primaryClNew,
                        fontStyle: FontStyle.normal,
                        fontFamily: semiBold,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: primaryCl,
                        fontStyle: FontStyle.normal,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                      ),
                      currentIndex: _selectedIndex,
                      //New
                      onTap: _onItemTapped,
                      items: [
                        BottomNavigationBarItem(
                          icon: const ImageIcon(AssetImage(homeIc), size: 22),
                          activeIcon: Image.asset(
                            homeAcIc,
                            height: 22,
                            width: 22,
                            color: primaryClNew,
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: const ImageIcon(AssetImage(folderIc), size: 22),
                          activeIcon: Image.asset(
                            folderAcIc,
                            height: 22,
                            width: 22,
                            color: primaryClNew,
                          ),
                          label: 'My Files',
                        ),
                        BottomNavigationBarItem(
                          icon: const ImageIcon(AssetImage(addIc), size: 22),
                          activeIcon: Image.asset(
                            addAcIc,
                            height: 22,
                            width: 22,
                            color: primaryClNew,
                          ),
                          label: 'Add Leads',
                        ),
                        BottomNavigationBarItem(
                          icon: const ImageIcon(AssetImage(percentIc), size: 22),
                          activeIcon: Image.asset(
                            percentAcIc,
                            height: 22,
                            width: 22,
                            color: primaryClNew,
                          ),
                          label: 'My Payout',
                        ),
                        BottomNavigationBarItem(
                          icon: const ImageIcon(AssetImage(userSecIc), size: 22),
                          activeIcon: Image.asset(
                            accountActiveIc,
                            height: 22,
                            width: 22,
                          ),
                          label: 'Account',
                        ),
                      ],
                    ),
                  ),*/
                ),
              );
            }));
  }

  void _onItemTapped(int index) {
    setState(() {
      dashboardController.selectedIndex.value = index;
    });
  }
}
