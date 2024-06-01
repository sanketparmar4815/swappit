import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:swapit/app/common/constant.dart';

class AnalyticsController extends GetxController {
  var onTapBack = false.obs, selectedMonth;
  List thisYearList = [
    "January 2024",
    "February 2024",
    "March 2024",
    "April 2024",
    "May 2024",
    "June 2024",
    "July 2024",
    "August 2024",
    "September 2024",
    "October 2024",
    "November 2024",
    "December 2024",
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<ChartLayer> layers() {
    // final from = DateTime(DateTime.now().year, 1);
    // final to = DateTime(DateTime.now().year, 12);
    // final frequency = (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 12.0;
    // print(frequency);
    // print('frequency');
    //final frequency = 1.0;
    return [
      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            // frequency: frequency,
            frequency: 1.0,
            max: 12.0,
            min: 1.0,
            // max: to.millisecondsSinceEpoch.toDouble(),
            // min: from.millisecondsSinceEpoch.toDouble(),
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 5.0,
            max: 20.0,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => int.parse("${value.toString().split('.').first}") <= 9
            ? DateFormat('MMM').format(DateTime.parse('${DateTime.now().year}-0${value.toString().split('.').first}-01 00:00:00'))
            : DateFormat('MMM').format(
                DateTime.parse('${DateTime.now().year}-${value.toString().split('.').first}-01 00:00:00'),
              ),
        // labelX: (value) => DateFormat('MMM').format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
        labelY: (value) => value.toInt().toString(),
      ),
      ChartLineLayer(
        items: [
          ChartLineDataItem(
            value: 10,
            x: 10,
          ),
        ],
        settings: ChartLineSettings(
          color: color.appColor,
          thickness: 4.0,
        ),
      ),
      ChartLineLayer(
        items: [
          ChartLineDataItem(value: 100, x: 150.0),
          ChartLineDataItem(value: 100, x: 150.0),
          ChartLineDataItem(value: 100, x: 150.0),
          ChartLineDataItem(value: 100, x: 150.0),
        ],
        settings: ChartLineSettings(
          color: Colors.green,
          thickness: 4.0,
        ),
      ),
      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          backgroundColor: Colors.black,
          circleBackgroundColor: Colors.green,
          circleBorderColor: Colors.black,
          circleSize: 8,
          circleBorderThickness: 5.0,
          currentPos: (item) => item.currentValuePos,
          onTextValue: (item) => '€${item.value.toString()}',
          marginBottom: 2.0,
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          radius: 6.0,
          textStyle: TextStyle(
            color: Colors.green,
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }
}
