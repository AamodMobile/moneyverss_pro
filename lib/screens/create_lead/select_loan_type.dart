import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/create_lead_controller.dart';

class SelectLoanType extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final CreateLeadLoanController controller;

  const SelectLoanType({
    super.key,
    required this.onNext,
    required this.onPrevious,
    required this.controller,
  });

  @override
  State<SelectLoanType> createState() => _SelectLoanTypeState();
}

class _SelectLoanTypeState extends State<SelectLoanType> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<CreateLeadLoanController>(),
        initState: (state) {
          Get.find<CreateLeadLoanController>().dashboard();
        },
        builder: (contextCtr) {
          return Scaffold(
            backgroundColor: homeBgCl,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text(
                  "Select Loan Type",
                  style: TextStyle(color: primaryClNew, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontFamily: semiBold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 4,
                  width: 65,
                  decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 25),
                Builder(
                  builder: (context) {
                    if (contextCtr.loading) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 400,
                        child: const Center(child: CircularProgressIndicator(color: primaryClNew)),
                      );
                    }
                    if (contextCtr.loanTypeList.isEmpty) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 100,
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                              ),
                              const SizedBox(height: 14),
                              const Text(
                                "No Loan Type Found",
                                style: TextStyle(
                                  color: draKText,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFF189DFF),
                                        Color(0xFF0070C1),
                                      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                                  width: 132,
                                  height: 43,
                                  child: const Center(
                                    child: Text(
                                      "Go Back",
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
                            ],
                          ));
                    }
                    return Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: widget.controller.loanTypeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.controller.loanTypeId.value = widget.controller.loanTypeList[index].id.toString();
                                });
                              },
                              child: Container(
                                height: 54,
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: widget.controller.loanTypeId.value == widget.controller.loanTypeList[index].id.toString() ? primaryClNew : borderNewCl,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      widget.controller.loanTypeList[index].image.toString(),
                                      height: 22,
                                      width: 22,
                                      color: primaryClNew,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.controller.loanTypeList[index].name.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: draKText,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: widget.controller.loanTypeId.value == widget.controller.loanTypeList[index].id.toString() ? semiBold : medium,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: widget.controller.loanTypeId.value == widget.controller.loanTypeList[index].id.toString()
                                              ? Border.all(color: primaryClNew, width: 5)
                                              : Border.all(color: borderNewCl, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 80),
              ],
            ),
            bottomSheet: Container(
              color: screenBgCl,
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.controller.loanTypeId.value == "") {
                        final snackBar = SnackBar(
                          backgroundColor: redCl,
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.up,
                          content: const Text("Please Select Loan type"),
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
                      width: 154,
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
        });
  }
}
