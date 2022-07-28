import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nutech/app/constant.dart';
import 'package:nutech/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    final customText = TextController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: IntroductionScreen(
          color: Colors.white,
          // skipColor: Colors.white,
          // nextColor: Colors.white,
          // doneColor: Colors.white,
          globalBackgroundColor: mainColor,
          rawPages: [IntroSatu(), IntroDua(), IntroTiga()],
          onDone: () => Get.offAllNamed(Routes.LOGIN),
          showSkipButton: true,
          skip: Text("Skip"),
          next: Text(
            "Next",
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
          done: Text(
            "Login",
            // style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget IntroSatu() {
    final customText = TextController();
    return Container(
      // width: Get.width,
      // height: Get.height,
      padding: EdgeInsets.all(Get.height * (20 / 800)),
      decoration: BoxDecoration(color: mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logosmall.png",
                // height: _customsize.customHeight(199, size),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * (103 / 800),
          ),
          Center(
            child: Image.asset(
              "assets/images/intro1.png",
              // height: _customsize.customHeight(376, size),
            ),
          ),
          SizedBox(
            height: Get.height * (35 / 800),
          ),
          Text(
            'Easy Payment',
            style: customText.text20white500(),
          ),
          SizedBox(
            height: Get.height * (50 / 800),
          ),
          Text(
            "Lorem Ipsum has been the industry's standard dummy text evver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            textAlign: TextAlign.justify,
            style: customText.text15grey500(),
          )
        ],
      ),
    );
  }

  Widget IntroDua() {
    final customText = TextController();
    return Container(
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.all(Get.height * (20 / 800)),
      decoration: BoxDecoration(color: mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logosmall.png",
                // height: _customsize.customHeight(199, size),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * (103 / 800),
          ),
          Center(
            child: Image.asset(
              "assets/images/intro2.png",
              // height: _customsize.customHeight(376, size),
            ),
          ),
          SizedBox(
            height: Get.height * (35 / 800),
          ),
          Text(
            'Easy Top Up & Withdrwa',
            style: customText.text20white500(),
          ),
          SizedBox(
            height: Get.height * (50 / 800),
          ),
          Text(
            "Lorem Ipsum has been the industry's standard dummy text evver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            textAlign: TextAlign.justify,
            style: customText.text15grey500(),
          )
        ],
      ),
    );
  }

  Widget IntroTiga() {
    final customText = TextController();
    return Container(
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.all(Get.height * (20 / 800)),
      decoration: BoxDecoration(color: mainColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logosmall.png",
                // height: _customsize.customHeight(199, size),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * (103 / 800),
          ),
          Center(
            child: Image.asset(
              "assets/images/intro3.png",
              // height: _customsize.customHeight(376, size),
            ),
          ),
          SizedBox(
            height: Get.height * (35 / 800),
          ),
          Text(
            'Easy to  Make Money',
            style: customText.text20white500(),
          ),
          SizedBox(
            height: Get.height * (50 / 800),
          ),
          Text(
            "Lorem Ipsum has been the industry's standard dummy text evver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            textAlign: TextAlign.justify,
            style: customText.text15grey500(),
          )
        ],
      ),
    );
  }
}
