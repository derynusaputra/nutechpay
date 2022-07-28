import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/historytransaksi_controller.dart';

class HistorytransaksiView extends GetView<HistorytransaksiController> {
  final token = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('HistorytransaksiView'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.getHitorys(token[0]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var snapData = snapshot.data as Map;
                List<dynamic> dataList =
                    (snapData['data']) as List<dynamic>;
                print("${dataList.length}data tarnassaki");
                return Center(
                  child: Text(
                    'HistorytransaksiView is working',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
    });
  }
}
