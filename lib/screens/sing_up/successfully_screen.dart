import 'package:fiinzy_pro/constants/constants.dart';

class SuccessfullyCreated extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const SuccessfullyCreated({super.key, required this.onNext, required this.onPrevious});

  @override
  State<SuccessfullyCreated> createState() => _SuccessfullyCreatedState();
}

class _SuccessfullyCreatedState extends State<SuccessfullyCreated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: homeBgCl,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 86),
            Image.asset(
              successfullyCreatedImg,
              height: 252,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 86),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "successfully created your profile",
                style: TextStyle(
                  color: Color(0xFF00960F),
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Your application is currently undergoing verification, and we will provide a response within 48 hours.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryCl,
                  fontFamily: regular,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
      bottomSheet: Container(
        color: homeBgCl,
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    widget.onNext();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF3CBFFF),
                          Color(0xFF0144DF),
                        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                    width: 200,
                    height: 46,
                    child: const Center(
                      child: Text(
                        "OK",
                        style: TextStyle(
                          color: whiteColor,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
