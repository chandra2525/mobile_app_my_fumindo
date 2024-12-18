import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/route_name.dart';
import '../../constants/color.dart';
import '../../constants/icon.dart';
import '../../constants/text_style.dart';
import 'component/asset_controller.dart';

class AssetPage extends GetView<AssetController> {
  const AssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mapTileSub("Dashboard"),
            mapTileSubTitle("Dashboard", () {
              Get.toNamed(RouteName.assetDashboard);
            }),
            mapTileSub("Peminjaman"),
            mapTileSubTitle("Form Peminjaman", () {
              Get.toNamed(RouteName.assetLoanForm);
            }),
            mapTileSubTitle("Persetujuan Peminjaman", () {
              // controller.onOpenWebPageClick();
            }),
            mapTileSub("Pengembalian"),
            mapTileSubTitle("Daftar Pengembalian", () {
              // controller.onDownloadFileClick();
            }),
            mapTileSubTitle("Persetujuan Pengembalian", () {
              // controller.onOpenWebPageClick();
            }),
            mapTileSub("Data Aset"),
            mapTileSubTitle("Kelola Aset", () {
              // controller.onDownloadFileClick();
            }),
            mapTileSub("Laporan"),
            mapTileSubTitle("Laporan Peminjaman", () {
              // controller.onDownloadFileClick();
            }),
            const SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }

  Widget mapTileSub(String text) => Container(
        padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
        child: Text(
          text,
          style: TextStyles.rubik16Med,
        ),
      );

  Widget mapTileSubTitle(String text, Function onClick) => Column(
        children: [
          InkWell(
            onTap: () {
              onClick();
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyles.rubik16Reg,
                    ),
                  ),
                  Image.asset(
                    ic_arrow_right,
                    height: 20,
                    width: 20,
                    color: textColor,
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(thickness: 1, color: gray100, height: 0.3),
          ),
        ],
      );
}
