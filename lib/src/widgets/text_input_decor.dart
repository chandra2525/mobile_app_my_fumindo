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

const textInputDecorationForm2 = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
  focusColor: Color(0xFF865439),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide(color: Color(0xFF865439))),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      borderSide: BorderSide(
        color: Color(0xFF865439),
      )),
  filled: true,
  fillColor: Colors.white,
  hintStyle: TextStyle(
      fontSize: 14,
      color: Color.fromARGB(255, 189, 189, 189),
      fontWeight: FontWeight.w400),
);

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
