import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../constants/color.dart';
import '../../constants/text_style.dart';
import 'component/asset_dashboard_controller.dart';

class AssetDashboardPage extends GetView<AssetDashboardController> {
  const AssetDashboardPage({Key? key}) : super(key: key);
  // AssetDashboardPage({super.key});

  // var drawerScreenController = Get.put(AssetDashboardController(
  //   userRepository: Get.find<UserRepository>(),
  // ));

  // final AssetDashboardController controller =
  //     Get.put(AssetDashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteGrey,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 10.0,
        shadowColor: shadowColorAppbar,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(8),
          child: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 34.0,
            color: primary,
          ),
        ),
        actions: const <Widget>[
          SizedBox(
            width: 55,
            height: 55,
          )
        ],
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyles.rubik22Med,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              WidgetPieChart(
                textTitle: 'Kondisi Aset (Gudang)',
                widgetLegend: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: blue,
                      textTitle: 'First',
                      textData: '130 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: orange,
                      textTitle: 'Second',
                      textData: '30 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: primary,
                      textTitle: 'Third',
                      textData: '20 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: green,
                      textTitle: 'Fourth',
                      textData: '20 item',
                      isSquare: true,
                    ),
                  ],
                ),
                widgetChart: Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Obx(() {
                      return PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                controller.updateTouchedIndex(-1);
                                return;
                              }
                              controller.updateTouchedIndex(pieTouchResponse
                                  .touchedSection!.touchedSectionIndex);
                            },
                          ),
                          // titleSunbeamLayout: true,
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 60,
                          sections: controller.showingSections(),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              WidgetPieChart(
                textTitle: 'Kondisi Aset (Gudang)',
                widgetLegend: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: blue,
                      textTitle: 'First',
                      textData: '130 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: orange,
                      textTitle: 'Second',
                      textData: '30 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: primary,
                      textTitle: 'Third',
                      textData: '20 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: green,
                      textTitle: 'Fourth',
                      textData: '20 item',
                      isSquare: true,
                    ),
                  ],
                ),
                widgetChart: Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Obx(() {
                      return PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                controller.updateTouchedIndex(-1);
                                return;
                              }
                              controller.updateTouchedIndex(pieTouchResponse
                                  .touchedSection!.touchedSectionIndex);
                            },
                          ),
                          // titleSunbeamLayout: true,
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 60,
                          sections: controller.showingSections(),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              WidgetPieChart(
                textTitle: 'Kondisi Aset (Gudang)',
                widgetLegend: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: blue,
                      textTitle: 'First',
                      textData: '130 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: orange,
                      textTitle: 'Second',
                      textData: '30 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: primary,
                      textTitle: 'Third',
                      textData: '20 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: green,
                      textTitle: 'Fourth',
                      textData: '20 item',
                      isSquare: true,
                    ),
                  ],
                ),
                widgetChart: Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Obx(() {
                      return PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                controller.updateTouchedIndex(-1);
                                return;
                              }
                              controller.updateTouchedIndex(pieTouchResponse
                                  .touchedSection!.touchedSectionIndex);
                            },
                          ),
                          // titleSunbeamLayout: true,
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 60,
                          sections: controller.showingSections(),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              WidgetPieChart(
                textTitle: 'Kondisi Aset (Gudang)',
                widgetLegend: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: blue,
                      textTitle: 'First',
                      textData: '130 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: orange,
                      textTitle: 'Second',
                      textData: '30 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: primary,
                      textTitle: 'Third',
                      textData: '20 item',
                      isSquare: true,
                    ),
                    SizedBox(height: 4),
                    Indicator(
                      color: green,
                      textTitle: 'Fourth',
                      textData: '20 item',
                      isSquare: true,
                    ),
                  ],
                ),
                widgetChart: Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Obx(() {
                      return PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                controller.updateTouchedIndex(-1);
                                return;
                              }
                              controller.updateTouchedIndex(pieTouchResponse
                                  .touchedSection!.touchedSectionIndex);
                            },
                          ),
                          // titleSunbeamLayout: true,
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 60,
                          sections: controller.showingSections(),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetPieChart extends GetView<AssetDashboardController> {
  // const WidgetPieChart({Key? key}) : super(key: key);
  const WidgetPieChart({
    super.key,
    required this.textTitle,
    required this.widgetLegend,
    required this.widgetChart,
    // required this.textData,
    // required this.isSquare,
    // this.width = 6.0,
    // this.height = 20.0,
    // this.textColor,
  });
  final String textTitle;
  final Widget widgetLegend;
  final Widget widgetChart;
  // final String textData;
  // final bool isSquare;
  // final double width;
  // final double height;
  // final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: grey3,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textTitle,
                style: TextStyles.rubik16Med,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
                child: Divider(thickness: 1, color: grey3, height: 1.0),
              ),
              Row(
                children: <Widget>[
                  widgetLegend,
                  const SizedBox(height: 18),
                  widgetChart
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.textTitle,
    required this.textData,
    required this.isSquare,
    this.width = 6.0,
    this.height = 20.0,
    this.textColor,
  });
  final Color color;
  final String textTitle;
  final String textData;
  final bool isSquare;
  final double width;
  final double height;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textTitle,
              style: TextStyles.rubik14MedGrey,
            ),
            Text(
              textData,
              style: TextStyles.rubik16Med,
            )
          ],
        ),
      ],
    );
  }
}
