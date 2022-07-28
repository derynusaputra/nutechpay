import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutech/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  final firstNameC = TextEditingController();
  final lastNameC = TextEditingController();

  void updateProfile(String first, String last, String tokens, String email,
      String pass) async {
    try {
      var response = await UserProvider().updateProfile(first, last, tokens);
      print('${response.statusCode}anjing ');
      if (response.statusCode == 200) {
        var body = response.body;

        if (body['status'] == 0) {
          // Get.offAllNamed(Routes.HOME);
          Get.defaultDialog(
            title: 'berhasil',
            middleText: "update berhasil ${body["data"]}",
          );
        } else {
          Get.defaultDialog(
              title: 'Get Token',
              middleText: "Get Token",
              onConfirm: () async {
                await UserProvider().postLogin(email, pass);
                Get.back();
                // Get.back();
              },
              textConfirm: "Coba Lagi");
        }
      }
    } catch (e) {
      print(e.toString());
      print('dla');
    }
  }

  @override
  void onClose() {
    firstNameC.dispose();
    lastNameC.dispose();
  }
}
