import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutech/app/data/providers/user_provider.dart';

class TransaksiController extends GetxController {
  final topupC = TextEditingController();
  final transferC = TextEditingController();

  void topUp(int amount, String tokens, String email, String pass) async {
    try {
      var response = await UserProvider().topUp(amount, tokens);
      print('${response.statusCode}anjing ');
      if (response.statusCode == 200) {
        var body = response.body;

        if (body['status'] == 0) {
          // Get.offAllNamed(Routes.HOME);
          Get.defaultDialog(
            title: 'berhasil',
            middleText: "${body["message"]}",
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

  void transfer(int amounts, String token, String emails, String passw) async {
    try {
      var response = await UserProvider().transfer(amounts, token);
      print('${response.statusCode}entong ');
      if (response.statusCode == 200) {
        var bodys = response.body;

        if (bodys['status'] == 0) {
          // Get.offAllNamed(Routes.HOME);
          Get.defaultDialog(
            title: 'Transfer',
            middleText: "${bodys["message"]}",
          );
        } else {
          Get.defaultDialog(
              title: 'Get Token',
              middleText: "Get Token",
              onConfirm: () async {
                await UserProvider().postLogin(emails, passw);
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
    topupC.dispose();
    transferC.dispose();
  }
}
