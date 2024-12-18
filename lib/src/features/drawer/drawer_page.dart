import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_my_fumindo/src/constants/text_style.dart';
import '../../constants/color.dart';
import '../../constants/icon.dart';
import '../../repositories/user_repository.dart';
import 'component/drawer_controller.dart';

class DrawerPage extends GetView<DrawerScreenController> {
  // const DrawerPage({Key? key}) : super(key: key);

  var drawerScreenController = Get.put(DrawerScreenController(
    userRepository: Get.find<UserRepository>(),
  ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[
                  drawerColor,
                  drawerColor,
                ]),
          ),
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/app_icon.png',
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'MyFumindo',
                            style: TextStyles.rubik16MedWhite,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/profil_picture.png',
                          height: 80,
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nama Karyawan',
                              style: TextStyles.rubik18MedWhite,
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              '085245674567',
                              style: TextStyles.rubik12MedWhite,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Text(
                                'karyawan@gmail.com',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.rubik12MedWhite,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 42.0),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 15.0, bottom: 20),
                    //   child: Text(
                    //     'Nama Cabang',
                    //     style: TextStyles.rubik18Med,
                    //   ),
                    // ),
                    // Divider(
                    //   height: 4,
                    //   thickness: 0.5,
                    //   color: Colors.white.withOpacity(1),
                    //   // indent: 32,
                    //   // endIndent: 32,
                    // ),
                    mapTileTitle("Profil", icProfile, () {
                      Get.snackbar(
                        'Pengembangan',
                        'Fitur ini sedang dalam pengembangan',
                        duration: const Duration(seconds: 1),
                      );
                    }),
                    mapTileTitle("Ubah Password", icChangePass, () {
                      Get.snackbar(
                        'Pengembangan',
                        'Fitur ini sedang dalam pengembangan',
                        duration: const Duration(seconds: 1),
                      );
                    }),
                    mapTileTitle("Bantuan", icSupport, () {
                      Get.snackbar(
                        'Pengembangan',
                        'Fitur ini sedang dalam pengembangan',
                        duration: const Duration(seconds: 1),
                      );
                    }),
                    mapTileTitle("Tentang MyFumindo", icAbout, () {
                      Get.snackbar(
                        'Pengembangan',
                        'Fitur ini sedang dalam pengembangan',
                        duration: const Duration(seconds: 1),
                      );
                    }),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: Text(
                      'MyFumindo V${controller.version.value}',
                      // 'asd',
                      style: TextStyles.rubik16RegWhite,
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
                            controller.doLogout();
                          },
                          child: const Text(
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
      ),
    );
  }

  Widget mapTileTitle(String text, String iconTile, Function onClick) =>
      InkWell(
        onTap: () {
          onClick();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                iconTile,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  text,
                  style: TextStyles.rubik16RegWhite,
                ),
              ),
            ],
          ),
        ),
      );
}
