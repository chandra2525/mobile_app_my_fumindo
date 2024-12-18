import 'package:dio/dio.dart';
import 'package:mobile_app_my_fumindo/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../app/routes/route_name.dart';
import '../../../utils/networking_util.dart';
import '../../../widgets/snackbar_widget.dart';
import '../../dashboard/web_page/web_page.dart';

class AssetController extends GetxController {
  final UserRepository _userRepository;

  // final box = GetStorage();

  AssetController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  void onInit() {
    super.onInit();
  }
}
