import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/text_style.dart';

const textInputDecorationForm = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
    focusColor: primary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(color: gray200, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(color: primary)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        borderSide: BorderSide(
          color: Colors.transparent,
        )),
    filled: true,
    fillColor: blackOp10,
    hintStyle: TextStyles.rubik16RegOp50,
    prefix: SizedBox(
      width: 24,
    ));

const textInputDecorationQty = InputDecoration(
  // contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 12),
  focusColor: primary,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: gray200, width: 1.5),
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: primary)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(
        color: Colors.transparent,
      )),
  filled: true,
  fillColor: blackOp10,
  hintStyle: TextStyles.rubik16RegOp50,
);

class TextFormSearch extends StatelessWidget {
  const TextFormSearch(
      {super.key,
      this.onFieldSubmitted,
      this.validator,
      this.hint,
      this.prefixIcon,
      // this.prefixOnTap,
      this.suffixIcon,
      this.onSaved,
      this.enabled,
      this.controller,
      this.controllerClear,
      this.onChanged,
      this.inputFormatters,
      this.keyboardType,
      this.obscureText});
  final onFieldSubmitted;
  final validator;
  final hint;
  final prefixIcon;
  // final prefixOnTap;
  final suffixIcon;
  final onSaved;
  final enabled;
  final controller;
  final controllerClear;
  final onChanged;
  final inputFormatters;
  final keyboardType;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      // scrollPadding: EdgeInsets.all(16),
      onChanged: onChanged,

      enabled: enabled ?? true,
      // maxLength: 30,
      // onSaved: (newValue) => users.text = newValue!,
      controller: controller,
      // textAlign: TextAlign.start,
      // inputFormatters: [
      //   LengthLimitingTextInputFormatter(20),
      // ],
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyles.rubik16Reg,
      cursorColor: primary,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor: whiteGrey,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: grey5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              color: grey5,
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          hintText: hint,
          hintStyle: TextStyles.rubik16RegOp50,
          prefixIconConstraints: BoxConstraints.tight(const Size(46, 46)),
          // prefixIcon: prefixIcon == null
          //     ? null
          //     : Padding(
          //         padding: const EdgeInsets.only(left: 16.0, right: 12),
          //         child: InkWell(
          //           onTap: () {
          //             prefixOnTap;
          //           },
          //           child: SvgPicture.asset(
          //             prefixIcon,
          //           ),
          //         ),
          //       ),
          suffixIconConstraints: BoxConstraints.tight(const Size(46, 46)),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.close,
              size: 24.0,
              color: textColor,
            ),
            padding: EdgeInsets.zero,
            onPressed: controllerClear,
          )),
    );
  }
}

const textInputDecorationOtp = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
  focusColor: Color(0xFF865439),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(color: Color(0xFF865439))),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(
        color: Color.fromARGB(0, 0, 0, 0),
      )),
  filled: true,
  fillColor: Color.fromARGB(12, 0, 0, 0),
  hintStyle: TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 189, 189, 189),
      fontWeight: FontWeight.w700),
);

const textInputDecorationPrice = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
  focusColor: Color(0xFF865439),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255))),
  filled: true,
  fillColor: Color.fromARGB(11, 255, 255, 255),
  hintStyle: TextStyle(
      fontSize: 24, color: Color(0xFF865439), fontWeight: FontWeight.w500),
);
