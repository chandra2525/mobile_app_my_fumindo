import 'package:dio/dio.dart';
import 'package:mobile_app_my_fumindo/src/constants/color.dart';
import 'package:mobile_app_my_fumindo/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../app/routes/route_name.dart';
import '../../../constants/endpoint.dart';
import '../../../constants/text_style.dart';
import '../../../models/loan_model.dart';
import '../../../utils/networking_util.dart';
import '../../../widgets/snackbar_widget.dart';
import '../../dashboard/web_page/web_page.dart';

class AssetLoanApprovalController extends GetxController {
  final Dio _client;
  final GetStorage _local;
  // final box = GetStorage();

  AssetLoanApprovalController({required Dio client, required GetStorage local})
      : _client = client,
        _local = local;

  var loans = <LoanModel>[].obs;

  var globalSearchLoan = "".obs;
  var sortColumnLoan = "loan_id".obs;
  var sortOrderLoan = "DESC".obs;
  var currentPageLoan = 1.obs;
  var pageSizeLoan = 10.obs;

  RxBool isSearchingLoan = false.obs;
  var searchControllerLoan = TextEditingController();
  var isLoadingLoan = true.obs;

  var selectedAssetIdsLoan = <String>[].obs;
  var selectedAssetNamesLoan = <String>[].obs;
  var selectedAssetQuantitiesLoan = <int>[].obs;

  RefreshController refreshControllerLoan =
      RefreshController(initialRefresh: false);

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    doGetAssetLoan(isLoadMore: false);
  }

  void toggleSearchLoan() {
    isSearchingLoan.value = !isSearchingLoan.value;
  }

  void clearTextLoan() {
    searchControllerLoan.clear();
  }

  void doGetAssetLoan({bool isLoadMore = false}) async {
    if (isLoadMore) {
      currentPageLoan.value++;
    } else {
      currentPageLoan.value = 1; // Reset page saat refresh
      loans.clear(); // Bersihkan data sebelumnya jika refresh
    }

    isLoadingLoan.value = true;
    var params = {
      "search": globalSearchLoan.value,
      "order_by": sortColumnLoan.value,
      "order_direction": sortOrderLoan.value,
      "page": currentPageLoan.value,
      "pageSize": pageSizeLoan.value,
    };

    try {
      final response = await _client.get(
        Endpoint.loan,
        // data: params,
        queryParameters: params,
        options: Options(
          headers: {
            "Authorization": "Bearer ${box.read('access_token')}",
          },
        ),
      );

      // Parsing data API
      final List<dynamic> rows = response.data['rows'];
      final List<LoanModel> newLoans = rows
          .map((json) => LoanModel.fromJson(json))
          .toList()
          .cast<LoanModel>();

      // Tambahkan data baru ke daftar jika load more
      if (isLoadMore) {
        loans.addAll(newLoans);
        loans.refresh();
      } else {
        loans.value = newLoans;
      }

      // Selesai loading jika data kurang dari pageSizeLoan
      if (newLoans.length < pageSizeLoan.value) {
        refreshControllerLoan.loadNoData();
      } else {
        refreshControllerLoan.loadComplete();
      }
      print("Data loan bahan berhasil dimuat: ${loans.length}");
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(
          NetworkingUtil.errorMessage('Gagal mengambil nama aset'));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    } finally {
      isLoadingLoan.value = false;
    }
  }
}
