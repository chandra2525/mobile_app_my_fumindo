import 'package:mobile_app_my_fumindo/src/features/dashboard/component/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_my_fumindo/src/features/drawer/drawer_screen_page.dart';
import '../../constants/color.dart';
import '../../constants/icon.dart';
import '../../constants/text_style.dart';

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: white,
      drawer: DrawerScreenPage(),
      appBar: AppBar(
        backgroundColor: white,
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            icMenu,
            color: primary,
            height: 24,
            width: 24,
          ),
        ),
        actions: const <Widget>[
          SizedBox(
            width: 55,
            height: 55,
            child: Icon(Icons.shop, size: 27, color: Colors.white),
          )
        ],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Center(
                  child: Obx(
                    () => Text(
                      controller.selectedNavbar.toString() == "0"
                          ? 'Peta'
                          : controller.selectedNavbar.toString() == "1"
                              ? 'Tugas'
                              : 'Aset',
                      style: TextStyles.rubik22Med,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Obx(
        () => IndexedStack(
            index: controller.selectedNavbar, children: controller.listPages),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: grey,
              width: 0.2,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 100,
                offset: Offset(0, 0),
                spreadRadius: 10,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: controller.selectedNavbar,
                selectedItemColor: primary,
                unselectedItemColor: gray500,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                onTap: (int index) {
                  controller.updateSelectedNavbar(index);
                },
                selectedLabelStyle: TextStyles.rubik12MedRed,
                unselectedLabelStyle: TextStyles.rubik12MedGrey,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "Peta",
                    icon: Image.asset(
                      icMap,
                      color: grey2,
                      height: 24,
                      width: 24,
                    ),
                    activeIcon: Image.asset(
                      icMap,
                      color: primary,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "Tugas",
                    icon: Image.asset(
                      icTask,
                      color: grey2,
                      height: 24,
                      width: 24,
                    ),
                    activeIcon: Image.asset(
                      icTask,
                      color: primary,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "Aset",
                    icon: Image.asset(
                      icAsset,
                      color: grey2,
                      height: 24,
                      width: 24,
                    ),
                    activeIcon: Image.asset(
                      icAsset,
                      color: primary,
                      height: 24,
                      width: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
