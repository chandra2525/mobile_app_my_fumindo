import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mobile_app_my_fumindo/src/features/drawer/drawer_screen_page.dart';

import '../../../constants/color.dart';
import '../../../constants/icon.dart';
import '../../../constants/image.dart';
import '../../../widgets/button_icon.dart';
import 'component/asset_controller.dart';

class AssetPage extends GetView<AssetController> {
  const AssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 24,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  blurRadius: 25,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Obx(
                  () => controller.isLoadingDownloadFile.value
                      ? const Center(
                          heightFactor: 12,
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            iconTileProfile("Test 401", () {
                              // controller.onTestUnauthenticatedClick();
                            }),
                            const Padding(
                              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                              child: Divider(
                                  thickness: 4, color: gray100, height: 4),
                            ),
                            iconTileProfile("Download File", () {
                              // controller.onDownloadFileClick();
                            }),
                            iconTileProfile("Open Webpage", () {
                              // controller.onOpenWebPageClick();
                            }),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              child: signOutButton(context),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconTileProfile(String text, Function onClick) => InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    color: gray900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Image.asset(
                ic_arrow_right,
                height: 20,
                width: 20,
              ),
            ],
          ),
        ),
      );

  Widget signOutButton(BuildContext context) => Obx(
        () => controller.isLoadingLogout.value
            ? const CircularProgressIndicator()
            : SizedBox(
                height: 52,
                width: double.infinity,
                child: SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ButtonIcon(
                    buttonColor: red50,
                    textColor: red600,
                    textLabel: "Sign Out",
                    onClick: () {
                      showConfirmationDialog(
                          'Are you sure to Sign Out?', 'Yes', Get.context!);
                    },
                  ),
                ),
              ),
      );

  Future<void> showConfirmationDialog(
      String title, String message, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: gray900,
              fontWeight: FontWeight.w600,
            ),
          ),
          // content: SingleChildScrollView(
          //   child: ListBody(
          //     children: <Widget>[
          //       Text(message),
          //     ],
          //   ),
          // ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Sign Out',
                style: TextStyle(
                  color: red600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                controller.doLogout();
              },
            ),
          ],
        );
      },
    );
  }
}
