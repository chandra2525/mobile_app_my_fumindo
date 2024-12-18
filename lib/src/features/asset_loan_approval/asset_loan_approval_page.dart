import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../constants/color.dart';
import '../../constants/text_style.dart';
import 'component/asset_loan_approval_controller.dart';

class AssetLoanApprovalPage extends GetView<AssetLoanApprovalController> {
  const AssetLoanApprovalPage({Key? key}) : super(key: key);
  // AssetLoanApprovalPage({super.key});

  // var drawerScreenController = Get.put(AssetLoanApprovalController(
  //   userRepository: Get.find<UserRepository>(),
  // ));

  // final AssetLoanApprovalController controller =
  //     Get.put(AssetLoanApprovalController());

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
          'Persetujuan Peminjaman',
          style: TextStyles.rubik22Med,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(controller.loans.length, (index) {
            var data = controller.loans[index];
            var isSelected = controller.selectedAssetIdsLoan
                .contains(data.loanId.toString());

            return Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          data.customerName,
                          style: TextStyles.rubik16Med,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class WidgetPieChart extends GetView<AssetLoanApprovalController> {
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
