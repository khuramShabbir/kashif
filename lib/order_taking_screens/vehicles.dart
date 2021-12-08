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
        height: Get.height,
        width: Get.width,
        child: Column(mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            customDetailBar(width: Get.width *.9, height: Get.height * .12),
            customDetailBar(width: Get.width *.9, height: Get.height * .12,showImageAddress: "assets/centerInspection.png"),
            customDetailBar(width: Get.width *.9, height: Get.height * .12),
            customDetailBar(width: Get.width *.9, height: Get.height * .12,showImageAddress: "assets/centerInspection.png"),
            customDetailBar(width: Get.width *.9, height: Get.height * .12,showImageAddress: "assets/centerInspection.png"),
          ],
        ),
      ),
    );
  }
}
