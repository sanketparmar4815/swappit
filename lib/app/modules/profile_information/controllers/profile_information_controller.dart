import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swapit/app/common/constant.dart';

class ProfileInformationController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController apartmentName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zipCode = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var selectedCountryCode;
  // var currentPosition = 0.0;
  ScrollController scrollController = ScrollController();
  var numberLength = 0.obs;
  var isoCode = "IN";
  var selectedCountryCode2 = 1;
  String? errorPhone, errorProfile;
  var isError = false.obs, isErrorProfile = false.obs, onTapBack = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var imagePath, image;
  final picker = ImagePicker();

  fromCamera({argument}) async {
    final pickedFile = await picker.pickImage(source: argument == 1 ? ImageSource.camera : ImageSource.gallery);
    if (pickedFile != null) {
      //image = File(pickedFile.path);
      imagePath = pickedFile.path;
    } else {
      print('No image selected.');
    }
    update();
  }

  // checkPermission({flag}) async {
  //   PermissionStatus cameraStatus = flag == 1 ? await Permission.camera.request() : await Permission.photos.request();
  //   if (cameraStatus.isGranted == true) {
  //     fromCamera(argument: flag == 1 ? 1 : 0);
  //   } else if (cameraStatus.isPermanentlyDenied == true) {
  //     print("Media permissions are permanently denied");
  //
  //     ShowFlushbar.showFlushbar("Please Allow Media & Camera Permission", context: Get.context, backgroundColor: Colors.lightBlueAccent);
  //     Future.delayed(Duration(seconds: 2), () {
  //       openAppSettings();
  //     });
  //   } else {
  //     ShowFlushbar.showFlushbar("Please Allow Media & Camera Permission", context: Get.context, backgroundColor: Colors.lightBlueAccent);
  //   }
  // }

  // profileLoadMore() {
  //   currentPosition = scrollController.position.pixels;
  // }
}
