import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutech/app/routes/app_pages.dart';
import 'package:nutech/main.dart';

import '../../../constant.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final textCustom = TextController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondmain,
        // appBar: AppBar(
        //   backgroundColor: mainColor,
        //   elevation: 0,
        // ),
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height * (250 / 776),
              color: mainColor,
            ),
            ListView(
              children: [
                SizedBox(height: Get.height * (84 / 776)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Get.width * (27 / 375)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * (20 / 375),
                        vertical: Get.height * (20 / 776)),
                    width: Get.width * (200 / 375),
                    height: Get.height * (592 / 776),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Get.height * (10 / 776)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * (40 / 776)),
                        Image.asset(
                          'assets/images/logos.png',
                          height: Get.height * (58 / 776),
                        ),
                        SizedBox(height: Get.height * (50 / 776)),
                        Text(
                          'Sign In',
                          style: textCustom.text24blue700(),
                        ),
                        SizedBox(height: Get.height * (20 / 776)),
                        TextField(
                          controller: controller.emailC,
                          decoration: InputDecoration(
                              label: Text(
                            'Email',
                          )),
                        ),
                        TextField(
                          controller: controller.passwordC,
                          decoration: InputDecoration(label: Text('Password')),
                        ),
                        SizedBox(height: Get.height * (36 / 776)),
                        SizedBox(
                          width: Get.width,
                          height: Get.height * (41 / 776),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                elevation: 0,
                              ),
                              onPressed: () {
                                controller.signIn(controller.emailC.text,
                                    controller.passwordC.text);
                              },
                              child: Text(
                                'SIGN IN',
                                style: textCustom.text14white500(),
                              )),
                        ),
                        SizedBox(height: Get.height * (17 / 776)),
                        TextButton(
                            onPressed: () {
                              // Get.toNamed(Routes.RESETPASSWORD);
                            },
                            child: Text('Reset Password')),
                        Expanded(child: SizedBox()),
                        SizedBox(
                          width: Get.width,
                          height: Get.height * (41 / 776),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: white,
                                  side: BorderSide(color: mainColor)),
                              onPressed: () {
                                Get.toNamed(Routes.SIGNUP);
                              },
                              child: Text(
                                'SIGN UP',
                                style: textCustom.text14blue500(),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
