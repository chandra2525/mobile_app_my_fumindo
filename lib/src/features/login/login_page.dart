import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_my_fumindo/src/constants/text_style.dart';
import '../../constants/color.dart';
import '../../widgets/button_icon.dart';
import '../../widgets/text_input_decor.dart';
import 'component/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'Log in',
                      style: TextStyles.rubik22Med,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 2.0,
                            spreadRadius: .05,
                          ),
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: white,
                          ),
                        )),
                        onTap: () => Get.back(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Form(
              key: controller.key,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Username',
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
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        cursorColor: primary,
                        maxLength: 30,
                        controller: controller.etUsername,
                        style: TextStyles.rubik16Reg,
                        decoration: textInputDecorationForm.copyWith(
                          hintText: 'Masukkan username',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Password',
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
                      Obx(
                        () => TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            } else if (value!.length < 3) {
                              return "Password tidak boleh kurang dari 3 huruf";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: primary,
                          maxLength: 15,
                          controller: controller.etPassword,
                          style: TextStyles.rubik16Reg,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.obscureText.value,
                          decoration: textInputDecorationForm.copyWith(
                            hintText: 'Password',
                            // prefixIcon: const Padding(
                            //   padding: EdgeInsets.all(14.0),
                            //   child: ImageIcon(
                            //     AssetImage(ic_password),
                            //   ), // icon is 48px widget.
                            // ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: IconButton(
                                icon: Icon(controller.obscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  controller.toggleObscureText();
                                },
                              ),
                            ),
                            // prefix: const SizedBox(
                            //   width: 0,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Obx(
        () => controller.isLoadingLogin.value
            ? const CircularProgressIndicator(color: primary)
            : SizedBox(
                height: 57,
                width: double.infinity,
                child: ButtonIcon(
                  buttonColor: primary,
                  textColor: white,
                  textLabel: "Login",
                  onClick: () {
                    final form = controller.key.currentState;
                    if (form!.validate()) {
                      form.save();
                      controller.doLogin();
                    }
                  },
                )),
      );
}
