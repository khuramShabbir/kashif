import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/utils.dart';
import 'center_inspection_ui.dart';
import 'link_ui.dart';
import 'ongoing_inspection.dart';

class StartYourOrder extends StatefulWidget {
  const StartYourOrder({Key? key}) : super(key: key);

  @override
  _StartYourOrderState createState() => _StartYourOrderState();
}

class _StartYourOrderState extends State<StartYourOrder> {
  bool isTaped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => const LinkUi());
                },
                child: SvgPicture.asset(
                  'assets/menu.svg',
                  color: Colors.black,
                  width: 25.0,
                  height: 25.0,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * .06,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Welcome!",
                        style: TextStyle(color: Colors.grey.withOpacity(.5)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Khaled Al-Kayali",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            lineBar(),
            carousalSlider(),
            lineBar(),
            SizedBox(
              height: Get.height * .04,
            ),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * .1,
                ),
                InkWell(
                  onTap: () {
                    isTaped = !isTaped;
                    setState(() {});
                  },
                  child: isTaped
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'cash-back SR 100',
                        style: TextStyle(fontSize: 12),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Your Next Order',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      SizedBox(
                        width: Get.width * .8,
                        height: Get.height * .25,
                        child: Stack(
                          children: [
                            SizedBox(
                                width: Get.width * .6,
                                height: Get.height * .28,
                                child: Image.asset(
                                  'assets/SeekPng 1.png',
                                  width: Get.width * .6,
                                  height: Get.height * .28,
                                )),
                            Align(
                              alignment: Alignment.bottomRight,
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
                                  borderRadius:
                                  BorderRadius.circular(15),
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10,
                                        top: 10.0,
                                        bottom: 10),
                                    child: InkWell(
                                      onTap: () {
                                        bottomSheet();
                                      },
                                      child: Container(
                                        child: const Center(
                                            child: Text("Order Now")),
                                        width: Get.width * .27,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                8)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                      : Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          confirmedOrder(
                              rating: Row(
                                children: List.generate(
                                    4,
                                        (index) => SvgPicture.asset(
                                      'assets/star.svg',
                                      height: 12,
                                    )),
                              )),
                          confirmedOrder(
                            textColor: Colors.red,
                            textBorderColor: Colors.red,
                            checkInTypeText: "ON GOING",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ))
         
          ],
        ));
  }
}


