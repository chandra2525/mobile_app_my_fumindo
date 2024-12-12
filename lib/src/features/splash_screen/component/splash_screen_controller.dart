import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../app/routes/route_name.dart';

class SplashScreenController extends GetxController {
  var version = "".obs;

  @override
  void onInit() {
    super.onInit();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      // String appName = packageInfo.appName;
      // String packageName = packageInfo.packageName;
      version.value = packageInfo.version;
      // String buildNumber = packageInfo.buildNumber;
    });

    Future.delayed(const Duration(seconds: 3), () {
      final box = GetStorage();
      final isLoggedIn = box.read('access_token') != null;

      final isOnboardingSeen = box.read('onboardingSeen') ?? false;
      print("isOnboardingSeen ${isOnboardingSeen}");

      // if (isOnboardingSeen == false) {
      //   Get.offAllNamed(RouteName.boarding);
      // } else {
      Get.offAllNamed(isLoggedIn ? RouteName.dashboard : RouteName.login);
      // }
    });
  }
}
