import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutech/app/data/providers/user_provider.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final fistNameC = TextEditingController();
  final lastNameC = TextEditingController();

  RxBool isHidden = true.obs;
  RxBool isHiddencon = true.obs;

  void signUp(String first, String last, String email, String pass) async {
    try {
      var response = await UserProvider().postUser(first, last, email, pass);

      if (response.statusCode == 200) {
        var body = response.body;
        print('${body['status']}anjing ');
        if (body['status'] == 0) {
          Get.defaultDialog(
              title: 'berhasil',
              middleText: "${body["message"]}",
              onConfirm: () {
                Get.back();
                Get.back();
              },
              textConfirm: "ya Aku Mengerti");
        } else {
          Get.defaultDialog(title: 'Warning', middleText: "${body["message"]}");
        }
      }
    } catch (e) {
      print(e.toString());
      print('dla');
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    fistNameC.dispose();
    lastNameC.dispose();
  }
}
