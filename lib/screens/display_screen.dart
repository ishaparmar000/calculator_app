import 'package:calculator_app/screens/display_controller.dart';
import 'package:calculator_app/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_theme/app_colors.dart';
import '../app_theme/stylehelper.dart';
import '../widgets/common_widgets.dart';


class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  DisplayController displayController = Get.put(DisplayController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: AppColors.whiteColor,
              title: Text("exit_app".tr),
              content: Text("exit_app_msg".tr,),
              actions: [
                TextButton(
                  onPressed: () => Get.back(result: false),
                  child: Text("no".tr),
                ),
                TextButton(
                  onPressed: () => Get.back(result: true),
                  child: Text("yes".tr),
                ),
              ],
            );
          },
        );

        return shouldExit ?? false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () => Get.to(HistoryScreen()),
                        child: Icon(Icons.history ,color:  Get.isDarkMode
                            ? AppColors.whiteColor
                            : AppColors.blackColor, size: 24.h).marginOnly(top: 10.h)).marginOnly(right: 20.w),
                    ThemeToggleButton(),
                  ],
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Obx(() {
                        String text = displayController.expression.value.isNotEmpty
                            ? displayController.expression.value
                            : displayController.displayValue.value;
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100,),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: Tween<double>(begin: 0.95, end: 1,).animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: FittedBox(
                            key: ValueKey(text),
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerRight,
                            child: Text(text, style: StyleHelper.regularWhite_80(), maxLines: 1,),
                          ),
                        );
                      }),

                      Obx(() => displayController.previewResult.value.isNotEmpty
                          ?
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(displayController.previewResult.value,
                          style: StyleHelper.customStyle(color: Get.isDarkMode ? AppColors.whiteColor : AppColors.blackColor, fontSize: 32.sp, family: medium,),
                        ),
                      ) : SizedBox(height: 32.sp + 4.h)),

                    //  SizedBox(height: 24.h),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalcButton(label: 'AC',  bgColor: AppColors.borderColor, labelStyle: StyleHelper.mediumBlack_28, onTap: displayController.onACPressed),
                    buildCalcButton(label: 'D', bgColor: AppColors.borderColor, labelStyle: StyleHelper.mediumBlack_28, onTap: displayController.onBackspacePressed),
                    buildCalcButton(label: '%',   bgColor: AppColors.borderColor, labelStyle: StyleHelper.mediumBlack_28, onTap: displayController.onPercentPressed),
                    buildCalcButton(label: '÷',   bgColor: AppColors.primaryColor, labelStyle: StyleHelper.regularWhite_38, onTap: () => displayController.onOperatorPressed('÷')),
                  ],
                ),

                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalcButton(label: '7', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('7')),
                    buildCalcButton(label: '8', bgColor:Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('8')),
                    buildCalcButton(label: '9', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('9')),
                    buildCalcButton(label: '×', bgColor: AppColors.primaryColor, labelStyle: StyleHelper.regularWhite_38, onTap: () => displayController.onOperatorPressed('×')),
                  ],
                ),

                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalcButton(label: '4', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('4')),
                    buildCalcButton(label: '5', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('5')),
                    buildCalcButton(label: '6', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('6')),
                    buildCalcButton(label: '−', bgColor: AppColors.primaryColor, labelStyle: StyleHelper.regularWhite_38, onTap: () => displayController.onOperatorPressed('-')),
                  ],
                ),

                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalcButton(label: '1', bgColor:Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('1')),
                    buildCalcButton(label: '2', bgColor:Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('2')),
                    buildCalcButton(label: '3', bgColor:Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('3')),
                    buildCalcButton(label: '+', bgColor: AppColors.primaryColor, labelStyle: StyleHelper.regularWhite_38, onTap: () => displayController.onOperatorPressed('+')),
                  ],
                ),

                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCalcButton(label: '√', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onSquareRootPressed() ),
                    buildCalcButton(label: '0', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: () => displayController.onNumberPressed('0'), ),
                    buildCalcButton(label: ',', bgColor: Theme.of(context).brightness==Brightness.dark?AppColors.darkButtonColor:AppColors.lightButtonColor.withOpacity(0.5), labelStyle: StyleHelper.regularWhite_32(), onTap: displayController.onDecimalPressed),
                    buildCalcButton(label: '=', bgColor: AppColors.primaryColor, labelStyle: StyleHelper.regularWhite_38, onTap: displayController.onEqualsPressed),
                  ],
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCalcButton({
    required String label,
    required Color bgColor,
    required TextStyle labelStyle,
    required VoidCallback onTap,
    bool isWide = false,
  }) {
    RxBool isPressed = false.obs;
    double size = 63.w;
    double width = isWide ? size * 2 : size;
    return Obx(() =>
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => isPressed.value = true,
          onTapUp: (_) async {
            await Future.delayed(
              const Duration(milliseconds: 80),
            );
            isPressed.value = false;
            onTap();
          },
          onTapCancel: () => isPressed.value = false,

          child: AnimatedScale(
            scale: isPressed.value ? 0.92 : 1,
            duration: const Duration(milliseconds: 120,),
            child: Container(
              width: width,
              height: size,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius:
                BorderRadius.circular(size / 2),
              ),
              alignment: isWide ? Alignment.centerLeft : Alignment.center,
              padding: isWide ? EdgeInsets.only(left: 28.w) : EdgeInsets.zero,
              child: Text(label, style: labelStyle,),
            ),
          ),
        ),
    );
  }
}