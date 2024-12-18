import 'package:mobile_app_my_fumindo/app/routes/route_name.dart';
import 'package:mobile_app_my_fumindo/src/features/dashboard/component/dashboard_binding.dart';
import 'package:mobile_app_my_fumindo/src/features/dashboard/dashboard_page.dart';
import 'package:get/get.dart';

import '../../src/features/asset_loan_approval/asset_loan_approval_page.dart';
import '../../src/features/asset_loan_approval/component/asset_loan_approval_binding.dart';
import '../../src/features/asset_loan_form/asset_loan_form_page.dart';
import '../../src/features/boarding/boarding_page.dart';
import '../../src/features/boarding/component/boarding_binding.dart';
import '../../src/features/asset_dashboard/component/asset_dashboard_binding.dart';
import '../../src/features/asset_dashboard/asset_dashboard_page.dart';
// import '../../src/features/dashboard/products/detail_product/product_detail_page.dart';
// import '../../src/features/dashboard/products/list/favorite_list_page.dart';
import '../../src/features/asset_loan_form/component/asset_loan_form_binding.dart';
import '../../src/features/login/component/login_binding.dart';
import '../../src/features/login/login_page.dart';
import '../../src/features/splash_screen/component/splash_screen_binding.dart';
import '../../src/features/splash_screen/splash_screen_page.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: RouteName.boarding,
      page: () => const BoardingPage(),
      binding: BoardingBinding(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: RouteName.assetDashboard,
      page: () => AssetDashboardPage(),
      binding: AssetDashboardBinding(),
    ),
    GetPage(
      name: RouteName.assetLoanForm,
      page: () => AssetLoanFormPage(),
      binding: AssetLoanFormBinding(),
    ),
    GetPage(
      name: RouteName.assetLoanApproval,
      page: () => AssetLoanApprovalPage(),
      binding: AssetLoanApprovalBinding(),
    ),
    // GetPage(
    //   name: RouteName.productDetail,
    //   page: () => const ProducDetailtPage(),
    //   // binding: EditProfileBinding(),
    // ),
    // GetPage(
    //   name: RouteName.editProfile,
    //   page: () => const EditProfilePage(),
    //   binding: EditProfileBinding(),
    // ),
  ];
}
