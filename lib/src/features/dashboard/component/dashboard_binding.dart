import 'package:dio/dio.dart';
import 'package:mobile_app_my_fumindo/src/features/dashboard/component/dashboard_controller.dart';
import 'package:mobile_app_my_fumindo/src/features/dashboard/products/list/component/product_list_controller.dart';
import 'package:mobile_app_my_fumindo/src/repositories/asset_repository.dart';
import 'package:mobile_app_my_fumindo/src/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../dev/component/dev_controller.dart';
import '../products/detail_product/component/product_detail_controller.dart';
import '../../asset/component/asset_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));

    // Get.put(ProductRepository(
    //   client: Get.find<Dio>(),
    //   local: Get.find<GetStorage>(),
    // ));

    // Get.put(
    //   DashboardController(),
    // );

    Get.put(DashboardController(
      userRepository: Get.find<UserRepository>(),
    ));

    Get.put(AssetController(
      userRepository: Get.find<UserRepository>(),
    ));

    Get.put(
      DevController(),
    );

    // Get.put(ProductListController(
    //   productRepository: Get.find<ProductRepository>(),
    // ));

    // Get.put(ProductDetailController(
    //   productRepository: Get.find<ProductRepository>(),
    // ));
  }
}
