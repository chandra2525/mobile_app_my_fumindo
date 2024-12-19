import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'asset_loan_approval_detail_controller.dart';

class AssetLoanApprovalDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AssetLoanApprovalDetailController(
      client: Get.find<Dio>(),
      local: Get.find<GetStorage>(),
    ));
  }
}
