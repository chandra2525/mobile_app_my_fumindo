// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';
// import '../constants/endpoint.dart';
// import '../models/material_model.dart';
// // import '../models/product_model.dart';
// // import '../models/request/product_list_request_model.dart';
// // import '../models/response/product_list_response_model.dart';
// // import '../utils/networking_util.dart';

// class AssetRepository {
//   final Dio _client;
//   final GetStorage _local;

//   AssetRepository({required Dio client, required GetStorage local})
//       : _client = client,
//         _local = local;

//   final box = GetStorage();

//   Future<MaterialModel> getAssetNameList(filterAssetName, globalSearch,
//       sortColumn, sortOrder, currentPage, pageSize) async {
//     print('object');
//     var params = {
//       "asset_name": filterAssetName.value,
//       "search": globalSearch.value,
//       "order_by": sortColumn.value,
//       "order_direction": sortOrder.value,
//       "page": currentPage.value, // Kirim nomor halaman
//       "pageSize": pageSize.value,
//     };
//     print('object');
//     try {
//       final responseJson = await _client.get(
//         Endpoint.asset,
//         data: params,
//         options: Options(
//           headers: {
//             "Authorization": "Bearer ${box.read('access_token')}",
//           },
//         ),
//       );
//       final data = responseJson.data;
//       print(data);
//       return MaterialModel.fromJson(responseJson.data);
//     } on DioError catch (_) {
//       rethrow;
//     }
//   }

// //   Future<ProductModel> getProductDetail(String productId) async {
// //     print("code response ${productId}");
// //     try {
// //       final response = await _client.get(
// //         'http://develop-at.vesperia.id:1091/api/v1/product/$productId',
// //         options:
// //             NetworkingUtil.setupNetworkOptions('Bearer ${box.read('token')}'),
// //       );
// //       print("code response ${response}");
// //       return ProductModel.fromJson(response.data['data']);
// //     } on DioError catch (_) {
// //       rethrow;
// //     }
// //   }
// }
