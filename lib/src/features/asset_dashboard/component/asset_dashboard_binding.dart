import 'package:dio/dio.dart';
import 'package:mobile_app_my_fumindo/src/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'asset_dashboard_controller.dart';

class AssetDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));

    Get.put(AssetDashboardController(
      userRepository: Get.find<UserRepository>(),
    ));
  }
}
