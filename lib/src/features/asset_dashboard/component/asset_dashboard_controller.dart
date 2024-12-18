import 'package:dio/dio.dart';
import 'package:mobile_app_my_fumindo/src/constants/color.dart';
import 'package:mobile_app_my_fumindo/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../app/routes/route_name.dart';
import '../../../constants/text_style.dart';
import '../../../utils/networking_util.dart';
import '../../../widgets/snackbar_widget.dart';
import '../../dashboard/web_page/web_page.dart';

class AssetDashboardController extends GetxController {
  final UserRepository _userRepository;
  var touchedIndex = (-1).obs;
  // final box = GetStorage();

  AssetDashboardController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  void onInit() {
    super.onInit();
  }

  // Fungsi untuk mengupdate touchedIndex
  void updateTouchedIndex(int index) {
    touchedIndex.value = index;
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex.value;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: green,
            value: 65,
            title: '65%',
            radius: radius,
            titleStyle: TextStyles.rubik16RegWhite,
          );
        case 1:
          return PieChartSectionData(
            color: blue,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyles.rubik16RegWhite,
          );
        case 2:
          return PieChartSectionData(
            color: orange,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyles.rubik16RegWhite,
          );
        case 3:
          return PieChartSectionData(
            color: primary,
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyles.rubik16RegWhite,
          );
        default:
          throw Error();
      }
    });
  }
}
