import 'dart:async';
import 'package:get/get.dart';
import 'package:swapit/app/modules/onboarding/views/onboarding_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Rout();
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

  Rout() {
    Timer(
      Duration(seconds: 4),
      () => Get.offAll(OnboardingView(), transition: Transition.rightToLeft),
    );
  }
}
//
// <key>NSAppTransportSecurity</key>
// <dict>
// <key>NSAllowsArbitraryLoads</key><true/>
// </dict>

// var internetCheckerSubscription;
//
//
// internetCheckerSubscription.cancel();
//
// void internetConnectivityChecker() {
//   print("knsuihscycyud");
//   subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
//     print("result========>$result");
//     isDeviceConnected = await InternetConnectionChecker().hasConnection;
//     if (!isDeviceConnected) {
//       isAlertSet = true;
//       print("------------ Connectivity loss --------------");
//       toasty.showToast("You're offline! Check Your internet connection.", backgroundColor: color.errorColor, borderColor: color.errorBorderColor);
//     } else {
//       print("------------ Connectivity done --------------");
//       if (isAlertSet == true) {
//         toasty.showToast("You're back online!", backgroundColor: color.successColor, borderColor: color.successBorderColor);
//       }
//     }
//   });
// }
//
// bool isDeviceConnected = false;
// var subscription;
// bool isAlertSet = false;

// Future<void> internetChecker() async {
//   print("jcnsuygcydugc");
//   internetCheckerSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
//     isDeviceConnected = await InternetConnectionChecker().hasConnection;
//     if (!isDeviceConnected) {
//       print("------------ Connectivity loss --------------");
//     } else {
//       print("------------ Connectivity done --------------");
//       getProfileApi();
//     }
//   });
// }
