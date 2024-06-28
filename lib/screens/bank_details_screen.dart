import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/screens/leads_form_screen.dart';
import 'package:fiinzy_pro/widget/my_button.dart';

class BankDetailsScreen extends StatefulWidget {
  final String title;
  const BankDetailsScreen({super.key, required this.title});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  int bank = -1;

  final List bankList = [
    {
      'title': 'HDFC',
      'image': "assets/images/hdfc.png",
    },
    {
      'title': 'SBI',
      'image': "assets/images/sbi.png",
    },
    {
      'title': 'YES',
      'image': "assets/images/yes.png",
    },
    {
      'title': 'Axis',
      'image': "assets/images/axis.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: homeBgCl,
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
                 Text(
                  widget.title,
                  style: const TextStyle(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
        child: Column(
          children: [
            GridView.builder(
                shrinkWrap: true,
                itemCount: bankList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 62,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        bank = index;
                      });
                    },
                    child: Container(
                      height: 62,
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: primaryCl,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                bankList[index]["image"],
                                height: 20,
                                width: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                bankList[index]["title"],
                                style: const TextStyle(
                                  color: secondaryCl,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: medium,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: bank == index
                                    ? Border.all(color: secondaryCl, width: 5)
                                    : Border.all(color: primaryCl, width: 1)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 40,
                width: 150,
                child: MyButton(
                  onPressed: () {
                    if (bank == -1) {
                      final snackBar = SnackBar(
                        backgroundColor: redCl,
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: const Text("Please Select Bank"),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                     Get.to(()=>const LeadsFormScreen());
                    }
                  },
                  color: secondaryCl,
                  child: const Text(
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
            const SizedBox(height: 30)
          ],
        ),
      ),
    ));
  }
}
