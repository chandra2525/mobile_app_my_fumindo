import 'package:get_storage/get_storage.dart';
import 'package:mobile_app_my_fumindo/src/features/asset/asset_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/user_repository.dart';
import '../../../utils/networking_util.dart';
import '../../../widgets/snackbar_widget.dart';
import '../../dev/dev_page.dart';

class DashboardController extends GetxController {
  DashboardController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final box = GetStorage();
  var isLoadingLogin = false.obs;

  final _listPages = Rx<List<Widget>>([]);
  final _selectedNavbar = 0.obs;
  final UserRepository _userRepository;

  @override
  void onInit() {
    super.onInit();
    doRefreshToken();
    _listPages.value = [
      // const ProductListPage(),
      // const FavoriteListPage(),
      const DevPage(),
      const DevPage(),
      const AssetPage(),
    ];
  }

  int get selectedNavbar => _selectedNavbar.value;

  List<Widget> get listPages => _listPages.value;

  void updateSelectedNavbar(int selected) => _selectedNavbar.value = selected;

  void doRefreshToken() async {
    isLoadingLogin.value = true;
    try {
      await _userRepository.refreshToken();
    } catch (error) {
      print('Error saat memperbarui token : ' + error.toString());
      SnackbarWidget.showFailedSnackbar(
          NetworkingUtil.errorMessage('Gagal simpan access token'));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }

    isLoadingLogin.value = false;
  }
}
