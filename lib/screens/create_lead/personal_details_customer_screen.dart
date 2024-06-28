import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/create_lead_controller.dart';
import 'package:fiinzy_pro/models/employment_list_model.dart';
import 'package:fiinzy_pro/widget/text_filed_widget.dart';

class PersonalDetailsCustomer extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final CreateLeadLoanController controller;

  const PersonalDetailsCustomer({super.key, required this.onNext, required this.onPrevious, required this.controller});

  @override
  State<PersonalDetailsCustomer> createState() => _PersonalDetailsCustomerState();
}

class _PersonalDetailsCustomerState extends State<PersonalDetailsCustomer> {
  final formKey = GlobalKey<FormState>();

  //late AudioPlayer audioPlayer;
  String pathToAudio = "";
  //bool _playAudio = false;
  bool isRecord = false;
  bool isShow = false;

  // FlutterSoundRecorder _recordingSession = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    // initializer();
    widget.controller.employmentModel = null;
    widget.controller.occupationsModel = null;
    // audioPlayer = AudioPlayer();
  }

/*  void initializer() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/recorded_audio_pro.wav');
    pathToAudio = file.path;
    _recordingSession = FlutterSoundRecorder();
    await _recordingSession.openAudioSession(focus: AudioFocus.requestFocusAndStopOthers, category: SessionCategory.playAndRecord, mode: SessionMode.modeDefault, device: AudioDevice.speaker);
    await _recordingSession.setSubscriptionDuration(const Duration(milliseconds: 10));
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }*/

  /*Future<void> playFunc() async {
    try {
      audioPlayer.play(DeviceFileSource(pathToAudio));
    } catch (e) {
      Log.console(e);
    }
  }

  Future<void> stopPlayFunc() async {
    audioPlayer.stop();
  }*/
/*
  Future<void> startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    final pathToDirectory = directory.path;
    Directory(directory.path).createSync(recursive: true);
    final filePath = '$pathToDirectory/recorded_audio_pro.wav';
    pathToAudio = filePath;
    widget.controller.pathToAudio.value = pathToAudio;
    _recordingSession.openAudioSession();
    await _recordingSession.startRecorder(
      toFile: filePath,
      codec: Codec.pcm16WAV,
    );
    StreamSubscription recorderSubscription = _recordingSession.onProgress!.listen((e) {});
    recorderSubscription.cancel();
  }

  Future<String?> stopRecording() async {
    isShow = true;
    _recordingSession.closeAudioSession();
    return await _recordingSession.stopRecorder();
  }*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<CreateLeadLoanController>(),
        initState: (state) {
          Get.find<CreateLeadLoanController>().getEmploymentList(widget.controller.loanTypeId.value);
          Get.find<CreateLeadLoanController>().occupationsApi();
        },
        builder: (contextCtr) {
          return Scaffold(
            backgroundColor: homeBgCl,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                        color: primaryClNew,
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
                      decoration: BoxDecoration(
                        color: primaryClNew,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Mobile Number",
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
                      hint: 'Enter Mobile Number',
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      counterText: "",
                      controller: widget.controller.mobileNo,
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
                          return "Enter full name";
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
                      controller: widget.controller.emailAddress,
                      validator: (v) {
                        return widget.controller.emailValidator(v!);
                      },
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
                    /*const Text(
                      "Occupation",
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
                      child: DropdownButton2<OccupationsModel?>(
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
                        value: widget.controller.occupationsModel,
                        hint: const Text(
                          "Select Occupation",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontFamily: regular,
                            fontSize: 12,
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        isExpanded: true,
                        items: widget.controller.occupationsList
                            .map((s) => DropdownMenuItem<OccupationsModel>(
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
                        onChanged: (OccupationsModel? value) {
                          if (value != null) {
                            setState(() {
                              widget.controller.occupationsModel = value;
                              widget.controller.occupationID.value =
                                  value.id.toString();
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),*/
                    const Text(
                      "Loan Amount",
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
                      hint: 'Enter Loan Amount',
                      controller: widget.controller.loanAmount,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Enter Loan Amount";
                        }
                        return null;
                      },
                      obscureText: false,
                      readOnly: false,
                      keyboardType: TextInputType.number,
                      border: borderNewCl,
                      fillColor: whiteColor,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Material(
                          child: Image.asset(
                            rupeeRoundIc,
                            height: 18,
                            width: 18,
                          ),
                        ),
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
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 'male',
                            groupValue: widget.controller.gender,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  widget.controller.gender = value;
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
                            groupValue: widget.controller.gender,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  widget.controller.gender = value;
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
                    ),
                    const SizedBox(height: 16),
                    /*  isShow
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 49,
                            decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(4), border: Border.all(color: appBarClNew1, width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isShow = false;
                                        !_playAudio;
                                        stopPlayFunc();
                                        widget.controller.pathToAudio.value = "";
                                      });
                                    },
                                    child: Image.asset(
                                      deleteIcNew,
                                      height: 24,
                                      width: 24,
                                    )),
                                const SizedBox(
                                  width: 26,
                                ),
                                _playAudio
                                    ? const Expanded(child: WaveAnimation())
                                    : Image.asset(
                                        wave,
                                        height: 24,
                                        fit: BoxFit.fill,
                                      ),
                                const SizedBox(
                                  width: 26,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _playAudio = !_playAudio;
                                      });
                                      if (_playAudio) playFunc();
                                      if (!_playAudio) stopPlayFunc();
                                      setState(() {});
                                    },
                                    child: _playAudio
                                        ? const Icon(
                                            Icons.stop,
                                            size: 24,
                                            color: redCl,
                                          )
                                        : Image.asset(
                                            play,
                                            height: 24,
                                            width: 24,
                                          )),
                              ],
                            ),
                          )
                        : MyTextFormField(
                            hint: 'Add Your Voice Message',
                            */ /* validator: (v) {
                              if (v!.isEmpty) {
                                return "Add Your Voice Message";
                              }
                              return null;
                            },*/ /*
                            obscureText: false,
                            readOnly: true,
                            keyboardType: TextInputType.name,
                            border: borderNewCl,
                            fillColor: whiteColor,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isRecord = !isRecord;
                                });
                                if (isRecord) startRecording();
                                if (!isRecord) stopRecording();
                                setState(() {});
                              },
                              child: Padding(
                                padding: EdgeInsets.all(isRecord ? 2 : 14),
                                child: Material(
                                  child: isRecord
                                      ? Image.asset(
                                          recordGif,
                                          height: 25,
                                          width: 25,
                                        )
                                      : Image.asset(
                                          voiceIc,
                                          height: 25,
                                          width: 25,
                                        ),
                                ),
                              ),
                            ),
                          ),*/
                    const SizedBox(height: 80)
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              color: screenBgCl,
              width: MediaQuery.of(context).size.width,
              height: 60,
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
                      width: 154,
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
                      if (formKey.currentState!.validate()) {
                        widget.onNext();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(colors: [
                            Color(0xFF189DFF),
                            Color(0xFF0070C1),
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

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({super.key});

  @override
  State<WaveAnimation> createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + _controller.value * 0.1,
          child: Image.asset(
            wave,
            height: 24,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
