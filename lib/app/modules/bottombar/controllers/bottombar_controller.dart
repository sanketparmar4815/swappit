import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';
import 'package:swapit/app/modules/add_new_swapProduct/views/add_new_swap_product_view.dart';
import 'package:swapit/app/modules/home/views/home_view.dart';
import 'package:swapit/app/modules/majestic/views/majestic_view.dart';
import 'package:swapit/app/modules/message/views/message_view.dart';
import 'package:swapit/app/modules/my_product/views/my_product_view.dart';
import 'package:swapit/app/modules/profile/views/profile_view.dart';

class BottombarController extends GetxController {
  late PageController pageController;
  Rx<int> intPage = 0.obs;
  GlobalKey<CurvedNavigationBarState> curvedNavigationKey = GlobalKey();
  @override
  void onInit() {
    if (Get.arguments != null) {
      intPage.value = Get.arguments;
    }
    pageController = PageController(initialPage: intPage.value, keepPage: true);
    scrollController!..addListener(listenHomeView);
    scrollControllerMessage!..addListener(listenMessageView);
    scrollControllerMajestic!..addListener(listenMajesticView);
    myProductScrollController!..addListener(listenMyProductView);
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

  var isvisible = true.obs;

  listenHomeView() {
    final direction = scrollController!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombar rutik");

      isvisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombar");

      isvisible.value = false;
    }
    if (scrollController!.offset >= scrollController!.position.maxScrollExtent) {
      isvisible.value = true;
    }
  }

  listenMessageView() {
    final direction = scrollControllerMessage!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombar");
      isvisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombar");
      isvisible.value = false;
    }
    if (scrollControllerMessage!.offset >= scrollControllerMessage!.position.maxScrollExtent) {
      isvisible.value = true;
    }
  }

  listenMajesticView() {
    final direction = scrollControllerMajestic!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombar");
      isvisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombar");
      isvisible.value = false;
    }
    if (scrollControllerMajestic!.offset >= scrollControllerMajestic!.position.maxScrollExtent) {
      isvisible.value = true;
    }
  }

  listenMyProductView() {
    final direction = myProductScrollController!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombar");
      isvisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombar");
      isvisible.value = false;
    }
    if (myProductScrollController!.offset >= myProductScrollController!.position.maxScrollExtent) {
      isvisible.value = true;
    }
  }

  RxInt currentIndex = 0.obs;
  var isSelectedButton = false.obs;

  List iconList = [
    assetsUrl.Home,
    assetsUrl.ChatIcon,
    assetsUrl.addColorIcon,
    assetsUrl.productIcon,
    assetsUrl.searchBottomBarIcon,
  ];
  List iconColorList = [
    assetsUrl.HomeColorIcon,
    assetsUrl.ChatColorIcon,
    assetsUrl.addColorIcon,
    assetsUrl.ProductColorIcon,
    assetsUrl.searchBottomBarIcon,
  ];

  RxList<PageData> iconData = <PageData>[
    PageData(icon: "assets/icon/Home.png", label: "Home"),
    PageData(icon: "assets/icon/ChatIcon.png", label: "Message"),
    PageData(icon: assetsUrl.addColorIcon, label: "Add Swap"),
    PageData(
      icon: "assets/icon/productIcon.png",
      label: "My Product",
    ),
    PageData(
      icon: "assets/icon/searchBottomBarIcon.png",
      label: "My Findings",
    )
  ].obs;

  RxList screens = [
    HomeView(),
    MessageView(),
    MyProductView(),
    MajesticView(),
    AddNewSwapProductView(),
  ].obs;

  onTapBottomNavItem(int index) {
    pageController.jumpToPage(index);
  }
}

class PageData {
  String? icon;
  String? label;
  PageData({this.icon, this.label});
}
