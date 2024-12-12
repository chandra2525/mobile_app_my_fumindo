import 'package:mobile_app_my_fumindo/src/repositories/user_repository.dart';
import 'package:mobile_app_my_fumindo/src/utils/networking_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../widgets/snackbar_widget.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository;

  LoginController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final etUsername = TextEditingController();
  final etPassword = TextEditingController();

  final tokenController = TextEditingController();
  final box = GetStorage();

  final obscureText = true.obs;
  final key = GlobalKey<FormState>();

  var isLoadingLogin = false.obs;

  // FocusNode focusNode = FocusNode();

  void doLogin() async {
    isLoadingLogin.value = true;
    try {
      final data =
          await _userRepository.login(etUsername.text, etPassword.text);
    } catch (error) {
      print('coba error' + error.toString());
      SnackbarWidget.showFailedSnackbar(
          NetworkingUtil.errorMessage('Username atau Password salah'));
      // SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }

    isLoadingLogin.value = false;
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}
