import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app_my_fumindo/src/features/asset_loan_approval/component/asset_loan_approval_detail_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../constants/color.dart';
import '../../constants/text_style.dart';

class AssetLoanApprovalDetailPage
    extends GetView<AssetLoanApprovalDetailController> {
  const AssetLoanApprovalDetailPage({Key? key}) : super(key: key);
  // AssetLoanApprovalDetailPage({super.key});

  // var drawerScreenController = Get.put(AssetLoanApprovalDetailController(
  //   userRepository: Get.find<UserRepository>(),
  // ));

  // final AssetLoanApprovalDetailController controller =
  //     Get.put(AssetLoanApprovalDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
          'Detail Persetujuan',
          style: TextStyles.rubik22Med,
        ),
      ),
      body: Obx(() {
        if (controller.isLoadingLoanDetail.value) {
          return SizedBox(
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
          );
        }
        final loanDetail = controller.assetLoanDetail.value;
        DateTime dateTime = DateTime.parse(loanDetail!.loanDate);

        String formattedDate =
            DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(dateTime);
        String formattedTime = DateFormat('HH:mm:ss').format(dateTime);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey3,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status Approval',
                        style: TextStyles.rubik16Med,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: orangeBackground,
                          border: Border.all(
                            color: orange,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          child: Text(
                            '${loanDetail?.status}',
                            style: TextStyles.rubik14MedOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14.0),
              controller.isDetailHide.value
                  ? InkWell(
                      onTap: () {
                        controller.toggleDetailHide();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey3,
                            width: 1.0,
                          ),
                          color: grey6,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              child: Text(
                                'Detail Peminjam',
                                style: TextStyles.rubik16Med,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 34.0,
                                color: grey4,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grey3,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.toggleDetailHide();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: grey6,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 16.0),
                                    child: Text(
                                      'Detail Peminjam',
                                      style: TextStyles.rubik16Med,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      size: 34.0,
                                      color: grey4,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1.0,
                            width: double.infinity,
                            color: grey3,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No Peminjam',
                                  style: TextStyles.rubik14Reg,
                                ),
                                Expanded(
                                  child: Text(
                                    "#No Peminjam",
                                    style: TextStyles.rubik14Reg,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 1.0,
                              width: double.infinity,
                              color: grey3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Nama Peminjam',
                                  style: TextStyles.rubik14Reg,
                                ),
                                Expanded(
                                  child: Text(
                                    loanDetail.user!.username,
                                    style: TextStyles.rubik14Reg,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 1.0,
                              width: double.infinity,
                              color: grey3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Pelanggan',
                                  style: TextStyles.rubik14Reg,
                                ),
                                Expanded(
                                  child: Text(
                                    loanDetail.customerName,
                                    style: TextStyles.rubik14Reg,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 1.0,
                              width: double.infinity,
                              color: grey3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tanggal Ambil',
                                  style: TextStyles.rubik14Reg,
                                ),
                                Expanded(
                                  child: Text(
                                    formattedDate,
                                    style: TextStyles.rubik14Reg,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              height: 1.0,
                              width: double.infinity,
                              color: grey3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Jam Ambil',
                                  style: TextStyles.rubik14Reg,
                                ),
                                Text(
                                  '$formattedTime WIB',
                                  style: TextStyles.rubik14Reg,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(height: 20),
              const Text(
                'Bahan',
                style: TextStyles.rubik16Med,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey3,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: loanDetail.assetLoans
                        .where((assetBahan) =>
                            assetBahan.asset?.category == 'Bahan')
                        .length,
                    itemBuilder: (context, index) {
                      final filteredAssetBahan = loanDetail.assetLoans
                          .where((assetBahan) =>
                              assetBahan.asset?.category == 'Bahan')
                          .toList();
                      final assetBahan = filteredAssetBahan[index];
                      final isLastItemBahan =
                          index == filteredAssetBahan.length - 1;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      assetBahan.asset?.assetName ??
                                          'Unknown Asset',
                                      style: TextStyles.rubik14Reg,
                                    ),
                                    // Text(
                                    //   assetBahan.asset?.category ??
                                    //       'Unknown Category',
                                    //   style: TextStyles.rubik14Reg,
                                    // ),
                                  ],
                                ),
                              ),
                              Text('Qty : ${assetBahan.quantity}'),
                            ],
                          ),
                          if (!isLastItemBahan)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                height: 1.0,
                                width: double.infinity,
                                color: grey3,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Alat',
                style: TextStyles.rubik16Med,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey3,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: loanDetail.assetLoans
                        .where(
                            (assetAlat) => assetAlat.asset?.category == 'Alat')
                        .length,
                    itemBuilder: (context, index) {
                      final filteredAssetAlat = loanDetail.assetLoans
                          .where((assetAlat) =>
                              assetAlat.asset?.category == 'Alat')
                          .toList();
                      final assetAlat = filteredAssetAlat[index];
                      final isLastItemAlat =
                          index == filteredAssetAlat.length - 1;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      assetAlat.asset?.assetName ??
                                          'Unknown Asset',
                                      style: TextStyles.rubik14Reg,
                                    ),
                                    // Text(
                                    //   assetAlat.asset?.category ??
                                    //       'Unknown Category',
                                    //   style: TextStyles.rubik14Reg,
                                    // ),
                                  ],
                                ),
                              ),
                              Text('Qty : ${assetAlat.quantity}'),
                            ],
                          ),
                          if (!isLastItemAlat)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                height: 1.0,
                                width: double.infinity,
                                color: grey3,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Catatan Tambahan',
                style: TextStyles.rubik16Med,
              ),
              const SizedBox(height: 10),
              Text(
                loanDetail.notes,
                style: TextStyles.rubik14Reg,
              ),
            ],
          ),
        );
      }),
    );
  }
}
