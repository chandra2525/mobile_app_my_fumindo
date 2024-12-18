import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'asset_loan_approval_controller.dart';

class AssetLoanApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssetLoanApprovalController(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
  }
}
