import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutech/app/constant.dart';
import 'package:nutech/app/data/providers/user_provider.dart';
import 'package:nutech/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final token = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final textCustom = TextController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'Edit Profile',
          style: textCustom.text20white500(),
        ),
        elevation: 0,
        // centerTitle: true,
      ),
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
                      SizedBox(height: Get.height * (40 / 776)),
                      Form(
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
                              controller: controller.firstNameC,
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
                            SizedBox(height: Get.height * (20 / 776)),
                            SizedBox(
                              width: Get.width,
                              height: Get.height * (41 / 776),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (controller.firstNameC == '' ||
                                          controller.lastNameC == '') {
                                        print('Kosoong');
                                        Get.snackbar(
                                          "Data Kosong",
                                          "Data Kosong",
                                          icon: Icon(Icons.person,
                                              color: Colors.white),
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                        Navigator.of(context).pop();
                                      } else {
                                        print('ada ya');
                                        controller.updateProfile(
                                            controller.firstNameC.text,
                                            controller.lastNameC.text,
                                            token[0],
                                            token[1],
                                            token[2]);

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
                                    'SAVE',
                                    style: textCustom.text14white500(),
                                  )),
                            ),
                          ],
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
                              Get.toNamed(Routes.PROFILE,
                                  arguments: [token[0], token[1], token[2]]);
                            },
                            child: Text(
                              'Ke page profile',
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
    );
  }
}
