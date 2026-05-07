import 'package:calculator_app/screens/display_screen.dart';
import 'package:calculator_app/utils/theme_controller.dart';
import 'package:calculator_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        splitScreenMode: true,
        builder: (_, widget) {
          return ScreenUtilInit(
            minTextAdapt: true,
            useInheritedMediaQuery: true,
            splitScreenMode: true,
            builder: (_, widget) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: GetBuilder<ThemeController>(
                  init: ThemeController(),
                  builder: (themeController) {
                    return GetMaterialApp(
                      title: 'Calculator',
                      debugShowCheckedModeBanner: false,
                      theme: lightTheme,
                      darkTheme: darkTheme,
                      themeMode: themeController.themeMode,
                      home: const DisplayScreen(),
                      useInheritedMediaQuery: true,
                    );
                  },
                ),
              );
            },
          );
        }
    );
  }
}