import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'asset_loan_form_controller.dart';

class AssetLoanFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssetLoanFormController(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
  }
}
