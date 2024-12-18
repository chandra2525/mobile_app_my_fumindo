import 'package:dio/dio.dart';
import 'package:mobile_app_my_fumindo/app/routes/route_name.dart';
import 'package:mobile_app_my_fumindo/src/constants/local_data_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/endpoint.dart';
import '../models/response/user_response_model.dart';
import '../utils/networking_util.dart';
import '../widgets/snackbar_widget.dart';

class UserRepository {
  final Dio _client;
  final GetStorage _local;

  UserRepository({required Dio client, required GetStorage local})
      : _client = client,
        _local = local;

  final box = GetStorage();

  Future<void> login(etUsername, etPassword) async {
    var body = {
      "username": etUsername,
      "password": etPassword,
    };
    try {
      final responseJson = await _client.post(
        Endpoint.logIn,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );
      final data = responseJson.data;

      print("data user ${responseJson.statusCode.toString()}");
      if (responseJson.statusCode == 201) {
        var accessToken = data['access_token'];
        var userId = data['user_id'];

        box.write('access_token', accessToken);
        box.write('user_id', userId);
        box.write('etUsername', etUsername);

        Get.offAllNamed(RouteName.dashboard);
      } else {
        SnackbarWidget.showFailedSnackbar(
            NetworkingUtil.errorMessage(data['message']));
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> logout() async {
    // await Future.delayed(const Duration(seconds: 2));
    print(box.read('access_token'));

    try {
      final responseJson = await _client.post(
        Endpoint.logOut,
        options: Options(
          headers: {
            "Authorization": "Bearer ${box.read('access_token')}",
          },
        ),
      );
      final data = responseJson.data;
      if (responseJson.statusCode == 201) {
        await _local.remove(LocalDataKey.token);

        box.remove('access_token');
        box.remove('user_id');
        box.remove('etUsername');

        Get.offAllNamed(RouteName.login);
        SnackbarWidget.showFailedSnackbar(
            NetworkingUtil.errorMessage(data['message']));
      } else {
        SnackbarWidget.showFailedSnackbar(
            NetworkingUtil.errorMessage(data['message']));
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<void> refreshToken() async {
    final accessToken = box.read('access_token');
    var body = {
      "refresh_token": accessToken,
    };

    try {
      final responseJson = await _client.post(
        Endpoint.refresh,
        data: body,
        options: Options(
          headers: {
            // "Content-Type": "application/x-www-form-urlencoded",
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      final data = responseJson.data;
      print("Hasil token terbaru : ${responseJson.statusCode.toString()}");

      if (responseJson.statusCode == 201) {
        var accessToken = data['access_token'];
        box.write('access_token', accessToken);
        print("Token berhasil diperbarui : $accessToken");
      } else {
        SnackbarWidget.showFailedSnackbar(
            NetworkingUtil.errorMessage(data['message']));
      }
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<UserResponseModel> getUser() async {
    try {
      final responseJson = await _client.get(
        Endpoint.getUser,
        options:
            NetworkingUtil.setupNetworkOptions('Bearer ${box.read('token')}'),
      );

      print("data user ${responseJson.data}");
      print("data user ${responseJson.statusCode}");
      final model = UserResponseModel.fromJson(responseJson.data);
      return model;
    } on DioException catch (_) {
      rethrow;
    }
  }

  /*
    This Function is used as challenge tester
    DO NOT modify this function
   */
  Future<void> testUnauthenticated() async {
    try {
      final realToken = _local.read<String?>(LocalDataKey.token);
      await _local.write(LocalDataKey.token, box.read('token'));
      getUser();
      //401 not caught as exception
      await _local.write(LocalDataKey.token, realToken);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> saveProfile(etFullName, etEmail, gender, etHeight, etWeight,
      etBirthDate, profilePicture) async {
    var body = {
      "name": etFullName,
      "email": etEmail,
      "gender": gender,
      "date_of_birth": etBirthDate,
      "height": etHeight,
      "weight": etWeight,
      // "profile_picture": profilePicture,
      "_method": 'PUT',
    };
    print("data user ${body}");
    try {
      final responseJson = await _client.post(
        Endpoint.editUser,
        queryParameters: body,
        options:
            NetworkingUtil.setupNetworkOptions('Bearer ${box.read('token')}'),
      );

      final data = responseJson.data;

      print("data user ${responseJson.statusCode.toString()}");
      print("data user ${data}");
      if (responseJson.statusCode == 200) {
        SnackbarWidget.showSuccessSnackbar('Profile saved successfully');
      } else {
        SnackbarWidget.showFailedSnackbar(
            NetworkingUtil.errorMessage(data['message']));
      }
    } on DioError catch (_) {
      rethrow;
    }
  }
}
