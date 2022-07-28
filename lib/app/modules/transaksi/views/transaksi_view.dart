import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nutech/app/routes/app_pages.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  final token = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransaksiView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: Get.width * (159 / 375),
                child: TextField(
                  controller: controller.topupC,
                  decoration: InputDecoration(label: Text('Top Up')),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    controller.topUp(int.parse(controller.topupC.text),
                        token[0], token[1], token[2]);
                  },
                  icon: Icon(Icons.ios_share),
                  label: Text('TopUp'))
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * (159 / 375),
                child: TextField(
                  controller: controller.transferC,
                  decoration: InputDecoration(label: Text('Transfer')),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    controller.transfer(int.parse(controller.transferC.text),
                        token[0], token[1], token[2]);
                  },
                  icon: Icon(Icons.send),
                  label: Text('Transfer'))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HISTORYTRANSAKSI, arguments: token);
              },
              child: Text('Riwayat Transaksi'))
        ],
      ),
    );
  }
}
