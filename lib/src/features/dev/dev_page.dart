import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_my_fumindo/src/constants/text_style.dart';
import '../../constants/color.dart';
import 'component/dev_controller.dart';

class DevPage extends GetView<DevController> {
  const DevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: white),
        child: const Center(
          child: Text(
            'Fitur ini sedang dalam\npemgembangan',
            style: TextStyles.rubik16Reg,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
