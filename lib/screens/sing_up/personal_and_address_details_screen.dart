import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/constants/util.dart';
import 'package:fiinzy_pro/controller/user_controller.dart';
import 'package:fiinzy_pro/models/city_list_model.dart';
import 'package:fiinzy_pro/models/employment_list_model.dart';
import 'package:fiinzy_pro/models/experience_model.dart';
import 'package:fiinzy_pro/models/state_list_model.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class AddressAndPersonalDetailsScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final UserController controller;

  const AddressAndPersonalDetailsScreen({super.key, required this.onNext, required this.onPrevious, required this.controller});

  @override
  State<AddressAndPersonalDetailsScreen> createState() => _AddressAndPersonalDetailsScreenState();
}

class _AddressAndPersonalDetailsScreenState extends State<AddressAndPersonalDetailsScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<UserController>(),
        initState: (state) {
          Get.find<UserController>().getEmploymentList("");
          Get.find<UserController>().experienceListGet();
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
                      "Personal Details",
                      style: TextStyle(
                        color: blueCl,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontFamily: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 4,
                      width: 65,
                      decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Mobile Number",
                      style: TextStyle(color: draKText, fontFamily: regular, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    MyTextFormField(
                      hint: 'Enter Mobile Number',
                      controller: widget.controller.mobileNo,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      counterText: "",
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Enter Mobile Number";
                        } else if (v.length < 10) {
                          return "Enter Mobile valid Number";
                        }
                        return null;
                      },
                      obscureText: false,
                      readOnly: false,
                      border: borderNewCl,
                      fillColor: whiteColor,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Material(
                          child: Image.asset(
                            newPhoneIc,
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Full Name",
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
                      hint: 'Enter Full Name',
                      controller: widget.controller.name,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Enter Full Name";
                        }
                        return null;
                      },
                      obscureText: false,
                      readOnly: false,
                      keyboardType: TextInputType.name,
                      border: borderNewCl,
                      fillColor: whiteColor,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Material(
                          child: Image.asset(
                            newPersonIc,
                            height: 18,
                            width: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Email Address",
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
                      hint: 'Enter Email Address',
                      controller: widget.controller.email,
                      validator: widget.controller.emailValidator,
                      obscureText: false,
                      readOnly: false,
                      keyboardType: TextInputType.emailAddress,
                      border: borderNewCl,
                      fillColor: whiteColor,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Material(
                          child: Image.asset(
                            mailIcNew,
                            height: 18,
                            width: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Experience",
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
                      child: DropdownButton2<ExperienceModel?>(
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
                        value: widget.controller.experienceModel,
                        hint: const Text(
                          "Select Experience Type",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                        isExpanded: true,
                        items: widget.controller.experienceList
                            .map((s) => DropdownMenuItem<ExperienceModel>(
                                  value: s,
                                  child: Text(
                                    " ${s.title}",
                                    style: const TextStyle(
                                      fontFamily: regular,
                                      color: draKText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (ExperienceModel? value) {
                          if (value != null) {
                            setState(() {
                              widget.controller.experienceModel = value;
                              widget.controller.experienceId.value = value.title.toString();
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Employment Type",
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
                      child: DropdownButton2<EmploymentData?>(
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
                        value: widget.controller.employmentModel,
                        hint: const Text(
                          "Select Employment Type",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold),
                        isExpanded: true,
                        items: widget.controller.employmentList
                            .map((s) => DropdownMenuItem<EmploymentData>(
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
                        onChanged: (EmploymentData? value) {
                          if (value != null) {
                            setState(() {
                              widget.controller.employmentModel = value;
                              widget.controller.employmentID.value = value.id.toString();
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Select Gender",
                      style: TextStyle(
                        color: draKText,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 'male',
                          groupValue: widget.controller.gender.value,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                widget.controller.gender.value = value;
                              }
                            });
                          },
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            color: draKText,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                          ),
                        ),
                        Radio(
                          value: 'female',
                          groupValue: widget.controller.gender.value,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                widget.controller.gender.value = value;
                              }
                            });
                          },
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            color: draKText,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
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
                      counterText: "",
                      controller: widget.controller.pinCode,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
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
                            if (contextCtr.experienceId.value == "") {
                              errorToast("Select Experience");
                            } else if (contextCtr.employmentID.value == "") {
                              errorToast("Select Employment");
                            } else if (contextCtr.gender.value == "") {
                              errorToast("Select Gender");
                            } else if (contextCtr.stateId.value == "") {
                              errorToast("Select State");
                            } else if (contextCtr.cityId.value == "") {
                              errorToast("Select City");
                            } else {
                              widget.onNext();
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
          ));
        });
  }
}
