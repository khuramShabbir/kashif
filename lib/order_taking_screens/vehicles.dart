import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/utils.dart';

import 'compelet_order.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          'Order',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Image.asset("assets/notification.png"),
        ],
      ),
      body: SizedBox(
        height: Get.height * .8,
        width: Get.width * .9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customDetailBar(width: Get.width * .9, height: Get.height * .1),
            customDetailBar(width: Get.width * .9, height: Get.height * .1),
            customDetailBar(width: Get.width * .9, height: Get.height * .1),
            customDetailBar(width: Get.width * .9, height: Get.height * .1),
            customDetailBar(width: Get.width * .9, height: Get.height * .1),
          ],
        ),
      ),
    );
  }
}
