import 'package:dietin/app/shared/constants/constant.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryWhite,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 11.h),
            Center(
              child: Text('Statistik', style: AppTextStyles.headingAppBar),
            ),
            SizedBox(height: 20.h),
            _buildTabBar(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Asupan Nutrisi', style: AppTextStyles.label),
                  _buildNutrientDropdown(),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                switch (controller.selectedTab.value) {
                  case 0:
                    return _buildDailyChart();
                  case 1:
                    return _buildWeeklyChart();
                  case 2:
                    return Center(
                      child: Text(
                        'Statistik ${controller.selectedNutrient.value} - Bulan',
                        style: AppTextStyles.label,
                      ),
                    );
                  default:
                    return SizedBox();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientDropdown() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(64.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Theme(
          data: Theme.of(Get.context!).copyWith(
            popupMenuTheme: PopupMenuThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12.r,
                ), // Radius menu dropdown
              ),
            ),
          ),
          child: DropdownButton<String>(
            value: controller.selectedNutrient.value,
            underline: SizedBox(),
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
            dropdownColor: Colors.white,
            style: AppTextStyles.label.copyWith(fontSize: 14.sp),
            items: controller.nutrients.map((String nutrient) {
              return DropdownMenuItem<String>(
                value: nutrient,
                child: Text(nutrient),
              );
            }).toList(),
            onChanged: controller.changeNutrient,
          ),
        ),
      ),
    );
  }

  Widget _buildDailyChart() {
    return Obx(() {
      final data = controller.nutritionData[controller.selectedNutrient.value]!;
      final sections = data['sections'] as List;
      final total = data['total'];
      final consumed = data['consumed'];

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              height: 250.h,
              child: Center(
                child: _buildCircularProgress(
                  sections: sections,
                  total: total,
                  consumed: consumed,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Detail', style: AppTextStyles.labelBold),
                Obx(
                  () => Text(
                    '${controller.selectedNutrient.value} (${controller.currentUnit})',
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.mainWhite,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              //main row
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/images/sunrise_ic.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text('Sarapan', style: AppTextStyles.bodySmallSemiBold),
                    ],
                  ),
                  //right row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${sections[0]['value']}',
                        style: AppTextStyles.labelBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.mainWhite,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              //main row
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/images/sun_ic.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Makan Siang',
                        style: AppTextStyles.bodySmallSemiBold,
                      ),
                    ],
                  ),
                  //right row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${sections[1]['value']}',
                        style: AppTextStyles.labelBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.mainWhite,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              //main row
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.transparent,
                        child: SvgPicture.asset(
                          'assets/images/sunset_ic.svg',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Makan Malam',
                        style: AppTextStyles.bodySmallSemiBold,
                      ),
                    ],
                  ),
                  //right row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${sections[2]['value']}',
                        style: AppTextStyles.labelBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      );
    });
  }

  Widget _buildWeeklyChart() {
    return Obx(() {
      final data =
          controller.weeklyNutritionData[controller.selectedNutrient.value]!;
      final days = data['days'] as List;

      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            // Bar Chart
            Container(
              height: 200.h,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.mainWhite,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(days.length, (index) {
                  final day = days[index];
                  final percentage = day['percentage'] as double;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => controller.toggleDaySelection(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Progress Bar Stack
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Obx(() {
                                  final isSelected =
                                      controller.selectedDayIndex.value ==
                                      index;
                                  return Container(
                                    width: double.infinity,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.calorieBackgroundActive
                                          .withValues(alpha: 0.3),
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                      border: isSelected
                                          ? Border.all(
                                              color: AppColors.primary,
                                              width: 2.w,
                                            )
                                          : null,
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: double.infinity,
                                        height: (150.h * percentage).clamp(
                                          10.0,
                                          150.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.calorieBackgroundActive,
                                          borderRadius: BorderRadius.circular(
                                            100.r,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            // Day label
                            Obx(() {
                              final isSelected =
                                  controller.selectedDayIndex.value == index;
                              return Text(
                                controller.weekDays[index],
                                style: AppTextStyles.label.copyWith(
                                  fontSize: 12.sp,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.lightGrey,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 30.h),
            // Detail Section
            Obx(() {
              final selectedIndex = controller.selectedDayIndex.value;

              // Jika ada hari yang dipilih, tampilkan breakdown detail
              if (selectedIndex >= 0 && selectedIndex < days.length) {
                final selectedDay = days[selectedIndex];
                final breakdown = selectedDay['breakdown'] as List;

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail ${selectedDay['day']}',
                          style: AppTextStyles.labelBold,
                        ),
                        Text(
                          '${controller.selectedNutrient.value} (${controller.currentUnit})',
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.lightGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // Breakdown cards (Sarapan, Makan Siang, Makan Malam)
                    _buildMealCard(
                      'assets/images/sunrise_ic.svg',
                      breakdown[0]['label'],
                      breakdown[0]['value'],
                    ),
                    SizedBox(height: 12.h),
                    _buildMealCard(
                      'assets/images/sun_ic.svg',
                      breakdown[1]['label'],
                      breakdown[1]['value'],
                    ),
                    SizedBox(height: 12.h),
                    _buildMealCard(
                      'assets/images/sunset_ic.svg',
                      breakdown[2]['label'],
                      breakdown[2]['value'],
                    ),
                    SizedBox(height: 30.h),
                  ],
                );
              }

              // Jika tidak ada yang dipilih, tampilkan semua hari
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Detail', style: AppTextStyles.labelBold),
                      Text(
                        '${controller.selectedNutrient.value} (${controller.currentUnit})',
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Detail Cards for each day
                  ...List.generate(days.length, (index) {
                    final day = days[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: GestureDetector(
                        onTap: () => controller.toggleDaySelection(index),
                        child: Container(
                          width: 1.sw,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.mainWhite,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.calorieBackgroundActive
                                          .withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.weekDays[index],
                                        style: AppTextStyles.bodySmallSemiBold
                                            .copyWith(
                                              color: AppColors.primary,
                                              fontSize: 12.sp,
                                            ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    day['day'],
                                    style: AppTextStyles.bodySmallSemiBold,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${day['value']}',
                                    style: AppTextStyles.labelBold.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.chevron_right,
                                    color: AppColors.lightGrey,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 30.h),
                ],
              );
            }),
          ],
        ),
      );
    });
  }

  Widget _buildMealCard(String iconPath, String label, int value) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.mainWhite,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
              ),
              SizedBox(width: 12.w),
              Text(label, style: AppTextStyles.bodySmallSemiBold),
            ],
          ),
          Text(
            '$value',
            style: AppTextStyles.labelBold.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = ['Hari', 'Minggu', 'Bulan'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Obx(
          () => Row(
            children: List.generate(
              tabs.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () => controller.changeTab(index),
                  child: Container(
                    margin: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: controller.selectedTab.value == index
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: AppTextStyles.label.copyWith(
                          color: controller.selectedTab.value == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularProgress({
    required List sections,
    required int total,
    required int consumed,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 250.w,
          height: 250.h,
          child: CustomPaint(
            painter: CircularProgressPainter(sections: sections, total: total),
          ),
        ),
        // Center text
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$consumed',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text(
              '/ $total',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 4.h),
            Text(
              controller.selectedNutrient.value,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final List sections;
  final int total;

  CircularProgressPainter({required this.sections, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final strokeWidth = 40.0;

    final bgPaint = Paint()
      ..color = AppColors.calorieBackgroundActive.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - strokeWidth / 2, bgPaint);

    double totalConsumed = 0;
    for (var section in sections) {
      totalConsumed += section['value'];
    }

    if (totalConsumed > 0) {
      final sweepAngle = (totalConsumed / total) * 2 * math.pi;

      final paint = Paint()
        ..color = AppColors.calorieBackgroundActive
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        -math.pi / 2,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
