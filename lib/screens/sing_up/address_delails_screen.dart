import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/models/city_list_model.dart';
import 'package:fiinzy_pro/models/state_list_model.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class AddressDetails extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final UserController controller;

  const AddressDetails({super.key, required this.onNext, required this.onPrevious, required this.controller});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        initState: (state) {
          Get.find<UserController>().getStateList();
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              resizeToAvoidBottomInset: false,
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      const Text(
                        "Address Details",
                        style: TextStyle(color: blueCl, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontFamily: semiBold, fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 4,
                        width: 65,
                        decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "State",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<StateListModel?>(
                          buttonStyleData: ButtonStyleData(
                            height: 45,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromRGBO(85, 153, 255, 0.43),
                              ),
                              color: Colors.white,
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: ImageIcon(
                              AssetImage(arrowDropDown),
                              size: 12,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.black,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width * 0.90,
                            useSafeArea: true,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 45,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                          isDense: true,
                          value: widget.controller.stateModel,
                          hint: const Text(
                            "Select State",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontFamily: regular,
                              fontSize: 12,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                          isExpanded: true,
                          items: widget.controller.stateList
                              .map((s) => DropdownMenuItem<StateListModel>(
                                    value: s,
                                    child: Text(
                                      " ${s.name}",
                                      style: const TextStyle(
                                        fontFamily: regular,
                                        color: draKText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (StateListModel? value) {
                            if (value != null) {
                              setState(() {
                                widget.controller.stateModel = value;
                                widget.controller.stateId.value = value.stateId.toString();
                                widget.controller.getCityList(widget.controller.stateId.value);
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "City",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<CityData?>(
                          buttonStyleData: ButtonStyleData(
                            height: 45,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color.fromRGBO(85, 153, 255, 0.43),
                              ),
                              color: Colors.white,
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: ImageIcon(
                              AssetImage(arrowDropDown),
                              size: 12,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.black,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width * 0.90,
                            useSafeArea: true,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 45,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                          isDense: true,
                          value: widget.controller.cityModel,
                          hint: const Text(
                            "Select City",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              fontFamily: regular,
                              fontSize: 12,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                          isExpanded: true,
                          items: widget.controller.cityList
                              .map((s) => DropdownMenuItem<CityData>(
                                    value: s,
                                    child: Text(
                                      " ${s.name}",
                                      style: const TextStyle(
                                        fontFamily: regular,
                                        color: draKText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (CityData? value) {
                            if (value != null) {
                              setState(() {
                                widget.controller.cityModel = value;
                                widget.controller.cityId.value = value.cityCode.toString();
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Pin Code",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      MyTextFormField(
                        hint: 'Enter Pin code',
                        controller: widget.controller.pinCode,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        counterText: "",
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter Pin code";
                          }
                          return null;
                        },
                        obscureText: false,
                        readOnly: false,
                        border: borderNewCl,
                        fillColor: whiteColor,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Address",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      MyTextFormField(
                        hint: 'Enter Address',
                        controller: widget.controller.address,
                        maxLines: 4,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter Address";
                          }
                          return null;
                        },
                        obscureText: false,
                        readOnly: false,
                        keyboardType: TextInputType.name,
                        border: borderNewCl,
                        fillColor: whiteColor,
                      ),
                      const SizedBox(height: 100)
                    ],
                  ),
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
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              var result = await widget.controller.updateProfile();
                              if (result == true) {
                                widget.onNext();
                                successToast(" Address Details Update");
                              } else {
                                errorToast("something want wrong");
                              }
                            }
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
                                "Submit",
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
            ),
          );
        });
  }
}
