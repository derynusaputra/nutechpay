import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainColor,
        body: Center(child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
