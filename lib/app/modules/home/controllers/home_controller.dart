import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';

class HomeController extends GetxController {
  var isLodding = true.obs;
  final GlobalKey<NestedScrollViewState> globalKey = GlobalKey();
  var onTapBack = false.obs;
  var selectIndex = 0.obs;
  PageController pageController = PageController();
  //ScrollController? BodyScrollController;
  RxInt categorySelect = 5.obs;
  RxDouble endSliderValue = 0.0.obs;
  RxDouble startSliderValue = 0.0.obs;

  RxInt campusSelected = 0.obs;
  RxInt filterSelected = 0.obs;
  @override
  void onInit() {
    isLodding.value = true;
    print("isLodding.value---${isLodding.value}");

    Future.delayed(Duration(seconds: 2), () {
      isLodding.value = false;
      update();
      print("isLodding.value---${isLodding.value}");
    });
    update();
    scrollController?..addListener(listen);
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

  var isVisible = true.obs;
  listen() {
    final direction = scrollController!.position.userScrollDirection;

    if (direction == ScrollDirection.forward) {
      print("forward :jfvhvdfhvf");
      isVisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      //print("xcjvhvv ${scrollController!.offset >= scrollController!.position.maxScrollExtent}");
      print("reverse;dshbvdb");
      isVisible.value = false;
    }
  }

  List categoryList = [
    {
      'icon': "assets/icon/Clothes.png",
      'name': 'Clothes',
    },
    {
      'icon': "assets/icon/Bags.png",
      'name': 'Accessories',
    },
    // {
    //   'icon': "assets/icon/Shoes.png",
    //   'name': 'Shoes',
    // },
    {
      'icon': "assets/icon/dummbell.png",
      'name': 'Sports Gear',
    },
    {
      'icon': "assets/icon/Electornics 1.png",
      'name': 'Electronics',
    },
  ].obs;
  List offerImage = [
    assetsUrl.offerImge1,
    assetsUrl.offerIma2,
    assetsUrl.offerImge1,
  ];
  List campus = [
    "Swappit",
    "Campus",
    "Workit",
  ];

  List categoryList2 = [
    {
      'icon': "assets/icon/campusIcon1.png",
      'name': 'Education Material',
    },
    {
      'icon': "assets/icon/campusIcon2.png",
      'name': 'Project Assignment',
    },
    {
      'icon': "assets/icon/campusIcon3.png",
      'name': 'Events Activities',
    },
  ];
  List categoryList3 = [
    {
      'icon': "assets/icon/workitIcon1.png",
      'name': 'Project Offers',
    },
    {
      'icon': "assets/icon/workitIcon2.png",
      'name': 'Service Requests',
    },
    {
      'icon': "assets/icon/workitIcon3.png",
      'name': 'Collaboration Partnership',
    },
  ];

  onWilPopScope() {
    onTapBack.value = false;
  }
}
