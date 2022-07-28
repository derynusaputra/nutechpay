import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutech/app/data/providers/user_provider.dart';
import 'package:nutech/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final token = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getProfile(token[0]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var dataSnap = snapshot.data;
            var datas = dataSnap as Map;
            var data = datas['data'] as Map;
            print('${data} data snapsot');
            if (datas['status'] == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${data['email']}'),
                  Text('First Name: ${data['first_name']}'),
                  Text("Last Name: ${data['last_name']}"),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.TRANSAKSI,
                          arguments: [token[0], token[1], token[2]]);
                    },
                    child: Text('Page Transaksi'),
                  )),
                ],
              );
            } else {
              return ElevatedButton(
                onPressed: () async {
                  await UserProvider().postLogin(token[1], token[2]);
                  // Get.back();
                  // Get.back();
                },
                child: Text('refresh'),
              ); // return  await UserProvider().postLogin(email, pass);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
