import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

colors color = colors();

final customerIndicator = SpinKitCircle(color: color.appColor, size: 50.0);

class colors {
  //Color appColor = Color(0xff41975D);
  Color appColor = Color(0xff07BC7A);
  Color black = Colors.black;
  Color white = Colors.white;
  Color grey = Colors.grey;
  Color greyText = Color(0xffCCE1FF);
  Color transparent = Colors.transparent;
}

class ShowFlushbar {
  static showFlushbar(String message, {int second = 3, title, context, backgroundColor, borderColor, icon, messageColor}) {
    Flushbar(
      title: title,
      message: message,
      messageSize: 16.0,
      icon: icon,
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      messageColor: messageColor ?? Colors.white,
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: second),
    )..show(context);
  }
}

/// ===================== CAMERA & AUDIO PERMISSION ================== ///

Future<bool> cameraAudioPermission({flag}) async {
  PermissionStatus cameraStatus = flag == 1 ? await Permission.camera.request() : await Permission.storage.request();

  if (cameraStatus == PermissionStatus.granted) {
    // Toasty.showToast("All Permission granted");
    // return createTokenApi();
    return true;
  } else if (cameraStatus == PermissionStatus.denied) {
    ShowFlushbar.showFlushbar(
      "Please Allow Media & Camera Permission",
      context: Get.context,
      backgroundColor: Color(0xFFE1F5FE),
      messageColor: Colors.black,
      borderColor: Color(0xFFB3E5FC),
      icon: Icon(
        Icons.info_outline,
        color: Colors.black,
        size: 25,
      ),
    );
    bool showRationale = await Permission.storage.shouldShowRequestRationale;
    if (!showRationale) {
      await Permission.camera.request();
    }
    return false;
  } else if (cameraStatus == PermissionStatus.permanentlyDenied) {
    ShowFlushbar.showFlushbar(
      "Please Allow Media & Camera Permission",
      context: Get.context,
      backgroundColor: Color(0xFFE1F5FE),
      messageColor: Colors.black,
      borderColor: Color(0xFFB3E5FC),
      icon: Icon(
        Icons.info_outline,
        color: Colors.black,
        size: 25,
      ),
    );
    openAppSettings();
    return false;
  }
  return false;
}

var device_id;
var device_type;
getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    device_type = 2;
    var iosDeviceInfo = await deviceInfo.iosInfo;
    device_id = iosDeviceInfo.identifierForVendor;
    print('Device ID: ' + device_id);
  } else {
    device_type = 1;
    var androidDeviceInfo = await deviceInfo.androidInfo;
    device_id = androidDeviceInfo.id;
    print('Device ID: ' + device_id);
  }
}

ScrollController? scrollController = ScrollController();
ScrollController? scrollControllerMessage = ScrollController();
ScrollController? myProductScrollController = ScrollController();
ScrollController? scrollControllerMajestic = ScrollController();
var isShowBottomBar;

class AnimationType extends StatelessWidget {
  final bool fadeInLeft;
  final Widget child;

  AnimationType({required this.fadeInLeft, required this.child});

  @override
  Widget build(BuildContext context) {
    return fadeInLeft
        ? FadeInLeft(
            child: child,
            duration: Duration(milliseconds: 300),
          )
        : FadeInRight(
            child: child,
            duration: Duration(milliseconds: 300),
          );
  }
}

// ConnectSocket({userId}) {
//   socket = io(
//     '${BaseUrl}',
//     <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': true,
//       'reconnection': true
//     },
//   );

// socket?.on(
// 'connect',
// (data) => {
// socket?.emit('socket_register', {
// 'user_id': userId,
// }),
// socketID = socket?.id,
// // onlineEmit(),
// Future.delayed(Duration(seconds: 2), () {
// box.write('socket_id', socketID);
// }),
// },);
// socket!.onDisconnect((_) {
// // offline();
// print('disconnect');
// });
//
// socket!.onConnectError((data) {
// print('Connect error: $data');
// });
//
// socket!.onConnectTimeout((data) {
// print('Connect timeout: $data');
// });
//
// socket!.onError((data) {
// print('Error: $data');
// });
//
// }
