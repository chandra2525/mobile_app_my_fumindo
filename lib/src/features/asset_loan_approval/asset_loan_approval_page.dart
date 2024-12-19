import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../app/routes/route_name.dart';
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

  Future<void> refresh(type) async {
    if (type == "loan") {
      controller.isLoadingLoan.value = true;
      controller.clearTextLoan();
      controller.refreshControllerLoan.refreshCompleted();
    }
  }

  void _onScrollDown(type) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (type == "loan") {
      controller.doGetAssetLoan(isLoadMore: true);
    }
  }

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
          style: TextStyles.rubik20MedRed,
        ),
      ),
      body: Obx(
        () => controller.isLoadingLoan.value
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const SizedBox(
                  height: double.maxFinite,
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: primary,
                            backgroundColor: white,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Memuat data',
                            style: TextStyles.rubik12MedGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : SmartRefresher(
                physics: const BouncingScrollPhysics(),
                enablePullDown: false,
                enablePullUp: true,
                header: const ClassicHeader(),
                controller: controller.refreshControllerLoan,
                onRefresh: () => refresh("loan"),
                onLoading: () => _onScrollDown("loan"),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Column(
                      children: List.generate(controller.loans.length, (index) {
                        var data = controller.loans[index];

                        DateTime dateTime = DateTime.parse(data.loanDate);

                        String formattedDate =
                            DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                .format(dateTime);
                        String formattedTime =
                            DateFormat('HH:mm:ss').format(dateTime);
                        return InkWell(
                          onTap: () {
                            controller.loanId.value = data.loanId.toString();
                            Get.toNamed(RouteName.assetLoanApprovalDetail);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                            child: Container(
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 14.0, 20.0, 14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.customerName,
                                              style: TextStyles.rubik14Med,
                                            ),
                                            const SizedBox(height: 5.0),
                                            const Text(
                                              "#No Peminjaman",
                                              style: TextStyles.rubik12Reg,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 12.0,
                                              ),
                                              child: Text(
                                                data.status,
                                                style:
                                                    TextStyles.rubik12RegWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      '$formattedDate, $formattedTime WIB',
                                      style: TextStyles.rubik12Reg,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
