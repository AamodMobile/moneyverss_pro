import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/dg_locker_controller.dart';
import 'package:fiinzy_pro/service/api_logs.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class UploadDocumentScreen extends StatefulWidget {
  final String title;
  final String value;
  final String image;

  const UploadDocumentScreen({super.key, required this.title, required this.value, required this.image});

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  File? pickedImageFile;
  File? image1;
  final ImagePicker picker = ImagePicker();
  DGLockerController controller = Get.put(DGLockerController());

  @override
  void initState() {
    controller.panCard.value = File("");
    controller.aadhaarCard.value = File("");
    controller.drivingLicence.value = File("");
    controller.bankDetails.value = File("");
    controller.otherDocuments.value = File("");
    controller.aadhaarCardBack.value = File("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 65),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: const BoxDecoration(color: homeBgCl),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 22,
                      width: 22,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(color: primaryClNew, borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                          size: 14,
                        ),
                      ),
                    )),
                const SizedBox(width: 20),
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: draKText,
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 14,
              ),
              Text(
                "${widget.title} Front Image",
                style: const TextStyle(
                  color: secondaryCl,
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                height: 195,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    galleryBottomSheet(context, widget.value);
                  },
                  child: image1?.path != "" && image1?.path != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            image1!,
                            height: 195,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          ),
                        )
                      : widget.image != ""
                          ? CachedNetworkImage(
                              errorWidget: (context, url, error) => Image.asset(
                                bannerImg,
                                fit: BoxFit.fill,
                              ),
                              fit: BoxFit.fill,
                              height: 195,
                              width: MediaQuery.of(context).size.width,
                              imageUrl: widget.image.toString(),
                              placeholder: (a, b) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Image.asset(
                              uploadImg,
                              height: 195,
                              width: MediaQuery.of(context).size.width,
                            ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              widget.title == "Aadhar Card"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Aadhaar Back Image",
                          style: TextStyle(color: secondaryCl, fontFamily: medium, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        InkWell(
                          onTap: () {
                            galleryBottomSheet(context, "${widget.value}Back");
                          },
                          child: controller.aadhaarCardBack.value.path == ""
                              ? Image.asset(
                                  uploadImg,
                                  height: 195,
                                  width: MediaQuery.of(context).size.width,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    controller.aadhaarCardBack.value,
                                    height: 195,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const Spacer(),
              GestureDetector(
                onTap: () {

                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(colors: [
                          Color(0xFF189DFF),
                          Color(0xFF0070C1),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void galleryBottomSheet(BuildContext ctx, String tittle) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery, ctx, tittle);
                  },
                  leading: const Icon(Icons.photo_album),
                  title: const Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera, ctx, tittle);
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: const Icon(Icons.close),
                  title: const Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void _getImage(ImageSource source, BuildContext context, String title) async {
      try {
        final XFile? pickedFile = await picker.pickImage(
          source: source,
        );
        setState(() {
          pickedImageFile = File(pickedFile!.path);
        });
        await cropImage(title);
      } catch (e) {
        Log.console("Error while picking image $e");
      }
    }

  Future<void> cropImage(String title) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(toolbarTitle: "Crop Image", toolbarColor: secondaryCl, toolbarWidgetColor: Colors.white, initAspectRatio: CropAspectRatioPreset.original, lockAspectRatio: false),
          IOSUiSettings(
            title: "Crop Image",
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          if (title == "panCard") {
            controller.panCard.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "aadhaarCard") {
            controller.aadhaarCard.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "drivingLicence") {
            controller.drivingLicence.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "bankDetails") {
            controller.bankDetails.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else if (title == "otherDocuments") {
            controller.otherDocuments.value = File(croppedFile.path);
            image1 = File(croppedFile.path);
          } else {
            controller.aadhaarCardBack.value = File(croppedFile.path);
          }
        });
      }
    } catch (e) {
      Log.console("Crash error ${e.toString()}");
    }
  }
}
