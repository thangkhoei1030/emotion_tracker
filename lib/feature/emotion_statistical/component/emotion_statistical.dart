import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class EmotionStatistical extends GetView<EmotionStatisticalController> {
  const EmotionStatistical({super.key});

  BarChartData get barChartData => BarChartData(
        backgroundColor: Colors.transparent,
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(),
          rightTitles: AxisTitles(),
          leftTitles: AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => TextBuild(
                fontSize: AppDimens.sizeTextSmall,
                title: DateTimeFormat().getDayOfWeakFromDay(
                  value.floor(),
                ),
              ).paddingSymmetric(vertical: AppDimens.paddingVerySmallest),
            ),
          ),
        ),
        barGroups: controller.emotionStatisticalResponse.isEmpty
            ? []
            : [
                BarChartGroupData(
                  x: 1,
                  barRods: barChartRodData(1),
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: barChartRodData(2),
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: barChartRodData(3),
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: barChartRodData(4),
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: barChartRodData(5),
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: barChartRodData(6),
                ),
                BarChartGroupData(
                  x: 7,
                  barRods: barChartRodData(7),
                ),
              ],
      );

  List<BarChartRodData> barChartRodData(int index) => [
        BarChartRodData(
          width: 20,
          toY: controller.emotionStatisticalResponse[index - 1].point
                  ?.toDouble() ??
              0,
          backDrawRodData: BackgroundBarChartRodData(
              fromY: controller.emotionStatisticalResponse[index - 1].point
                      ?.toDouble() ??
                  0,
              show: true,
              color: Colors.white.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(AppDimens.radius20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.yellow.shade300,
              Colors.lightBlueAccent.withOpacity(0.2),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      paddingModel: const PaddingModel(paddingAll: AppDimens.defaultPadding),
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlue.withOpacity(0.5),
            Colors.lightBlue,
          ]),
      radiusModel: const RadiusModel(radiusAll: AppDimens.radius20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextBuild(
                      title: "Xu hướng tuần",
                      textColor: Colors.white,
                    ),
                    UtilWidget.sizedBoxPadding,
                    TextBuild(
                      title: "Tích cực",
                      isBoldText: true,
                      fontSize: AppDimens.sizeTextVeryLarge,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const AnimationDialog(
                  animationDialogType: AnimationDialogType.graphStatistical,
                  height: 100,
                )
              ],
            ),
          ),
          UtilWidget.sizedBoxPadding,
          AspectRatio(
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.radius20),
              child: BarChart(
                barChartData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
