import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutech/app/routes/app_pages.dart';

import '../../../constant.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordCon = TextEditingController();

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
                        // Image.asset(
                        //   'assets/images/logos.png',
                        //   height: Get.height * (58 / 776),
                        // ),
                        SizedBox(height: Get.height * (15 / 776)),
                        Text(
                          'Sign Up',
                          style: textCustom.text24blue700(),
                        ),
                        Obx(
                          () => Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value == "") {
                                      return "First name harus diisi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  // controller: _userController,
                                  controller: controller.fistNameC,
                                  decoration:
                                      InputDecoration(label: Text('Firs Name')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value == "") {
                                      return "Last name harus diisi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  // controller: _userController,
                                  controller: controller.lastNameC,
                                  decoration:
                                      InputDecoration(label: Text('Last Name')),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty || value == "") {
                                      return "Email harus diisi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: controller.emailC,
                                  decoration:
                                      InputDecoration(label: Text('Email')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty || value == "") {
                                      return "Password harus diisi";
                                    } else {
                                      if (!regex.hasMatch(value)) {
                                        return 'Password minimal 6 Karakter';
                                      } else {
                                        return null;
                                      }
                                    }
                                  },
                                  obscureText: controller.isHidden.value,
                                  controller: controller.passwordC,
                                  decoration: InputDecoration(
                                    label: Text('Password'),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          if (controller.isHidden.value ==
                                              true) {
                                            controller.isHidden.value = false;
                                          } else {
                                            controller.isHidden.value = true;
                                          }
                                          // setState(() {});
                                        },
                                        padding: EdgeInsetsDirectional.only(
                                            start: 12, end: 0.0),
                                        icon: Icon(
                                          !controller.isHidden.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black,
                                          size: 15,
                                        )),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value == "") {
                                      return "Password harus diisi";
                                    } else if (controller.passwordC.text !=
                                        passwordCon.text) {
                                      return "Your Password Doesn't Match. ";
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: controller.isHiddencon.value,
                                  controller: passwordCon,
                                  decoration: InputDecoration(
                                    label: Text('Confir'),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          if (controller.isHiddencon.value ==
                                              true) {
                                            controller.isHiddencon.value =
                                                false;
                                          } else {
                                            controller.isHiddencon.value = true;
                                          }
                                          // setState(() {});
                                        },
                                        padding: EdgeInsetsDirectional.only(
                                            start: 12, end: 0.0),
                                        icon: Icon(
                                          !controller.isHiddencon.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black,
                                          size: 15,
                                        )),
                                  ),
                                ),
                                SizedBox(height: Get.height * (20 / 776)),
                                SizedBox(
                                  width: Get.width,
                                  height: Get.height * (41 / 776),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          if (controller.fistNameC == '' ||
                                              controller.lastNameC == '' ||
                                              controller.emailC == '' ||
                                              controller.passwordC == '' ||
                                              passwordCon == '') {
                                            print('Kosoong');
                                            Get.snackbar(
                                              "Data Kosong",
                                              "Data Kosong",
                                              icon: Icon(Icons.person,
                                                  color: Colors.white),
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                            );
                                            Navigator.of(context).pop();
                                          } else {
                                            print('ada ya');
                                            controller.signUp(
                                                controller.fistNameC.text,
                                                controller.lastNameC.text,
                                                controller.emailC.text,
                                                controller.passwordC.text);

                                            // Navigator.of(context).pop();
                                          }
                                          // _dialogController.customSnackbar(context);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: mainColor,
                                      ),
                                      child: Text(
                                        'SING UP',
                                        style: textCustom.text14white500(),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                Get.back();
                              },
                              child: Text(
                                'SIGN IN',
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
