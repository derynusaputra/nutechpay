import 'package:flutter/material.dart';
import 'package:get/get.dart';

const mainColor = Color(0xff1972B4);
const grey = Color(0xffB0CADD);
const secondmain = Color(0xffE9EDF0);

const white = Colors.white;

class TextController {
  TextStyle text15grey500() {
    return TextStyle(
        fontSize: Get.height * (15 / 776),
        color: grey,
        fontWeight: FontWeight.w500);
  }

  TextStyle text20white500() {
    return TextStyle(
        fontSize: Get.height * (20 / 776),
        color: white,
        fontWeight: FontWeight.w500);
  }

  TextStyle text14white500() {
    return TextStyle(
        fontSize: Get.height * (14 / 776),
        color: white,
        fontWeight: FontWeight.w500);
  }

  TextStyle text14blue500() {
    return TextStyle(
        fontSize: Get.height * (14 / 776),
        color: mainColor,
        fontWeight: FontWeight.w500);
  }

  TextStyle text24blue700() {
    return TextStyle(
        fontSize: Get.height * (24 / 776),
        color: mainColor,
        fontWeight: FontWeight.w500);
  }
}
