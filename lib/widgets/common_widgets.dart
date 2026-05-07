import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../app_theme/app_colors.dart';
import '../utils/theme_controller.dart';

showToast({required String message, int? seconds}) {
  Fluttertoast.showToast(
    msg: message.tr,
    backgroundColor: AppColors.blackColor,
    textColor: Colors.white,
    fontSize: 14.sp,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    // textColor: Colors.pink
  );
}

class ThemeToggleButton extends StatelessWidget {
  ThemeToggleButton({super.key});

  final ThemeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (_) {
        final bool isDark = controller.isDarkMode();

        return GestureDetector(
          onTap: controller.toggleTheme,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            width: 60,
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: isDark
                    ? const [
                  Color(0xFF2C2F4A),
                  Color(0xFF0B0B12),
                ]
                    : const [
                  Color(0xFFFFB56B),
                  Color(0xFFE57EB0),
                ],
              ),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              alignment:
              isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny_rounded,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}