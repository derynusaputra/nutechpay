import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutech/app/data/providers/user_provider.dart';
import 'package:nutech/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  void signIn(String email, String pass) async {
    try {
      var response = await UserProvider().postLogin(email, pass);
      print('${response.statusCode}anjing ');
      if (response.statusCode == 200) {
        var body = response.body;
        var token = body["data"] as Map;
        if (body['status'] == 0) {
          print('${token["token"]} bener iyeu nitn');
          Get.offAllNamed(Routes.HOME,
              arguments: [token["token"], email, pass]);
          // Get.defaultDialog(
          //     title: 'berhasil',
          //     middleText: "tidak dapat mengiri reset passwotd ${body["data"]}",
          //     onConfirm: () {
          //       Get.back();
          //       Get.back();
          //     },
          //     textConfirm: "ya Aku Mengerti");
        } else {
          Get.defaultDialog(title: 'Report', middleText: "${body["message"]}");
        }
      } else {
        Get.defaultDialog(
            title: 'Report', middleText: "Server Error ${response.statusCode}");
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
  }
}
