import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../constants/endpoint.dart';
import '../../../models/customer_model.dart';
import '../../../models/material_model.dart';
import '../../../utils/networking_util.dart';
import '../../../widgets/snackbar_widget.dart';

class AssetLoanFormController extends GetxController {
  final Dio _client;
  final GetStorage _local;

  AssetLoanFormController({required Dio client, required GetStorage local})
      : _client = client,
        _local = local;

  var customers = <CustomerModel>[].obs;
  var materials = <AssetNameModel>[].obs;
  var tools = <AssetNameModel>[].obs;

  var globalSearchCustomer = "".obs;
  var sortColumnCustomer = "customer_id".obs;
  var sortOrderCustomer = "DESC".obs;
  var currentPageCustomer = 1.obs;
  var pageSizeCustomer = 10.obs;

  var globalSearchMaterial = "".obs;
  var sortColumnMaterial = "asset_id".obs;
  var sortOrderMaterial = "DESC".obs;
  var currentPageMaterial = 1.obs;
  var pageSizeMaterial = 10.obs;

  var globalSearchTool = "".obs;
  var sortColumnTool = "asset_id".obs;
  var sortOrderTool = "DESC".obs;
  var currentPageTool = 1.obs;
  var pageSizeTool = 10.obs;

  RxBool isSearchingCustomer = false.obs;
  RxBool isSearchingMaterial = false.obs;
  RxBool isSearchingTool = false.obs;

  var searchControllerCustomer = TextEditingController();
  var searchControllerMaterial = TextEditingController();
  var searchControllerTool = TextEditingController();

  var isLoadingCustomer = true.obs;
  var isLoadingMaterial = true.obs;
  var isLoadingTool = true.obs;
  var isLoadingAddLoan = false.obs;

  var selectedCustomerId = "".obs;
  var selectedCustomerName = "".obs;

  var selectedAssetIdsMaterial = <String>[].obs;
  var selectedAssetNamesMaterial = <String>[].obs;
  var selectedAssetQuantitiesMaterial = <int>[].obs;

  var selectedAssetIdsTool = <String>[].obs;
  var selectedAssetNamesTool = <String>[].obs;
  var selectedAssetQuantitiesTool = <int>[].obs;

  final etUsername = TextEditingController();
  var etQuantity = TextEditingController(text: "0");
  final etNotes = TextEditingController();

  final box = GetStorage();
  // var dropdownCustomer = ''.obs;
  // var dropdownProjectType = ''.obs;

  DateTime now = DateTime.now();
  var formattedDateNow = ''.obs;

  // final RxSet<String> selectedMaterials = <String>{}.obs;
  // final RxList<String> selectedAssetNamesMaterial = <String>[].obs;

  RefreshController refreshControllerCustomer =
      RefreshController(initialRefresh: false);
  RefreshController refreshControllerMaterial =
      RefreshController(initialRefresh: false);
  RefreshController refreshControllerTool =
      RefreshController(initialRefresh: false);

  final key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    formattedDateNow =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now).obs;
    etUsername.text = box.read('etUsername');
    doGetCustomer(isLoadMore: false);
    doGetAssetNameMaterial(isLoadMore: false);
    doGetAssetNameTool(isLoadMore: false);
  }

  void toggleSearchCustomer() {
    isSearchingCustomer.value = !isSearchingCustomer.value;
  }

  void clearTextCustomer() {
    searchControllerCustomer.clear();
  }

  void doGetCustomer({bool isLoadMore = false}) async {
    if (isLoadMore) {
      currentPageCustomer.value++;
    } else {
      currentPageCustomer.value = 1;
      customers.clear();
    }

    isLoadingCustomer.value = true;
    var params = {
      "search": globalSearchCustomer.value,
      "order_by": sortColumnCustomer.value,
      "order_direction": sortOrderCustomer.value,
      "page": currentPageCustomer.value,
      "pageSize": pageSizeCustomer.value,
    };

    try {
      final response = await _client.get(
        Endpoint.customer,
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
      final List<CustomerModel> newCustomers = rows
          .map((json) => CustomerModel.fromJson(json))
          .toList()
          .cast<CustomerModel>();

      // Tambahkan data baru ke daftar jika load more
      if (isLoadMore) {
        customers.addAll(newCustomers);
        customers.refresh();
      } else {
        customers.value = newCustomers;
      }

      // Selesai loading jika data kurang dari pageSizeCustomer
      if (newCustomers.length < pageSizeCustomer.value) {
        refreshControllerCustomer.loadNoData();
      } else {
        refreshControllerCustomer.loadComplete();
      }
      print("Data pelanggan bahan berhasil dimuat: ${customers.length}");
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(
          NetworkingUtil.errorMessage('Gagal mengambil nama pelanggan'));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    } finally {
      isLoadingCustomer.value = false;
    }
  }

  void toggleSearchMaterial() {
    isSearchingMaterial.value = !isSearchingMaterial.value;
  }

  void clearTextMaterial() {
    searchControllerMaterial.clear();
  }

  void updateQuantityMaterial(int index, int newQuantity) {
    if (index >= 0 && index < selectedAssetQuantitiesMaterial.length) {
      selectedAssetQuantitiesMaterial[index] = newQuantity;
      print("Updated quantity: ${selectedAssetQuantitiesMaterial[index]}");
    }
  }

  void increaseQuantityMaterial(int index) {
    selectedAssetQuantitiesMaterial[index]++;
  }

  void decreaseQuantityMaterial(int index) {
    if (selectedAssetQuantitiesMaterial[index] > 1) {
      selectedAssetQuantitiesMaterial[index]--;
    } else {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(
          'Kuantitas bahan tidak boleh kurang dari 1'));
    }
  }

  void addAssetMaterial(String assetId, String assetName) {
    if (!selectedAssetNamesMaterial.contains(assetName)) {
      selectedAssetIdsMaterial.add(assetId);
      selectedAssetNamesMaterial.add(assetName);
      selectedAssetQuantitiesMaterial.add(1); // Default quantity is 1
    }
  }

  void removeAssetMaterial(int index) {
    selectedAssetIdsMaterial.removeAt(index);
    selectedAssetNamesMaterial.removeAt(index);
    selectedAssetQuantitiesMaterial.removeAt(index);
  }

  void doGetAssetNameMaterial({bool isLoadMore = false}) async {
    if (isLoadMore) {
      currentPageMaterial.value++;
    } else {
      currentPageMaterial.value = 1; // Reset page saat refresh
      materials.clear(); // Bersihkan data sebelumnya jika refresh
    }

    isLoadingMaterial.value = true;
    var params = {
      "category": 'Bahan',
      "search": globalSearchMaterial.value,
      "order_by": sortColumnMaterial.value,
      "order_direction": sortOrderMaterial.value,
      "page": currentPageMaterial.value,
      "pageSize": pageSizeMaterial.value,
    };

    try {
      final response = await _client.get(
        Endpoint.getAssetsName,
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
      final List<AssetNameModel> newMaterials = rows
          .map((json) => AssetNameModel.fromJson(json))
          .toList()
          .cast<AssetNameModel>();

      // Tambahkan data baru ke daftar jika load more
      if (isLoadMore) {
        materials.addAll(newMaterials);
        materials.refresh();
      } else {
        materials.value = newMaterials;
      }

      // Selesai loading jika data kurang dari pageSizeMaterial
      if (newMaterials.length < pageSizeMaterial.value) {
        refreshControllerMaterial.loadNoData();
      } else {
        refreshControllerMaterial.loadComplete();
      }
      print("Data aset bahan berhasil dimuat: ${materials.length}");
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(
          NetworkingUtil.errorMessage('Gagal mengambil nama aset'));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    } finally {
      isLoadingMaterial.value = false;
    }
  }

  void toggleSearchTool() {
    isSearchingTool.value = !isSearchingTool.value;
  }

  void clearTextTool() {
    searchControllerTool.clear();
  }

  void updateQuantityTool(int index, int newQuantity) {
    if (index >= 0 && index < selectedAssetQuantitiesTool.length) {
      selectedAssetQuantitiesTool[index] = newQuantity;
      print("Updated quantity: ${selectedAssetQuantitiesTool[index]}");
    }
  }

  void increaseQuantityTool(int index) {
    selectedAssetQuantitiesTool[index]++;
  }

  void decreaseQuantityTool(int index) {
    if (selectedAssetQuantitiesTool[index] > 1) {
      selectedAssetQuantitiesTool[index]--;
    } else {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(
          'Kuantitas bahan tidak boleh kurang dari 1'));
    }
  }

  void addAssetTool(String assetId, String assetName) {
    if (!selectedAssetNamesTool.contains(assetName)) {
      selectedAssetIdsTool.add(assetId);
      selectedAssetNamesTool.add(assetName);
      selectedAssetQuantitiesTool.add(1); // Default quantity is 1
    }
  }

  void removeAssetTool(int index) {
    selectedAssetIdsTool.removeAt(index);
    selectedAssetNamesTool.removeAt(index);
    selectedAssetQuantitiesTool.removeAt(index);
  }

  void doGetAssetNameTool({bool isLoadMore = false}) async {
    if (isLoadMore) {
      currentPageTool.value++;
    } else {
      currentPageTool.value = 1; // Reset page saat refresh
      tools.clear(); // Bersihkan data sebelumnya jika refresh
    }

    isLoadingTool.value = true;
    var params = {
      "category": 'Alat',
      "search": globalSearchTool.value,
      "order_by": sortColumnTool.value,
      "order_direction": sortOrderTool.value,
      "page": currentPageTool.value,
      "pageSize": pageSizeTool.value,
    };

    try {
      final response = await _client.get(
        Endpoint.getAssetsName,
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
      final List<AssetNameModel> newTools = rows
          .map((json) => AssetNameModel.fromJson(json))
          .toList()
          .cast<AssetNameModel>();

      // Tambahkan data baru ke daftar jika load more
      if (isLoadMore) {
        tools.addAll(newTools);
        tools.refresh();
      } else {
        tools.value = newTools;
      }

      // Selesai loading jika data kurang dari pageSizeTool
      if (newTools.length < pageSizeTool.value) {
        refreshControllerTool.loadNoData();
      } else {
        refreshControllerTool.loadComplete();
      }
      print("Data aset alat berhasil dimuat: ${tools.length}");
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(
          NetworkingUtil.errorMessage('Gagal mengambil nama aset'));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    } finally {
      isLoadingTool.value = false;
    }
  }

  Future<void> sendAssetsToApi() async {
    isLoadingAddLoan.value = true;

    // Buat Map data yang sesuai dengan format x-www-form-urlencoded
    Map<String, String> formData = {};
    formData['user_id'] = box.read('user_id').toString();
    formData['customer_name'] = selectedCustomerName.value;
    formData['notes'] = etNotes.text;
    formData['status'] = 'PENDING';

    for (int i = 0; i < selectedAssetIdsMaterial.length; i++) {
      for (int j = 0; j < selectedAssetIdsTool.length; j++) {
        formData['assets[$i][asset_id]'] = selectedAssetIdsMaterial[i];
        formData['assets[$i][input_method]'] = 'Manual';
        formData['assets[$i][quantity]'] =
            selectedAssetQuantitiesMaterial[i].toString();

        formData['assets[${j + selectedAssetIdsMaterial.length}][asset_id]'] =
            selectedAssetIdsTool[j];
        formData[
                'assets[${j + selectedAssetIdsMaterial.length}][input_method]'] =
            'Manual';
        formData['assets[${j + selectedAssetIdsMaterial.length}][quantity]'] =
            selectedAssetQuantitiesTool[j].toString();
      }
    }

    try {
      final response = await _client.post(
        Endpoint.loan,
        data: formData,
        // queryParameters: params,
        options: Options(
          headers: {
            "Authorization": "Bearer ${box.read('access_token')}",
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Data berhasil dikirim: ${response.data}");
        Get.back();
        SnackbarWidget.showSuccessSnackbar('Peminjaman berhasil dilakukan');
      } else {
        print("Gagal mengirim data. Status: ${response.statusCode}");
        print("Response: ${response.data}");
      }
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    } finally {
      isLoadingAddLoan.value = false;
    }
  }
}
