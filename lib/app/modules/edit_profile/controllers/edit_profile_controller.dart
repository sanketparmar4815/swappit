import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  var onTapBack = false.obs;
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
  var isError = false.obs, isErrorProfile = false.obs;
  @override
  void onInit() {
    firstName.text = "Eleanor ";
    lastname.text = "Pena";
    mobileNumber.text = "98658958566";
    streetAddress.text = "California, US";
    apartmentName.text = "125, Blocker Street";
    city.text = "New York";
    state.text = "USA";
    zipCode.text = "214578";
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

  var imagePath, image, isPlashHolder = false;
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
}
