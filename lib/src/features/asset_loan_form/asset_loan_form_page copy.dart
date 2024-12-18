// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import '../../constants/color.dart';
// import '../../constants/icon.dart';
// import '../../constants/text_style.dart';
// import '../../utils/networking_util.dart';
// import '../../widgets/snackbar_widget.dart';
// import '../../widgets/text_input_decor.dart';
// import 'component/asset_loan_form_controller.dart';

// class AssetLoanFormPage extends GetView<AssetLoanFormController> {
//   AssetLoanFormPage({Key? key}) : super(key: key);
//   // AssetLoanFormPage({super.key});

//   // var drawerScreenController = Get.put(AssetLoanFormController(
//   //   userRepository: Get.find<UserRepository>(),
//   // ));

//   // final AssetLoanFormController controller =
//   //     Get.put(AssetLoanFormController());
//   // RefreshController refreshControllerMaterial =
//   //     RefreshController(initialRefresh: false);
//   // RefreshController refreshControllerTool =
//   //     RefreshController(initialRefresh: false);

//   Future<void> refresh(type) async {
//     if (type == "material") {
//       controller.tempKodeCustomer1.value = "";
//       controller.tempNamaCustomer1.value = "";
//       controller.tempKodeCustomer2.value = "";
//       controller.tempNamaCustomer2.value = "";
//       controller.tempKodeCustomer3.value = "";
//       controller.tempNamaCustomer3.value = "";

//       controller.tempKodeLimit1.value = "10";
//       controller.tempNamaLimit1.value = "10 Data";

//       controller.isLoadingMaterial.value = true;
//       controller.clearTextMaterial();

//       // salesController.report();
//       controller.refreshControllerMaterial.refreshCompleted();
//     } else if (type == "tool") {
//       // salesController.tempKodeLimit1.value = "10";
//       // salesController.tempNamaLimit1.value = "10 Data";

//       // salesController.isLoadingBranch.value = true;
//       // salesController.clearTextBranch();
//       // salesController.branch();
//       controller.refreshControllerTool.refreshCompleted();
//     }
//   }

//   void _onScrollDown(type) async {
//     await Future.delayed(const Duration(milliseconds: 1000));

//     if (type == "material") {
//       controller.doGetAssetName(isLoadMore: true);
//     } else if (type == "tool") {
//       // if (mounted) salesController.branchScroll();
//       controller.refreshControllerTool.loadComplete();
//     }
//   }

//   void showBottomCustomer(BuildContext context, String stat) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(16.0),
//         ),
//       ),
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(16.0),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height * 0.635,
//             child: Scaffold(
//               backgroundColor: white,
//               appBar: PreferredSize(
//                 preferredSize: const Size.fromHeight(kToolbarHeight) * 1.35,
//                 child: Column(
//                   children: [
//                     Obx(
//                       () => Padding(
//                         padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
//                         child: AppBar(
//                           backgroundColor: white,
//                           elevation: 0,
//                           leadingWidth:
//                               controller.isSearchingMaterial.value ? 50 : 0,
//                           titleSpacing: 0,
//                           centerTitle: controller.isSearchingMaterial.value
//                               ? true
//                               : false,
//                           title: Obx(() {
//                             if (controller.isSearchingMaterial.value) {
//                               return SizedBox(
//                                 height: 40,
//                                 child: TextFormSearch(
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return "Pencarian tidak boleh kosong";
//                                       } else {
//                                         return null;
//                                       }
//                                     },
//                                     hint: "Cari bahan",
//                                     suffixIcon:
//                                         "assets/svg/close_circle_icon.svg",
//                                     prefixIcon: "assets/svg/search_icon.svg",
//                                     // prefixOnTap: salesController.customer,
//                                     controller:
//                                         controller.searchControllerMaterial,
//                                     controllerClear:
//                                         controller.clearTextMaterial,
//                                     // onChanged: salesController
//                                     //     .onSearchTextChanged,
//                                     onFieldSubmitted: (value) {
//                                       // controller.customer("filter");
//                                     }),
//                               );
//                             } else {
//                               return const Padding(
//                                 padding: EdgeInsets.only(left: 24.0),
//                                 child: Text(
//                                   'Pilih Bahan',
//                                   style: TextStyles.rubik18Med,
//                                 ),
//                               );
//                             }
//                           }),
//                           actions: [
//                             Obx(
//                               () => controller.isSearchingMaterial.value
//                                   ? Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 16.0),
//                                       child: Container(),
//                                     )
//                                   : Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 16.0),
//                                       child: IconButton(
//                                         icon: Image.asset(icSearch,
//                                             height: 24.0, width: 24.0),
//                                         onPressed:
//                                             controller.toggleSearchMaterial,
//                                       ),
//                                     ),
//                             ),
//                           ],
//                           leading: Obx(
//                             () => IconButton(
//                               icon: controller.isSearchingMaterial.value
//                                   ? const Icon(
//                                       Icons.keyboard_arrow_left_rounded,
//                                       size: 34.0,
//                                       color: primary,
//                                     )
//                                   : Container(),
//                               onPressed: controller.toggleSearchMaterial,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Divider(
//                       thickness: 1,
//                       height: 1,
//                       color: grey3,
//                     ),
//                   ],
//                 ),
//               ),
//               body: Obx(() => controller.isLoadingMaterial.value
//                   ? SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.5 - 0.635,
//                       child: const SizedBox(
//                         height: double.maxFinite,
//                         child: Align(
//                           alignment: Alignment.center,
//                           child: Center(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CircularProgressIndicator(
//                                   color: primary,
//                                   backgroundColor: white,
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Text(
//                                   'Memuat data',
//                                   style: TextStyles.rubik12MedGrey,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   : SmartRefresher(
//                       physics: const BouncingScrollPhysics(),
//                       enablePullDown: false,
//                       enablePullUp: true,
//                       header: const ClassicHeader(),
//                       controller: controller.refreshControllerMaterial,
//                       onRefresh: () => refresh("material"),
//                       onLoading: () => _onScrollDown("material"),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: List.generate(controller.materials.length,
//                               (index) {
//                             var data = controller.materials[index];
//                             var kode = controller.tempKodeCustomer1.value == ""
//                                 ? controller.tempKodeCustomer2.value
//                                 : controller.tempKodeCustomer1.value;

//                             return Column(
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     controller.tempKodeCustomer1.value =
//                                         data.assetId.toString();
//                                     controller.tempNamaCustomer1.value =
//                                         data.assetName;
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         24, 12, 24, 12),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                             child: Text(
//                                           data.assetName,
//                                           style: TextStyles.rubik16Med,
//                                         )),
//                                         // salesController
//                                         //             .tempKodeCustomer1.value ==
//                                         //         data.kode
//                                         kode == data.assetId.toString()
//                                             ? InkWell(
//                                                 onTap: () {},
//                                                 child: Container(
//                                                   height: 20,
//                                                   width: 20,
//                                                   decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                           width: 2,
//                                                           color: primary),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(3),
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                           color: primary,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             : InkWell(
//                                                 onTap: () {
//                                                   controller.tempKodeCustomer1
//                                                           .value =
//                                                       data.assetId.toString();

//                                                   controller.tempNamaCustomer1
//                                                       .value = data.assetName;
//                                                 },
//                                                 child: Container(
//                                                   height: 20,
//                                                   width: 20,
//                                                   decoration: BoxDecoration(
//                                                       border: Border.all(
//                                                           width: 1,
//                                                           color: grey),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10)),
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(2),
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       10)),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           }),
//                         ),
//                       ),
//                     )),
//               bottomNavigationBar: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SafeArea(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 40,
//                           padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                           margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: primary, // Set the desired border color
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Get.back();
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 foregroundColor: primary,
//                                 backgroundColor: white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 elevation: 0,
//                                 // padding: EdgeInsets.zero,
//                                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)),
//                             child: const Text(
//                               'Batal',
//                               style: TextStyles.rubik12MedRed,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: SizedBox(
//                           height: 40,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.pop(context, "terapkan");
//                               if (stat == "yes") {
//                                 controller.tempNamaCustomer3.value =
//                                     controller.tempNamaCustomer1.value;
//                                 controller.tempKodeCustomer3.value =
//                                     controller.tempKodeCustomer1.value;

//                                 // controller.report();
//                                 return;
//                               }

//                               controller.tempNamaCustomer2.value =
//                                   controller.tempNamaCustomer1.value;
//                               controller.tempKodeCustomer2.value =
//                                   controller.tempKodeCustomer1.value;
//                             },
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: white,
//                               backgroundColor: primary,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               elevation: 0,
//                               // padding: const EdgeInsets.fromLTRB(20, 12, 20, 12)
//                             ),
//                             child: const Text(
//                               'Terapkan',
//                               style: TextStyles.rubik14MedWhite,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     ).then((value) {
//       print('Bottom sheet closed');
//       // salesController.tempKodeCustomer2.value =
//       //     salesController.tempKodeCustomer3.value;

//       // salesController.tempKodeCustomer1.value =
//       //     salesController.tempKodeCustomer2.value == ""
//       //         ? salesController.tempKodeCustomer3.value
//       //         : salesController.tempKodeCustomer2.value;

//       controller.tempKodeCustomer1.value = controller.tempKodeCustomer2.value;

//       controller.tempNamaCustomer1.value = controller.tempNamaCustomer2.value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteGrey,
//       appBar: AppBar(
//         backgroundColor: white,
//         elevation: 10.0,
//         shadowColor: shadowColorAppbar,
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           borderRadius: BorderRadius.circular(8),
//           child: const Icon(
//             Icons.keyboard_arrow_left_rounded,
//             size: 34.0,
//             color: primary,
//           ),
//         ),
//         actions: const <Widget>[
//           SizedBox(
//             width: 55,
//             height: 55,
//           )
//         ],
//         centerTitle: true,
//         title: const Text(
//           'Form Peminjaman',
//           style: TextStyles.rubik22Med,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Silahkan isi form dibawah untuk melakukan peminjaman alat & bahan',
//                 style: TextStyles.rubik16Reg,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Nama Peminjam',
//                 style: TextStyles.rubik16Med,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 controller.etUsername.text,
//                 style: TextStyles.rubik16Reg,
//               ),
//               const SizedBox(height: 20),
//               RichText(
//                 text: const TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Pelanggan',
//                       style: TextStyles.rubik16Med,
//                     ),
//                     TextSpan(
//                       text: ' *',
//                       style: TextStyles.rubik16MedRed,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField(
//                 decoration: textInputDecorationForm.copyWith(
//                     hintText: "Pilih pelanggan"),
//                 value: controller.dropdownCustomer.value.isEmpty
//                     ? null
//                     : controller.dropdownCustomer.value,
//                 onChanged: (String? newValue) {
//                   controller.dropdownCustomer.value = newValue!;
//                 },
//                 hint: Text(
//                   "Pilih pelanggan",
//                   style: TextStyles.rubik16Reg.copyWith(color: Colors.grey),
//                 ),
//                 style: TextStyles.rubik16Reg,
//                 items: <String>[
//                   'PT Jakarta Sereal',
//                   'PT Sumber Roso Karawang',
//                   'PT Bogasari Jakarta',
//                   'PT SRA Karawang',
//                   'PT Wilmar Nabati Cilegon',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyles.rubik16Reg,
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Tanggal Ambil',
//                 style: TextStyles.rubik16Med,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 controller.formattedDateNow.value,
//                 style: TextStyles.rubik16Reg,
//               ),
//               // const SizedBox(height: 20),
//               // const Text(
//               //   'Status',
//               //   style: TextStyles.rubik16Med,
//               // ),
//               // const SizedBox(height: 4),
//               // const Text(
//               //   'Pengambilan',
//               //   style: TextStyles.rubik16Reg,
//               // ),
//               const SizedBox(height: 20),
//               RichText(
//                 text: const TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Jenis Proyek',
//                       style: TextStyles.rubik16Med,
//                     ),
//                     TextSpan(
//                       text: ' *',
//                       style: TextStyles.rubik16MedRed,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField(
//                 decoration: textInputDecorationForm.copyWith(
//                     hintText: "Pilih jenis proyek"),
//                 value: controller.dropdownProjectType.value.isEmpty
//                     ? null
//                     : controller.dropdownProjectType.value,
//                 onChanged: (String? newValue) {
//                   controller.dropdownProjectType.value = newValue!;
//                 },
//                 hint: Text(
//                   "Pilih jenis proyek",
//                   style: TextStyles.rubik16Reg.copyWith(color: Colors.grey),
//                 ),
//                 style: TextStyles.rubik16Reg,
//                 items: <String>[
//                   'Fumigasi - Methyl Bromide',
//                   'Fumigasi - Phospine',
//                   'sadasd',
//                   'Pest Control - General of Pest',
//                   'Pest Control - Hama Gudang',
//                   'Termite Control - Baiting',
//                   'Termite Control - Inject',
//                   'Termite Control - Spraying',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyles.rubik16Reg,
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       RichText(
//                         text: const TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Bahan',
//                               style: TextStyles.rubik16Med,
//                             ),
//                             TextSpan(
//                               text: ' *',
//                               style: TextStyles.rubik16MedRed,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   InkWell(
//                     borderRadius: BorderRadius.circular(24),
//                     onTap: () {
//                       showBottomCustomer(context, "yes");
//                     },
//                     child: Container(
//                       decoration: ShapeDecoration(
//                         color: primary,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                       ),
//                       child: const Icon(
//                         Icons.add,
//                         color: white,
//                         size: 35.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Koil Pemanas',
//                     style: TextStyles.rubik16Reg,
//                   ),
//                   Row(
//                     children: [
//                       InkWell(
//                         borderRadius: BorderRadius.circular(24),
//                         onTap: () {
//                           if (int.parse(controller.etQuantity.text) == 1) {
//                             SnackbarWidget.showFailedSnackbar(
//                                 NetworkingUtil.errorMessage(
//                                     'Kuantitas bahan tidak boleh kurang dari 1'));
//                           } else {
//                             controller.etQuantity.text =
//                                 (int.parse(controller.etQuantity.text) - 1)
//                                     .toString();
//                           }
//                         },
//                         child: const Icon(
//                           Icons.remove,
//                           color: textColor,
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       SizedBox(
//                         width: 55,
//                         height: 35,
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Username tidak boleh kosong';
//                             } else {
//                               return null;
//                             }
//                           },
//                           textAlign: TextAlign.center,
//                           textAlignVertical: TextAlignVertical.bottom,
//                           keyboardType: TextInputType.number,
//                           cursorColor: primary,
//                           controller: controller.etQuantity,
//                           style: TextStyles.rubik16Reg,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly,
//                             LengthLimitingTextInputFormatter(2),
//                           ],
//                           decoration: textInputDecorationQty.copyWith(
//                             hintText: '0',
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       InkWell(
//                         borderRadius: BorderRadius.circular(24),
//                         onTap: () {
//                           controller.etQuantity.text =
//                               (int.parse(controller.etQuantity.text) + 1)
//                                   .toString();
//                         },
//                         child: const Icon(
//                           Icons.add,
//                           color: textColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
