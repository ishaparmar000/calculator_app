import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_colors.dart';

const String bold = 'SFProBold';
const String semiBold = 'SFProSemiBold';
const String medium = 'SFProMedium';
const String regular = 'SFProRegular';

class StyleHelper {
  static const Color gray = Color(0xFFADADAD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static TextStyle customStyle(
      {String? family,
      Color? color,
      double? fontSize,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: family ?? regular,
      color: color ?? black,
      fontSize: fontSize ?? 12.sp,
      decoration: textDecoration,
    );
  }

  static TextStyle primaryBold_10 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 10.sp);

  static TextStyle primaryBold_11 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 11.sp);

  static TextStyle primaryBold_12 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 12.sp);

  static TextStyle primaryBold_13 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 13.sp);

  static TextStyle primaryBold_14 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 14.sp);

  static TextStyle primaryBold_15 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 15.sp);

  static TextStyle primaryBold_16 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 16.sp);

  static TextStyle primaryBold_20 = TextStyle(
      color: AppColors.primaryColor, fontFamily: bold, fontSize: 20.sp);

  static TextStyle primaryBold_22 = TextStyle(
      fontFamily: bold, color: AppColors.primaryColor, fontSize: 22.sp);

  static TextStyle primaryBold_24 = TextStyle(
      fontFamily: bold, color: AppColors.primaryColor, fontSize: 24.sp);

  static TextStyle primaryBold_28 = TextStyle(
      fontFamily: bold, color: AppColors.primaryColor, fontSize: 28.sp);

  static TextStyle primaryBold_36 = TextStyle(
      fontFamily: bold, color: AppColors.primaryColor, fontSize: 36.sp);

  static TextStyle primaryBold_44 = TextStyle(
      fontFamily: bold, color: AppColors.primaryColor, fontSize: 44.sp);

  static TextStyle regularBlack_8 =
      TextStyle(fontFamily: regular, color: black, fontSize: 8.sp);

  static TextStyle regularBlack_9 =
      TextStyle(fontFamily: regular, color: black, fontSize: 8.sp);

  static TextStyle regularBlack_10 =
      TextStyle(fontFamily: regular, color: black, fontSize: 10.sp);

  static TextStyle regularBlack_11 =
      TextStyle(fontFamily: regular, color: black, fontSize: 11.sp);

  static TextStyle regularBlack_12 = TextStyle(
    fontFamily: regular,
    color: black,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle regularBlack_13 =
      TextStyle(fontFamily: regular, color: black, fontSize: 13.sp);

  static TextStyle regularBlack_14 =
      TextStyle(fontFamily: regular, color: black, fontSize: 14.sp);

  static TextStyle regularBlack_15 =
      TextStyle(fontFamily: regular, color: black, fontSize: 15.sp);

  static TextStyle regularBlack_16 =
      TextStyle(fontFamily: regular, color: black, fontSize: 16.sp);

  static TextStyle regularBlack_17 =
      TextStyle(fontFamily: regular, color: black, fontSize: 17.sp);

  static TextStyle regularBlack_18 =
      TextStyle(fontFamily: regular, color: black, fontSize: 18.sp);

  static TextStyle regularBlack_20 =
      TextStyle(fontFamily: regular, color: black, fontSize: 20.sp);

  static TextStyle regularBlack_22 =
      TextStyle(fontFamily: regular, color: black, fontSize: 22.sp);

  static TextStyle regularBlack_24 =
      TextStyle(fontFamily: regular, color: black, fontSize: 24.sp);

  static TextStyle regularBlack_26 =
      TextStyle(fontFamily: regular, color: black, fontSize: 26.sp);

  static TextStyle regularBlack_64 =
      TextStyle(fontFamily: regular, color: black, fontSize: 64.sp);



  static TextStyle regularWhite_6 =
      TextStyle(fontFamily: regular, color: white, fontSize: 6.sp);

  static TextStyle regularWhite_8 =
      TextStyle(fontFamily: regular, color: white, fontSize: 8.sp);

  static TextStyle regularWhite_9 =
      TextStyle(fontFamily: regular, color: white, fontSize: 9.sp);

  static TextStyle regularWhite_10 =
      TextStyle(fontFamily: regular, color: white, fontSize: 10.sp);

  static TextStyle regularWhite_11 =
      TextStyle(fontFamily: regular, color: white, fontSize: 11.sp);

  static TextStyle regularWhite_12 =
      TextStyle(fontFamily: regular, color: white, fontSize: 12.sp);

  static TextStyle regularWhite_13 =
      TextStyle(fontFamily: regular, color: white, fontSize: 13.sp);

  static TextStyle regularWhite_14 =
      TextStyle(fontFamily: regular, color: white, fontSize: 14.sp);

  static TextStyle regularWhite_15 =
      TextStyle(fontFamily: regular, color: white, fontSize: 15.sp);

  static TextStyle regularWhite_16 =
      TextStyle(fontFamily: regular, color: white, fontSize: 16.sp);

  static TextStyle regularWhite_18 =
      TextStyle(fontFamily: regular, color: white, fontSize: 18.sp);

  static TextStyle regularWhite_20 =
      TextStyle(fontFamily: regular, color: white, fontSize: 20.sp);

  static TextStyle regularWhite_22 =
      TextStyle(fontFamily: regular, color: white, fontSize: 22.sp);

  static TextStyle regularWhite_24 =
      TextStyle(fontFamily: regular, color: white, fontSize: 24.sp);

  static TextStyle regularWhite_26 =
      TextStyle(fontFamily: regular, color: white, fontSize: 26.sp);

  static TextStyle regularWhite_32() {
    return TextStyle(fontFamily: regular, color:Get.isDarkMode
        ? AppColors.whiteColor
        : AppColors.blackColor, fontSize: 32.sp);
  }


  static TextStyle regularWhite_38 = TextStyle(color: AppColors.whiteColor,  fontSize: 38.sp, fontFamily: regular);

  static TextStyle regularWhite_80 =
    TextStyle(
      color: Get.isDarkMode
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 70.sp,
      fontFamily: regular,
      height: 1.0,
    );

  static TextStyle semiBoldBlack_8 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 8.sp);

  static TextStyle semiBoldBlack_9 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 8.sp);

  static TextStyle semiBoldBlack_10 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 10.sp);

  static TextStyle semiBoldBlack_11 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 11.sp);

  static TextStyle semiBoldBlack_12 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 12.sp);

  static TextStyle semiBoldBlack_13 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 13.sp);

  static TextStyle semiBoldBlack_14 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 14.sp);

  static TextStyle semiBoldPrimary_12 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 12.sp);

  static TextStyle semiBoldPrimary_14 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 14.sp);

  static TextStyle semiBoldPrimary_16 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 16.sp);

  static TextStyle semiBoldPrimary_20 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 20.sp);

  static TextStyle semiBoldPrimary_28 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 28.sp);

  static TextStyle semiBoldBlack_15 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 15.sp);

  static TextStyle semiBoldBlack_16 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 16.sp);

  static TextStyle semiBoldBlack_17 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 17.sp);

  static TextStyle semiBoldBlack_18 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 18.sp);

  static TextStyle primarySemiBold_12 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 12.sp);
  static TextStyle primarySemiBold_13 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 13.sp);

  static TextStyle primarySemiBold_14 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 14.sp);

  static TextStyle primarySemiBold_16 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 16.sp);

  static TextStyle primarySemiBold_17 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 17.sp);

  static TextStyle primarySemiBold_18 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 18.sp);

  static TextStyle primarySemiBold_20 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 20.sp);

  static TextStyle primarySemiBold_22 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 22.sp);

  static TextStyle primarySemiBold_32 = TextStyle(
      fontFamily: semiBold, color: AppColors.primaryColor, fontSize: 32.sp);

  static TextStyle primaryMedium_16 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 16.sp);

  static TextStyle primaryMedium_24 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 24.sp);

  static TextStyle primaryRegular_12 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 12.sp);

  static TextStyle semiBoldBlack_20 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 20.sp);

  static TextStyle semiBoldBlack_22 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 22.sp);

  static TextStyle semiBoldBlack_24 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 24.sp);

  static TextStyle semiBoldBlack_26 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 26.sp);

  static TextStyle semiBoldBlack_27 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 27.sp);

  static TextStyle semiBoldBlack_28 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 28.sp);

  static TextStyle semiBoldBlack_32 =
      TextStyle(fontFamily: semiBold, color: black, fontSize: 32.sp);

  static TextStyle semiBoldWhite_8 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 8.sp);

  static TextStyle semiBoldWhite_9 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 9.sp);

  static TextStyle semiBoldWhite_10 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 10.sp);

  static TextStyle semiBoldWhite_11 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 11.sp);

  static TextStyle semiBoldWhite_12 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 12.sp);

  static TextStyle semiBoldWhite_13 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 13.sp);

  static TextStyle semiBoldWhite_14 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 14.sp);

  static TextStyle semiBoldWhite_15 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 15.sp);

  static TextStyle semiBoldWhite_16 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 16.sp);

  static TextStyle semiBoldWhite_18 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 18.sp);

  static TextStyle semiBoldWhite_20 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 20.sp);

  static TextStyle semiBoldWhite_22 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 22.sp);

  static TextStyle semiBoldWhite_24 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 24.sp);

  static TextStyle semiBoldWhite_26 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 26.sp);

  static TextStyle semiBoldWhite_36 =
      TextStyle(fontFamily: semiBold, color: white, fontSize: 36.sp);

  static TextStyle boldBlack_8 =
      TextStyle(fontFamily: bold, color: black, fontSize: 8.sp);

  static TextStyle boldBlack_10 =
      TextStyle(fontFamily: bold, color: black, fontSize: 10.sp);

  static TextStyle boldBlack_11 =
      TextStyle(fontFamily: bold, color: black, fontSize: 11.sp);

  static TextStyle boldBlack_12 =
      TextStyle(fontFamily: bold, color: black, fontSize: 12.sp);

  static TextStyle boldBlack_13 =
      TextStyle(fontFamily: bold, color: black, fontSize: 13.sp);

  static TextStyle boldBlack_14 =
      TextStyle(fontFamily: bold, color: black, fontSize: 14.sp);

  static TextStyle boldBlack_15 =
      TextStyle(fontFamily: bold, color: black, fontSize: 15.sp);

  static TextStyle boldBlack_16 =
      TextStyle(fontFamily: bold, color: black, fontSize: 16.sp);

  static TextStyle boldBlack_17 =
      TextStyle(fontFamily: bold, color: black, fontSize: 17.sp);

  static TextStyle boldBlack_18 =
      TextStyle(fontFamily: bold, color: black, fontSize: 18.sp);

  static TextStyle boldBlack_20() {
    return  TextStyle(fontFamily: bold, color:  Get.isDarkMode
        ? AppColors.whiteColor
        : AppColors.blackColor, fontSize: 20.sp);
  }


  static TextStyle boldBlack_22 =
      TextStyle(fontFamily: bold, color: black, fontSize: 22.sp);

  static TextStyle boldBlack_24 =
      TextStyle(fontFamily: bold, color: black, fontSize: 24.sp);

  static TextStyle boldBlack_26 =
      TextStyle(fontFamily: bold, color: black, fontSize: 26.sp);

  static TextStyle boldBlack_28 =
      TextStyle(fontFamily: bold, color: black, fontSize: 28.sp);

  static TextStyle boldBlack_32 =
      TextStyle(fontFamily: bold, color: black, fontSize: 32.sp);

  static TextStyle boldBlack_35 =
      TextStyle(fontFamily: bold, color: black, fontSize: 35.sp);

  static TextStyle boldBlack_40 =
      TextStyle(fontFamily: bold, color: black, fontSize: 40.sp);

  static TextStyle boldWhite_8 =
      TextStyle(fontFamily: bold, color: white, fontSize: 8.sp);

  static TextStyle boldWhite_9 =
      TextStyle(fontFamily: bold, color: white, fontSize: 9.sp);

  static TextStyle boldWhite_10 =
      TextStyle(fontFamily: bold, color: white, fontSize: 10.sp);

  static TextStyle boldWhite_11 =
      TextStyle(fontFamily: bold, color: white, fontSize: 11.sp);

  static TextStyle boldWhite_12 =
      TextStyle(fontFamily: bold, color: white, fontSize: 12.sp);

  static TextStyle boldWhite_13 =
      TextStyle(fontFamily: bold, color: white, fontSize: 13.sp);

  static TextStyle boldWhite_14 =
      TextStyle(fontFamily: bold, color: white, fontSize: 14.sp);

  static TextStyle boldWhite_15 =
      TextStyle(fontFamily: bold, color: white, fontSize: 15.sp);

  static TextStyle boldWhite_16 =
      TextStyle(fontFamily: bold, color: white, fontSize: 16.sp);

  static TextStyle boldWhite_18 =
      TextStyle(fontFamily: bold, color: white, fontSize: 18.sp);

  static TextStyle boldWhite_20 =
      TextStyle(fontFamily: bold, color: white, fontSize: 20.sp);

  static TextStyle boldWhite_22 =
      TextStyle(fontFamily: bold, color: white, fontSize: 22.sp);

  static TextStyle boldWhite_24 =
      TextStyle(fontFamily: bold, color: white, fontSize: 24.sp);

  static TextStyle boldWhite_26 =
      TextStyle(fontFamily: bold, color: white, fontSize: 26.sp);

  static TextStyle boldWhite_32 =
      TextStyle(fontFamily: bold, color: white, fontSize: 32.sp);

  static TextStyle boldGray_6 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 6.sp);

  static TextStyle boldGray_8 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 8.sp);

  static TextStyle boldGray_9 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 9.sp);

  static TextStyle boldGray_10 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 10.sp);

  static TextStyle boldGray_11 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 11.sp);

  static TextStyle boldGray_12 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 12.sp);

  static TextStyle boldGray_13 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 13.sp);

  static TextStyle boldGray_14 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 14.sp);

  static TextStyle boldGray_15 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 15.sp);

  static TextStyle boldGray_16 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 16.sp);

  static TextStyle boldGray_18 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 18.sp);

  static TextStyle boldGray_20 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 20.sp);

  static TextStyle boldGray_22 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 22.sp);

  static TextStyle boldGray_24 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 24.sp);

  static TextStyle boldGray_26 =
      TextStyle(fontFamily: bold, color: gray, fontSize: 26.sp);

  static TextStyle mediumBlack_8 =
      TextStyle(fontFamily: medium, color: black, fontSize: 8.sp);

  static TextStyle mediumBlack_9 =
      TextStyle(fontFamily: medium, color: black, fontSize: 8.sp);

  static TextStyle mediumBlack_10 = TextStyle(
      fontFamily: medium,
      color: black,
      fontWeight: FontWeight.w500,
      fontSize: 10.sp);

  static TextStyle mediumBlack_11 =
      TextStyle(fontFamily: medium, color: black, fontSize: 11.sp);

  static TextStyle mediumBlack_12 = TextStyle(
      fontFamily: medium,
      color: black,
      fontWeight: FontWeight.w500,
      fontSize: 12.sp);

  static TextStyle mediumBlack_13 =
      TextStyle(fontFamily: medium, color: black, fontSize: 13.sp);

  static TextStyle mediumBlack_14 =
      TextStyle(fontFamily: medium, color: black, fontSize: 14.sp);

  static TextStyle mediumBlack_15 =
      TextStyle(fontFamily: medium, color: black, fontSize: 15.sp);

  static TextStyle mediumBlack_16 =
      TextStyle(fontFamily: medium, color: black, fontSize: 16.sp);

  static TextStyle mediumBlack_17 =
      TextStyle(fontFamily: medium, color: black, fontSize: 17.sp);

  static TextStyle mediumBlack_18 =
      TextStyle(fontFamily: medium, color: black, fontSize: 18.sp);

  static TextStyle mediumBlack_19 =
      TextStyle(fontFamily: medium, color: black, fontSize: 19.sp);

  static TextStyle mediumBlack_20 =
      TextStyle(fontFamily: medium, color: black, fontSize: 20.sp);

  static TextStyle mediumBlack_22 =
      TextStyle(fontFamily: medium, color: black, fontSize: 22.sp);

  static TextStyle mediumBlack_24 =
      TextStyle(fontFamily: medium, color: black, fontSize: 24.sp);

  static TextStyle mediumBlack_26 =
      TextStyle(fontFamily: medium, color: black, fontSize: 26.sp);

  static TextStyle mediumBlack_28 =
      TextStyle(fontFamily: medium, color: black, fontSize: 28.sp);

  static TextStyle mediumBlack_30 =
      TextStyle(fontFamily: medium, color: black, fontSize: 30.sp);

  static TextStyle mediumBlack_32 =
      TextStyle(fontFamily: medium, color: black, fontSize: 32.sp);

  static TextStyle mediumWhite_6 =
      TextStyle(fontFamily: medium, color: white, fontSize: 6.sp);

  static TextStyle mediumWhite_7 =
      TextStyle(fontFamily: medium, color: white, fontSize: 7.sp);

  static TextStyle mediumWhite_8 =
      TextStyle(fontFamily: medium, color: white, fontSize: 8.sp);

  static TextStyle mediumWhite_9 =
      TextStyle(fontFamily: medium, color: white, fontSize: 9.sp);

  static TextStyle mediumWhite_10 =
      TextStyle(fontFamily: medium, color: white, fontSize: 10.sp);

  static TextStyle mediumWhite_11 =
      TextStyle(fontFamily: medium, color: white, fontSize: 11.sp);

  static TextStyle mediumWhite_12 =
      TextStyle(fontFamily: medium, color: white, fontSize: 12.sp);

  static TextStyle primaryMedium_10 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 10.sp);

  static TextStyle primaryMedium_11 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 11.sp);

  static TextStyle primaryMedium_12 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 12.sp);

  static TextStyle primaryMedium_14 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 14.sp);

  static TextStyle primaryMedium_20 = TextStyle(
      fontFamily: medium, color: AppColors.primaryColor, fontSize: 20.sp);

  static TextStyle mediumWhite_13 =
      TextStyle(fontFamily: medium, color: white, fontSize: 13.sp);

  static TextStyle mediumWhite_14 =
      TextStyle(fontFamily: medium, color: white, fontSize: 14.sp);

  static TextStyle mediumWhite_15 =
      TextStyle(fontFamily: medium, color: white, fontSize: 15.sp);

  static TextStyle mediumWhite_16 =
      TextStyle(fontFamily: medium, color: white, fontSize: 16.sp);

  static TextStyle mediumWhite_17 =
      TextStyle(fontFamily: medium, color: white, fontSize: 17.sp);

  static TextStyle mediumWhite_18 =
      TextStyle(fontFamily: medium, color: white, fontSize: 18.sp);

  static TextStyle mediumWhite_20 =
      TextStyle(fontFamily: medium, color: white, fontSize: 20.sp);

  static TextStyle mediumWhite_22 =
      TextStyle(fontFamily: medium, color: white, fontSize: 22.sp);

  static TextStyle mediumWhite_24 =
      TextStyle(fontFamily: medium, color: white, fontSize: 24.sp);

  static TextStyle mediumWhite_26 =
      TextStyle(fontFamily: medium, color: white, fontSize: 26.sp);

  static TextStyle mediumWhite_32 =
      TextStyle(fontFamily: medium, color: white, fontSize: 32.sp);

}
