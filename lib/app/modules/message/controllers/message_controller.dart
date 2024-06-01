import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swapit/app/common/assets_imges.dart';
import 'package:swapit/app/common/constant.dart';

class MessageController extends GetxController {
  var isLoading = true.obs;
  ScrollController? messageBodyController;
  @override
  void onInit() {
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      update();
      print("isLodding.value---${isLoading.value}");
    });
    scrollControllerMessage?..addListener(listenMessageView);
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
  listenMessageView() {
    final direction = scrollControllerMessage!.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      print("forward ->> bottombarfokvfokvfb");
      isVisible.value = true;
    }
    if (direction == ScrollDirection.reverse) {
      print("reverse ->> bottombarfbl,fbf");
      isVisible.value = false;
    }
  }

  List messageList = [
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'Typing...',
    },
    {
      'image': assetsUrl.messageProfile,
      'name': 'Grace Moore',
      'text': 'I Am Interested',
    },
    {
      'image': assetsUrl.messageProfile2,
      'name': 'Carmen Adele',
      'text': 'Hello',
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'What are you Doing Now?',
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'Typing...',
    },
    {
      'image': assetsUrl.messageProfile,
      'name': 'Grace Moore',
      'text': 'I Am Interested',
    },
    {
      'image': assetsUrl.messageProfile2,
      'name': 'Carmen Adele',
      'text': 'Hello',
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'Typing...',
    },
    {
      'image': assetsUrl.messageProfile,
      'name': 'Grace Moore',
      'text': 'I Am Interested',
    },
    {
      'image': assetsUrl.messageProfile2,
      'name': 'Carmen Adele',
      'text': 'Hello',
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'What are you Doing Now?',
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'Typing...',
    },
    {
      'image': assetsUrl.messageProfile,
      'name': 'Grace Moore',
      'text': 'I Am Interested',
    },
    {
      'image': assetsUrl.messageProfile2,
      'name': 'Carmen Adele',
      'text': 'Hello',
    },
    {
      'image': assetsUrl.searchProfileImg,
      'name': 'Carmen Adele',
      'text': 'What are you Doing Now?',
    },
  ];
}
