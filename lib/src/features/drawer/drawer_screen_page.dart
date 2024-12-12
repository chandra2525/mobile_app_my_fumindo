import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_my_fumindo/src/constants/text_style.dart';
import '../../constants/color.dart';
import '../../constants/icon.dart';
import 'component/drawer_screen_controller.dart';

class DrawerScreenPage extends GetView<DrawerScreenController> {
  const DrawerScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xff865439),
                Color(0xff492F10),
              ]),
        ),
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        padding: const EdgeInsets.all(5),
                        // color: Color(0xFF865439),
                        child: Image.asset(
                          'assets/icons/app_icon.png',
                          height: 20,
                        ),
                      ),
                      // SvgPicture.asset(
                      //   'assets/images/logo.svg',
                      //   height: 45,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'OfflinePOS',
                          style: TextStyles.rubik16Reg,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20),
                    child: Text(
                      'MyNameStore',
                      style: TextStyles.rubik16Reg,
                    ),
                  ),
                  Divider(
                    height: 4,
                    thickness: 0.5,
                    color: Colors.white.withOpacity(1),
                    // indent: 32,
                    // endIndent: 32,
                  ),
                  InkWell(
                    onTap: () {
                      Get.snackbar(
                        'Development',
                        'Features in development',
                        duration: const Duration(seconds: 1),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.people,
                                size: 27,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  'Account',
                                  style: TextStyles.rubik16Reg,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                            Get.toNamed('/change-password-page');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 27,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Change Password',
                                    style: TextStyles.rubik16Reg,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.help,
                                  size: 27,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Support',
                                    style: TextStyles.rubik16Reg,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.snackbar(
                              'Development',
                              'Features in development',
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.mobile_friendly,
                                  size: 27,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'About OfflinePOS',
                                    style: TextStyles.rubik16Reg,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Text(
                    'OfflinePOS V.1.0.0',
                    style: TextStyles.rubik16Reg,
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.15),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 20, bottom: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Get.back();
                          Get.snackbar(
                            'Development',
                            'Features in development',
                            duration: const Duration(seconds: 1),
                          );
                          Get.toNamed('/welcome-page');
                        },
                        child: Text(
                          "Log out",
                          style: TextStyles.rubik16Reg,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
