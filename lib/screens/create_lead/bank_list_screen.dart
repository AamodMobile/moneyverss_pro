import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/create_lead_controller.dart';

import '../../constants/get_device_type.dart';

class BankListScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final CreateLeadLoanController controller;

  const BankListScreen({super.key, required this.onNext, required this.onPrevious, required this.controller});

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenBgCl,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Text(
            "Select Your Preferred Bank",
            style: TextStyle(color: blueCl, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontFamily: semiBold, fontSize: GetDeviceType().getDeviceType(context)?20 :16),
          ),
          const SizedBox(height: 6),
          Container(
            height: 4,
            width: 65,
            decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(height: 25),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.controller.bankList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 54, childAspectRatio: 1, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.controller.bankTypeId.value = widget.controller.bankList[index]["title"].toString();
                      });
                    },
                    child: Obx(
                      () => Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: widget.controller.bankTypeId.value == widget.controller.bankList[index]["title"].toString() ? primaryClNew : borderNewCl,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              widget.controller.bankList[index]["image"].toString(),
                              height: GetDeviceType().getDeviceType(context)? 25 : 22,
                              width: GetDeviceType().getDeviceType(context)? 25 : 22,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.controller.bankList[index]["title"].toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: draKText,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: widget.controller.bankTypeId.value == widget.controller.bankList[index]["title"].toString() ? semiBold : medium,
                                  fontSize: GetDeviceType().getDeviceType(context)? 16 : 12,
                                ),
                              ),
                            ),
                            Obx(
                              () => Container(
                                height: GetDeviceType().getDeviceType(context)? 22 : 18,
                                width: GetDeviceType().getDeviceType(context)? 22 : 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: widget.controller.bankTypeId.value == widget.controller.bankList[index]["title"].toString()
                                        ? Border.all(color: primaryClNew, width: 5)
                                        : Border.all(color: borderNewCl, width: 1)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              })
        ],
      ),
      bottomSheet: widget.controller.bankList.isEmpty?const SizedBox(): Container(
        color: screenBgCl,
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                widget.onPrevious();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primaryClNew, width: 1),
                  color: Colors.white,
                ),
                width: GetDeviceType().getDeviceType(context)? 180 : 154,
                height: 46,
                child: const Center(
                  child: Text(
                    'Previous',
                    style: TextStyle(
                      color: primaryClNew,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if ( widget.controller.bankTypeId.value=="") {
                  final snackBar = SnackBar(
                    backgroundColor: redCl,
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.up,
                    content: const Text("Please Select  Bank"),
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  widget.onNext();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF3CBFFF),
                      Color(0xFF0144DF),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                width: GetDeviceType().getDeviceType(context)? 180 : 154,
                height: 46,
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: whiteColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontFamily: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
