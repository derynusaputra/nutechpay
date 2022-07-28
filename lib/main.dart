import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutech/app/utils/loading_page.dart';
import 'package:nutech/app/utils/splash_page.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // permanent karena bisa di gunakan dimana saja biar gak usah put2 lagi
    // final authC = Get.put(AuthController(), permanent: true);
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
          
            return GetMaterialApp(
              initialRoute: Routes.INTRODUCTION,
              getPages: AppPages.routes,
            );
          }
          return SplashPage();
        });
  }
}
