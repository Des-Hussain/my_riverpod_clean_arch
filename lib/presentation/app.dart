import 'package:my_riverpod_clean_arch/common/resources/colors.dart';
import 'package:my_riverpod_clean_arch/common/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_riverpod_clean_arch/config/app_router.dart';
import 'package:sizer/sizer.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class RiverpodCleanArch extends StatelessWidget {
  const RiverpodCleanArch({super.key});

  void setSystemPreferences() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        // commented to stay mobile theme
        // systemNavigationBarColor: AppColors.secondary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setSystemPreferences();
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: Strings.appName,
        scaffoldMessengerKey: scaffoldKey,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
            physics: const ClampingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics())),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(primary: AppColors.primary),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          bottomSheetTheme:
              const BottomSheetThemeData(surfaceTintColor: Colors.white),
        ),
        // theme: ThemeData(useMaterial3: true),
      );
    });
  }
}
