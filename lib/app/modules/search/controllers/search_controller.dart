import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';

class Search1Controller extends GetxController {
  TextEditingController searchText = TextEditingController();
  var isLike = [];
  var isLodding = false.obs;
  var isAnimationList = [true, true, true];
  RxDouble endSliderValue = 0.0.obs;
  RxDouble startSliderValue = 0.0.obs;
  double startValue = 0.0;
  double endValue = 0.0;
  var text = false.obs, onTapBack = false.obs;
  RxInt campusSelected = 0.obs;
  List campus = [
    "Swappit",
    "Campus",
    "Workit",
  ];
  RxInt categorySelect = 5.obs;
  List categoryList = [
    {
      'icon': "assets/icon/Clothes.png",
      'name': 'Clothes',
    },
    {
      'icon': "assets/icon/Bags.png",
      'name': 'Accessories',
    },
    {
      'icon': "assets/icon/dummbell.png",
      'name': 'Sports Gear',
    },
    {
      'icon': "assets/icon/Electornics 1.png",
      'name': 'Electronics',
    },
  ].obs;

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

  List categoryList2 = [
    {
      'icon': "assets/icon/campusIcon1.png",
      'name': 'Education\nMaterial',
    },
    {
      'icon': "assets/icon/campusIcon2.png",
      'name': 'Project\nAssignment',
    },
    {
      'icon': "assets/icon/campusIcon3.png",
      'name': 'Events\nActivities',
    },
  ];
  List categoryList3 = [
    {
      'icon': "assets/icon/workitIcon1.png",
      'name': 'Project\nOffers',
    },
    {
      'icon': "assets/icon/workitIcon2.png",
      'name': 'Service\nRequests',
    },
    {
      'icon': "assets/icon/workitIcon3.png",
      'name': 'Collaboration\nPartnership',
    },
  ];
}
