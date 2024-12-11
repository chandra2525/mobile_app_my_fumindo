import 'package:mobile_app_my_fumindo/src/features/dashboard/products/list/product_list_page.dart';
import 'package:mobile_app_my_fumindo/src/features/dashboard/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../products/list/favorite_list_page.dart';

class DashboardController extends GetxController {
  final _selectedNavbar = 0.obs;

  int get selectedNavbar => _selectedNavbar.value;

  final _listPages = Rx<List<Widget>>([]);

  List<Widget> get listPages => _listPages.value;

  void updateSelectedNavbar(int selected) => _selectedNavbar.value = selected;

  @override
  void onInit() {
    super.onInit();
    _listPages.value = [
      // const ProductListPage(),
      // const FavoriteListPage(),
      // const ProfilePage(),
    ];
  }
}