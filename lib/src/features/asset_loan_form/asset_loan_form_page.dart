import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../constants/color.dart';
import '../../constants/icon.dart';
import '../../constants/text_style.dart';
import '../../utils/networking_util.dart';
import '../../widgets/button_icon.dart';
import '../../widgets/snackbar_widget.dart';
import '../../widgets/text_input_decor.dart';
import 'component/asset_loan_form_controller.dart';

class AssetLoanFormPage extends GetView<AssetLoanFormController> {
  AssetLoanFormPage({Key? key}) : super(key: key);
  // AssetLoanFormPage({super.key});

  // var drawerScreenController = Get.put(AssetLoanFormController(
  //   userRepository: Get.find<UserRepository>(),
  // ));

  // final AssetLoanFormController controller =
  //     Get.put(AssetLoanFormController());
  // RefreshController refreshControllerMaterial =
  //     RefreshController(initialRefresh: false);
  // RefreshController refreshControllerTool =
  //     RefreshController(initialRefresh: false);

  Future<void> refresh(type) async {
    if (type == "material") {
      controller.isLoadingMaterial.value = true;
      controller.clearTextMaterial();
      controller.refreshControllerMaterial.refreshCompleted();
    } else if (type == "tool") {
      controller.refreshControllerTool.refreshCompleted();
    }
  }

  void _onScrollDown(type) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (type == "material") {
      controller.doGetAssetNameMaterial(isLoadMore: true);
    } else if (type == "tool") {
      controller.doGetAssetNameTool(isLoadMore: true);
    }
  }

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
          'Form Peminjaman',
          style: TextStyles.rubik22Med,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Silahkan isi form dibawah untuk melakukan peminjaman alat & bahan',
                  style: TextStyles.rubik16Reg,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nama Peminjam',
                  style: TextStyles.rubik16Med,
                ),
                const SizedBox(height: 4),
                Text(
                  controller.etUsername.text,
                  style: TextStyles.rubik16Reg,
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pelanggan',
                        style: TextStyles.rubik16Med,
                      ),
                      TextSpan(
                        text: ' *',
                        style: TextStyles.rubik16MedRed,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: textInputDecorationForm.copyWith(
                      hintText: "Pilih pelanggan"),
                  value: controller.dropdownCustomer.value.isEmpty
                      ? null
                      : controller.dropdownCustomer.value,
                  onChanged: (String? newValue) {
                    controller.dropdownCustomer.value = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pelanggan belum dipilih';
                    } else {
                      return null;
                    }
                  },
                  hint: Text(
                    "Pilih pelanggan",
                    style: TextStyles.rubik16Reg.copyWith(color: Colors.grey),
                  ),
                  style: TextStyles.rubik16Reg,
                  items: <String>[
                    'PT Jakarta Sereal',
                    'PT Sumber Roso Karawang',
                    'PT Bogasari Jakarta',
                    'PT SRA Karawang',
                    'PT Wilmar Nabati Cilegon',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyles.rubik16Reg,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tanggal Ambil',
                  style: TextStyles.rubik16Med,
                ),
                const SizedBox(height: 4),
                Text(
                  controller.formattedDateNow.value,
                  style: TextStyles.rubik16Reg,
                ),
                // const SizedBox(height: 20),
                // const Text(
                //   'Status',
                //   style: TextStyles.rubik16Med,
                // ),
                // const SizedBox(height: 4),
                // const Text(
                //   'Pengambilan',
                //   style: TextStyles.rubik16Reg,
                // ),
                // const SizedBox(height: 20),
                // RichText(
                //   text: const TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'Jenis Proyek',
                //         style: TextStyles.rubik16Med,
                //       ),
                //       TextSpan(
                //         text: ' *',
                //         style: TextStyles.rubik16MedRed,
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10),
                // DropdownButtonFormField(
                //   decoration: textInputDecorationForm.copyWith(
                //       hintText: "Pilih jenis proyek"),
                //   value: controller.dropdownProjectType.value.isEmpty
                //       ? null
                //       : controller.dropdownProjectType.value,
                //   onChanged: (String? newValue) {
                //     controller.dropdownProjectType.value = newValue!;
                //   },
                //   hint: Text(
                //     "Pilih jenis proyek",
                //     style: TextStyles.rubik16Reg.copyWith(color: Colors.grey),
                //   ),
                //   style: TextStyles.rubik16Reg,
                //   items: <String>[
                //     'Fumigasi - Methyl Bromide',
                //     'Fumigasi - Phospine',
                //     'sadasd',
                //     'Pest Control - General of Pest',
                //     'Pest Control - Hama Gudang',
                //     'Termite Control - Baiting',
                //     'Termite Control - Inject',
                //     'Termite Control - Spraying',
                //   ].map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(
                //         value,
                //         style: TextStyles.rubik16Reg,
                //       ),
                //     );
                //   }).toList(),
                // ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bahan',
                                style: TextStyles.rubik16Med,
                              ),
                              TextSpan(
                                text: ' *',
                                style: TextStyles.rubik16MedRed,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        print(
                            "ID bahan: ${controller.selectedAssetIdsMaterial}");
                        print(
                            "Nama bahan: ${controller.selectedAssetNamesMaterial}");
                        print(
                            "Jumlah bahan: ${controller.selectedAssetQuantitiesMaterial}");
                        showBottomMaterial(context);
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          color: primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: white,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // ListView Builder untuk menampilkan hasil checkbox terpilih
                Obx(() {
                  if (controller.selectedAssetNamesMaterial.isEmpty) {
                    return const Center(
                      child: Text(
                        "Belum ada bahan yang dipilih",
                        style: TextStyles.rubik14MedGrey,
                      ),
                    );
                  }
                  return Column(
                    children: List.generate(
                      controller.selectedAssetNamesMaterial.length,
                      (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                controller.selectedAssetNamesMaterial[index],
                                style: TextStyles.rubik16Reg,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(24),
                                  onTap: () {
                                    controller.decreaseQuantityMaterial(index);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Obx(
                                  () => SizedBox(
                                    width: 55,
                                    height: 35,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      keyboardType: TextInputType.number,
                                      cursorColor: primary,
                                      // controller: controller.etQuantity,
                                      // initialValue: controller
                                      //     .selectedAssetQuantitiesMaterial[index]
                                      //     .toString(),
                                      controller: TextEditingController(
                                          text: controller
                                              .selectedAssetQuantitiesMaterial[
                                                  index]
                                              .toString()),
                                      onChanged: (value) {
                                        // Validasi input
                                        if (value.isNotEmpty) {
                                          int? newQuantity =
                                              int.tryParse(value);
                                          if (newQuantity != null &&
                                              newQuantity > 0) {
                                            controller.updateQuantityMaterial(
                                                index, newQuantity);
                                          } else {
                                            // Set ke 1 jika input tidak valid
                                            controller.updateQuantityMaterial(
                                                index, 1);
                                          }
                                        }
                                      },
                                      style: TextStyles.rubik16Reg,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      decoration:
                                          textInputDecorationQty.copyWith(
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                InkWell(
                                  borderRadius: BorderRadius.circular(24),
                                  onTap: () {
                                    controller.increaseQuantityMaterial(index);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: textColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.removeAssetMaterial(index);
                                  },
                                  visualDensity: VisualDensity.compact,
                                  icon: Image.asset(
                                    icDelete,
                                    height: 22.0,
                                    width: 22.0,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Alat',
                                style: TextStyles.rubik16Med,
                              ),
                              TextSpan(
                                text: ' *',
                                style: TextStyles.rubik16MedRed,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        print("ID alat: ${controller.selectedAssetIdsTool}");
                        print(
                            "Nama alat: ${controller.selectedAssetNamesTool}");
                        print(
                            "Jumlah alat: ${controller.selectedAssetQuantitiesTool}");
                        showBottomTool(context);
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          color: primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: white,
                          size: 35.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // ListView Builder untuk menampilkan hasil checkbox terpilih
                Obx(() {
                  if (controller.selectedAssetNamesTool.isEmpty) {
                    return const Center(
                      child: Text(
                        "Belum ada alat yang dipilih",
                        style: TextStyles.rubik14MedGrey,
                      ),
                    );
                  }
                  return Column(
                    children: List.generate(
                      controller.selectedAssetNamesTool.length,
                      (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                controller.selectedAssetNamesTool[index],
                                style: TextStyles.rubik16Reg,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(24),
                                  onTap: () {
                                    controller.decreaseQuantityTool(index);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: textColor,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Obx(
                                  () => SizedBox(
                                    width: 55,
                                    height: 35,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      keyboardType: TextInputType.number,
                                      cursorColor: primary,
                                      // controller: controller.etQuantity,
                                      // initialValue: controller
                                      //     .selectedAssetQuantitiesTool[index]
                                      //     .toString(),
                                      controller: TextEditingController(
                                          text: controller
                                              .selectedAssetQuantitiesTool[
                                                  index]
                                              .toString()),
                                      onChanged: (value) {
                                        // Validasi input
                                        if (value.isNotEmpty) {
                                          int? newQuantity =
                                              int.tryParse(value);
                                          if (newQuantity != null &&
                                              newQuantity > 0) {
                                            controller.updateQuantityTool(
                                                index, newQuantity);
                                          } else {
                                            // Set ke 1 jika input tidak valid
                                            controller.updateQuantityTool(
                                                index, 1);
                                          }
                                        }
                                      },
                                      style: TextStyles.rubik16Reg,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      decoration:
                                          textInputDecorationQty.copyWith(
                                        hintText: '0',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                InkWell(
                                  borderRadius: BorderRadius.circular(24),
                                  onTap: () {
                                    controller.increaseQuantityTool(index);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: textColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.removeAssetTool(index);
                                  },
                                  visualDensity: VisualDensity.compact,
                                  icon: Image.asset(
                                    icDelete,
                                    height: 22.0,
                                    width: 22.0,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(height: 20),
                const Text(
                  'Catatan Tambahan',
                  style: TextStyles.rubik16Med,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  cursorColor: primary,
                  maxLines: 4,
                  maxLength: 1000,
                  controller: controller.etNotes,
                  style: TextStyles.rubik16Reg,
                  decoration: textInputDecorationForm.copyWith(
                    hintText: 'Masukkan username',
                  ),
                ),
                const SizedBox(height: 20),
                loginButton(context),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) => Obx(
        () => controller.isLoadingAddLoan.value
            ? const Center(child: CircularProgressIndicator(color: primary))
            : SizedBox(
                height: 57,
                width: double.infinity,
                child: ButtonIcon(
                  buttonColor: primary,
                  textColor: white,
                  textLabel: "Kirim",
                  onClick: () {
                    print(
                        "Nama bahan: ${controller.selectedAssetNamesMaterial}");
                    final form = controller.key.currentState;
                    if (form!.validate()) {
                      if (controller.selectedAssetNamesMaterial.isEmpty) {
                        showBottomGagal(context, 'Bahan belum dipilih');
                      } else if (controller.selectedAssetNamesTool.isEmpty) {
                        showBottomGagal(context, 'Alat belum dipilih');
                      } else {
                        form.save();
                        controller.sendAssetsToApi();
                      }
                    }
                  },
                )),
      );

  void showBottomMaterial(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.635,
            child: Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight) * 1.35,
                child: Column(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: AppBar(
                          backgroundColor: white,
                          elevation: 0,
                          leadingWidth:
                              controller.isSearchingMaterial.value ? 50 : 0,
                          titleSpacing: 0,
                          centerTitle: controller.isSearchingMaterial.value
                              ? true
                              : false,
                          title: Obx(() {
                            if (controller.isSearchingMaterial.value) {
                              return SizedBox(
                                height: 40,
                                child: TextFormSearch(
                                    hint: "Cari bahan",
                                    suffixIcon:
                                        "assets/svg/close_circle_icon.svg",
                                    prefixIcon: "assets/svg/search_icon.svg",
                                    // prefixOnTap: salesController.customer,
                                    controller:
                                        controller.searchControllerMaterial,
                                    controllerClear:
                                        controller.clearTextMaterial,
                                    // onChanged: salesController
                                    //     .onSearchTextChanged,
                                    onFieldSubmitted: (value) {
                                      controller.globalSearchMaterial.value =
                                          controller
                                              .searchControllerMaterial.text;
                                      controller.doGetAssetNameMaterial(
                                          isLoadMore: false);
                                    }),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.only(left: 24.0),
                                child: Text(
                                  'Pilih Bahan',
                                  style: TextStyles.rubik18Med,
                                ),
                              );
                            }
                          }),
                          actions: [
                            Obx(
                              () => controller.isSearchingMaterial.value
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Container(),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: IconButton(
                                        icon: Image.asset(icSearch,
                                            height: 24.0, width: 24.0),
                                        onPressed:
                                            controller.toggleSearchMaterial,
                                      ),
                                    ),
                            ),
                          ],
                          leading: Obx(
                            () => IconButton(
                              icon: controller.isSearchingMaterial.value
                                  ? const Icon(
                                      Icons.keyboard_arrow_left_rounded,
                                      size: 34.0,
                                      color: primary,
                                    )
                                  : Container(),
                              onPressed: controller.toggleSearchMaterial,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: grey3,
                    ),
                  ],
                ),
              ),
              body: Obx(() => controller.isLoadingMaterial.value
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5 - 0.635,
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
                      controller: controller.refreshControllerMaterial,
                      onRefresh: () => refresh("material"),
                      onLoading: () => _onScrollDown("material"),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(controller.materials.length,
                              (index) {
                            var data = controller.materials[index];
                            var isSelected = controller.selectedAssetIdsMaterial
                                .contains(data.assetId.toString());

                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (isSelected) {
                                      int index = controller
                                          .selectedAssetNamesMaterial
                                          .indexOf(data.assetName);
                                      if (index != -1) {
                                        controller.removeAssetMaterial(index);
                                      }
                                      // controller.selectedMaterials
                                      //     .remove(data.assetId.toString());
                                      // controller.selectedAssetNamesMaterial
                                      //     .remove(data.assetName);
                                    } else {
                                      // controller.selectedMaterials
                                      //     .add(data.assetId.toString());
                                      // controller.selectedAssetNamesMaterial
                                      //     .add(data.assetName);
                                      controller.addAssetMaterial(
                                          data.assetId.toString(),
                                          data.assetName);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          data.assetName,
                                          style: TextStyles.rubik16Med,
                                        )),
                                        Checkbox(
                                          value: isSelected,
                                          focusColor: primary,
                                          hoverColor: primary,
                                          activeColor: primary,
                                          checkColor: white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          onChanged: (bool? value) {
                                            if (value == true) {
                                              // controller.selectedMaterials
                                              //     .add(data.assetId.toString());
                                              // controller.selectedAssetNamesMaterial
                                              //     .add(data.assetName);
                                              controller.addAssetMaterial(
                                                  data.assetId.toString(),
                                                  data.assetName);
                                            } else {
                                              int index = controller
                                                  .selectedAssetNamesMaterial
                                                  .indexOf(data.assetName);
                                              if (index != -1) {
                                                controller
                                                    .removeAssetMaterial(index);
                                              }
                                              // controller.selectedMaterials
                                              //     .remove(
                                              //         data.assetId.toString());
                                              // controller.selectedAssetNamesMaterial
                                              //     .remove(data.assetName);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    )),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primary, // Set the desired border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            // print(
                            //     "Data terpilih: ${controller.selectedMaterials.toList()}");
                            print(
                                "Data assetName bahan terpilih: ${controller.selectedAssetNamesMaterial}");
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: primary,
                              backgroundColor: white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              // padding: EdgeInsets.zero,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                          child: const Text(
                            'Kembali',
                            style: TextStyles.rubik12MedRed,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {});
  }

  void showBottomTool(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.635,
            child: Scaffold(
              backgroundColor: white,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight) * 1.35,
                child: Column(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                        child: AppBar(
                          backgroundColor: white,
                          elevation: 0,
                          leadingWidth:
                              controller.isSearchingTool.value ? 50 : 0,
                          titleSpacing: 0,
                          centerTitle:
                              controller.isSearchingTool.value ? true : false,
                          title: Obx(() {
                            if (controller.isSearchingTool.value) {
                              return SizedBox(
                                height: 40,
                                child: TextFormSearch(
                                    hint: "Cari alat",
                                    suffixIcon:
                                        "assets/svg/close_circle_icon.svg",
                                    prefixIcon: "assets/svg/search_icon.svg",
                                    // prefixOnTap: salesController.customer,
                                    controller: controller.searchControllerTool,
                                    controllerClear: controller.clearTextTool,
                                    // onChanged: salesController
                                    //     .onSearchTextChanged,
                                    onFieldSubmitted: (value) {
                                      controller.globalSearchTool.value =
                                          controller.searchControllerTool.text;
                                      controller.doGetAssetNameTool(
                                          isLoadMore: false);
                                    }),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.only(left: 24.0),
                                child: Text(
                                  'Pilih Alat',
                                  style: TextStyles.rubik18Med,
                                ),
                              );
                            }
                          }),
                          actions: [
                            Obx(
                              () => controller.isSearchingTool.value
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Container(),
                                    )
                                  : Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: IconButton(
                                        icon: Image.asset(icSearch,
                                            height: 24.0, width: 24.0),
                                        onPressed: controller.toggleSearchTool,
                                      ),
                                    ),
                            ),
                          ],
                          leading: Obx(
                            () => IconButton(
                              icon: controller.isSearchingTool.value
                                  ? const Icon(
                                      Icons.keyboard_arrow_left_rounded,
                                      size: 34.0,
                                      color: primary,
                                    )
                                  : Container(),
                              onPressed: controller.toggleSearchTool,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: grey3,
                    ),
                  ],
                ),
              ),
              body: Obx(() => controller.isLoadingTool.value
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5 - 0.635,
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
                      controller: controller.refreshControllerTool,
                      onRefresh: () => refresh("tool"),
                      onLoading: () => _onScrollDown("tool"),
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              List.generate(controller.tools.length, (index) {
                            var data = controller.tools[index];
                            var isSelected = controller.selectedAssetIdsTool
                                .contains(data.assetId.toString());

                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (isSelected) {
                                      int index = controller
                                          .selectedAssetNamesTool
                                          .indexOf(data.assetName);
                                      if (index != -1) {
                                        controller.removeAssetTool(index);
                                      }
                                      // controller.selectedTools
                                      //     .remove(data.assetId.toString());
                                      // controller.selectedAssetNamesTool
                                      //     .remove(data.assetName);
                                    } else {
                                      // controller.selectedTools
                                      //     .add(data.assetId.toString());
                                      // controller.selectedAssetNamesTool
                                      //     .add(data.assetName);
                                      controller.addAssetTool(
                                          data.assetId.toString(),
                                          data.assetName);
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          data.assetName,
                                          style: TextStyles.rubik16Med,
                                        )),
                                        Checkbox(
                                          value: isSelected,
                                          focusColor: primary,
                                          hoverColor: primary,
                                          activeColor: primary,
                                          checkColor: white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          onChanged: (bool? value) {
                                            if (value == true) {
                                              // controller.selectedTools
                                              //     .add(data.assetId.toString());
                                              // controller.selectedAssetNamesTool
                                              //     .add(data.assetName);
                                              controller.addAssetTool(
                                                  data.assetId.toString(),
                                                  data.assetName);
                                            } else {
                                              int index = controller
                                                  .selectedAssetNamesTool
                                                  .indexOf(data.assetName);
                                              if (index != -1) {
                                                controller
                                                    .removeAssetTool(index);
                                              }
                                              // controller.selectedTools
                                              //     .remove(
                                              //         data.assetId.toString());
                                              // controller.selectedAssetNamesTool
                                              //     .remove(data.assetName);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    )),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primary, // Set the desired border color
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            // print(
                            //     "Data terpilih: ${controller.selectedTools.toList()}");
                            print(
                                "Data assetName alat terpilih: ${controller.selectedAssetNamesTool}");
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: primary,
                              backgroundColor: white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              // padding: EdgeInsets.zero,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
                          child: const Text(
                            'Kembali',
                            style: TextStyles.rubik12MedRed,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {});
  }

  void showBottomGagal(BuildContext context, String message) {
    // Membuat dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: white,
          title: const Text(
            'Gagal',
            style: TextStyles.rubik18Med,
          ),
          content: Text(
            message,
            style: TextStyles.rubik16Reg,
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Aksi jika memilih "Batal"
                Navigator.of(context).pop();
              },
              child: const Text(
                'Kembali',
                style: TextStyles.rubik12MedRed,
              ),
            ),
          ],
        );
      },
    );
  }
}
