import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/center_inspection_ui.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection.dart';
import 'package:kashif/utils.dart';

import '../inspection_details_list.dart';
import 'compelet_order.dart';
import 'ongoing_inspection_pickup_address.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(Icons.arrow_back, color: Colors.black),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(child: ListView.builder(itemCount: 500,itemBuilder: (itemBuilder,index){
                return InkWell(onTap: (){
                  Get.to(const InspectionDetailsList());
                  },child: customDetailBar(width: Get.width * .9, height: Get.height * .12));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
