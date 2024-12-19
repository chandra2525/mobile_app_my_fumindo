import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../constants/endpoint.dart';
import '../../../models/loan_detail_model.dart';
import '../../../utils/networking_util.dart';
import '../../../widgets/snackbar_widget.dart';
import 'asset_loan_approval_controller.dart';

class AssetLoanApprovalDetailController extends GetxController {
  final Dio _client;
  final GetStorage _local;

  AssetLoanApprovalDetailController(
      {required Dio client, required GetStorage local})
      : _client = client,
        _local = local;

  final AssetLoanApprovalController controller =
      Get.put(AssetLoanApprovalController(
    client: Dio(),
    local: GetStorage(),
  ));

  var isLoadingLoanDetail = true.obs;
  var assetLoanDetail = Rxn<AssetLoanDetail>();
  var isDetailHide = false.obs;

  void toggleDetailHide() {
    isDetailHide.value = !isDetailHide.value;
  }

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    doGetAssetLoanDetail();
  }

  void doGetAssetLoanDetail() async {
    isLoadingLoanDetail.value = true;

    try {
      final response = await _client.get(
        "${Endpoint.loan}/${controller.loanId}",
        // data: params,
        // queryParameters: params,
        options: Options(
          headers: {
            "Authorization": "Bearer ${box.read('access_token')}",
          },
        ),
      );
      assetLoanDetail.value = AssetLoanDetail.fromJson(response.data);
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
      print(error);
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    } finally {
      isLoadingLoanDetail.value = false;
    }
  }
}
