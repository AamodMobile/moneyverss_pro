import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/screens/sing_up/sign_up_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        initState: (state) {
          Get.find<UserController>().userProfileGet();
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 75),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  alignment: Alignment.center,
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
                        "Profile",
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
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Container(
                              height: 102,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(bgProfileName), fit: BoxFit.fill)),
                              child: Column(
                                children: [
                                  const SizedBox(height: 34),
                                  Text(
                                    contextCtr.user.value.name ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "MV${contextCtr.user.value.id}",
                                    style: const TextStyle(
                                      color: primaryCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                contextCtr.pickImage(context, "profile");
                              },
                              child: Stack(
                                children: [
                                  Obx(
                                    () => Container(
                                      height: 52,
                                      width: 52,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: primaryClNew, width: 0.5),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(27),
                                          child: contextCtr.user.value.image != ""
                                              ? CachedNetworkImage(
                                                  errorWidget: (context, url, error) => Image.asset(
                                                    defult,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  fit: BoxFit.fill,
                                                  height: 52,
                                                  width: 52,
                                                  imageUrl: userController.user.value.image.toString(),
                                                  placeholder: (a, b) => const Center(
                                                    child: CircularProgressIndicator(),
                                                  ),
                                                )
                                              : contextCtr.profileImage.value.path != ""
                                                  ? Image.file(
                                                      File(contextCtr.profileImage.value.path),
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(demoProfile)),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 1,
                                      right: 1,
                                      child: Image.asset(
                                        camrea,
                                        height: 22,
                                        width: 22,
                                        fit: BoxFit.fill,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: whiteColor, boxShadow: [BoxShadow(offset: const Offset(0, 1), blurRadius: 5, spreadRadius: 0, color: Colors.black.withOpacity(0.12))]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Personal Details",
                              style: TextStyle(
                                color: draKText,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const SignUpScreen(isEdit: true,));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: primaryClNew, width: 1),
                                  color: Colors.white,
                                ),
                                width: 42,
                                height: 20,
                                child: const Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: primaryClNew,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: medium,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 23),
                        Row(children: [
                          Image.asset(
                            newPersonIc,
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(
                                  color: primaryCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                contextCtr.user.value.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ]),
                        const SizedBox(height: 14),
                        const Divider(
                          color: appBarClNew1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          Image.asset(
                            newPhoneIc,
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mobile Number",
                                style: TextStyle(
                                  color: primaryCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "+91 ${contextCtr.user.value.mobileNo ?? ""}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ]),
                        const SizedBox(height: 14),
                        const Divider(
                          color: appBarClNew1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          Image.asset(
                            mailIcNew,
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email Id",
                                style: TextStyle(
                                  color: primaryCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                contextCtr.user.value.email ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ]),
                        const SizedBox(height: 14),
                        const Divider(
                          color: appBarClNew1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          Image.asset(
                            newPersonIc,
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employment Type",
                                style: TextStyle(
                                  color: primaryCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                contextCtr.user.value.employmentName.toString() ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ]),
                        const SizedBox(height: 14),
                        const Divider(
                          color: appBarClNew1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                        Row(children: [
                          Image.asset(
                            newPersonIc,
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Experience",
                                style: TextStyle(
                                  color: primaryCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                contextCtr.user.value.experience ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )
                        ]),
                        const SizedBox(height: 14),
                        const Divider(
                          color: appBarClNew1,
                          height: 1,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
