import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_my_fumindo/src/constants/text_style.dart';
import '../../constants/color.dart';
import '../../constants/icon.dart';
import 'component/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: primary),
        child: Stack(
          alignment: Alignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '',
            ),
            Positioned(
              left: -120,
              right: -120,
              // top: 0,
              // bottom: 0,
              child: Container(
                width: 700,
                height: 700,
                decoration: ShapeDecoration(
                  color: whiteOp10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                ),
              ),
            ),
            Positioned(
              // left: 0,
              // right: 0,
              // top: 0,
              // bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: whiteOp5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                  // shadows: const [
                  //   BoxShadow(
                  //     color: shadowColor,
                  //     blurRadius: 20,
                  //     offset: Offset(0, 10),
                  //     spreadRadius: 0,
                  //   )
                  // ],
                ),
              ),
            ),
            Positioned(
              // left: 0,
              // right: 0,
              // top: 0,
              // bottom: 0,
              child: Image.asset(
                width: 250.0,
                height: 250.0,
                ic_app,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              // left: 0,
              // right: 0,
              // top: 0,
              bottom: 0,
              child: SafeArea(
                child: Obx(
                  () => Text(
                    'Ver : ${controller.version.value}',
                    style: TextStyles.rubik18Med,
                  ),
                ),
              ),
            ),
          ],
        ), //
      ),
    );
  }
}
