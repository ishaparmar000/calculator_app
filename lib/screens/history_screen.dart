import 'package:calculator_app/app_theme/stylehelper.dart';
import 'package:calculator_app/utils/const_image_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../app_theme/app_colors.dart';
import '../model/calc_history_model.dart';
import '../utils/db_helper.dart';
import 'display_controller.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  DisplayController displayController = Get.put(DisplayController());
  DBHelper dbHelper = DBHelper();


  @override
  void initState() {
    super.initState();
    getHistory();
  }

  Future<void> getHistory()async{
    displayController.historyList.clear();
    displayController.historyList.addAll(await dbHelper.fetchHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("History",style: StyleHelper.boldBlack_20()),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: (){
              dbHelper.clearHistoryResults();
              displayController.historyList.clear();
            },
              child: Text("Clear",style: TextStyle(fontSize: 17.sp,color: AppColors.primaryColor),).marginOnly(right: 10.w)),
        ],
      ),
      body: Obx(()=>displayController.historyList.isEmpty ? Center(child: Image.asset(AppImages.noData,height: 150.h,),):
      AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: displayController.historyList.length,
          itemBuilder: (context, index) {
            CalculationHistoryModel history = displayController.historyList[index];

            DateTime dateTime = DateTime.parse(history.createdAt);
            String time = DateFormat('hh:mm a').format(dateTime);
            String date = DateFormat('dd MMM yyyy').format(dateTime);

            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(
                milliseconds: 300,
                ),
              child: SlideAnimation(
                verticalOffset: 40,
                curve: Curves.easeOut,
                child: FadeInAnimation(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h,),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${history.expression} = ${history.result}", style: StyleHelper.customStyle(color: Get.isDarkMode ? AppColors.primaryColor : AppColors.blackColor, fontSize: 19.sp)),
                                  Text("$date $time", style: StyleHelper.customStyle(color: Get.isDarkMode ? AppColors.whiteColor : AppColors.blackColor, fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 8.w),

                            GestureDetector(
                              onTap: () {
                                dbHelper.deleteHistory(history.id.toString());
                                displayController.historyList.remove(history);
                              },
                              child: Image.asset(AppImages.icDelete, height: 20.h, width: 20.h),
                            ),
                          ],
                        ).marginOnly(bottom: 10.h),

                       // SizedBox(height: 10.h),
                        Divider(color: Colors.grey.withOpacity(0.2),height: 0.h,).marginOnly(top: 10.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ))
    );
  }
}
