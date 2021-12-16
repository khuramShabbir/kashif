import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/center_inspection_ui.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection.dart';

import 'utils.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Welcome !",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Khaled Al-Kayali",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      bar(),

                      ///
                      /// /// Carousal Slider /// ///
                      ///
                      ///
                      carousalSlider(),
                      bar(),
                    ],
                  )),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width * .1,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * .01,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Text("cash-back Sr 100"),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Your Next Order",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Image.asset(
                                        "assets/SeekPng 1.png",
                                        width: Get.width * .5,
                                        height: Get.height * .2,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Container(
                                      width: Get.width * .45,
                                      height: Get.height * 0.07,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              Color(0xFFDADDDE),
                                              Colors.transparent
                                            ]),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 10.0, bottom: 10),
                                          // TODO: Implement to Button for bottom sheet

                                          child: InkWell(
                                            onTap: () {

                                            },
                                            child: Container(
                                              child: const Center(
                                                  child: Text("Order Now")),
                                              width: Get.width * .3,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFFDADDDE),
                                                  borderRadius:
                                                  BorderRadius.circular(15)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * .09,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),


                    ],
                  )),
            ],
          )),





    );
  }
}
