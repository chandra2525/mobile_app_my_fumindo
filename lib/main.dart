import 'package:mobile_app_my_fumindo/app/routes/app_route.dart';
import 'package:mobile_app_my_fumindo/app/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/app_binding.dart';

void main() async {
  await GetStorage.init();
  await initializeDateFormatting('en_EN', null)
      .then((_) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MyFumindo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          // background: Colors.white,
          // primary: Colors.white,
          // onPrimary: Colors.white,
          // primaryContainer: Colors.white,
          // onPrimaryContainer: Colors.white,
          // primaryFixed: Colors.white,
          // primaryFixedDim: Colors.white,
          // onPrimaryFixed: Colors.white,
          // onPrimaryFixedVariant: Colors.white,
          // secondary: Colors.white,
          // onSecondary: Colors.white,
          // secondaryContainer: Colors.white,
          // onSecondaryContainer: Colors.white,
          // secondaryFixed: Colors.white,
          // secondaryFixedDim: Colors.white,
          // onSecondaryFixed: Colors.white,
          // onSecondaryFixedVariant: Colors.white,
          // tertiary: Colors.white,
          // onTertiary: Colors.white,
          // tertiaryContainer: Colors.white,
          // onTertiaryContainer: Colors.white,
          // tertiaryFixed: Colors.white,
          // tertiaryFixedDim: Colors.white,
          // onTertiaryFixed: Colors.white,
          // onTertiaryFixedVariant: Colors.white,
          // error: Colors.white,
          // onError: Colors.white,
          // errorContainer: Colors.white,
          // onErrorContainer: Colors.white,
          // outline: Colors.white,
          // outlineVariant: Colors.white,
          // surface: Colors.white,
          // onSurface: Colors.white,
          // surfaceDim: Colors.white,
          // surfaceBright: Colors.white,
          // surfaceContainerLowest: Colors.white,
          // surfaceContainerLow: Colors.white,
          // surfaceContainer: Colors.white,
          // surfaceContainerHigh: Colors.white,
          // surfaceContainerHighest: Colors.white,
          // onSurfaceVariant: Colors.white,
          // inverseSurface: Colors.white,
          // onInverseSurface: Colors.white,
          // inversePrimary: Colors.white,
          // shadow: Colors.white,
          // scrim: Colors.white,
          surfaceTint: Colors.transparent,
          // onBackground: Colors.white,
          // surfaceVariant: Colors.white,
        ),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splashScreen,
      getPages: AppRoute.pages,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
