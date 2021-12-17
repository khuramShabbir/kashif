import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: InkWell(
              onTap: Get.back,
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
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
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Welcome!",
                            style:
                                TextStyle(color: Colors.grey.withOpacity(.5)),
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
                bar(),
                carousalSlider(),
                bar(),
                SizedBox(
                  height: Get.height * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    Column(

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
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        SizedBox(
                          width: Get.width * .8,
                          height: Get.height*.28,
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
                               Align(alignment: Alignment.bottomRight,
                                 child: Padding(
                                   padding: const EdgeInsets.only(bottom: 15.0,right: 8.0),
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


                                    child: InkWell(
                                      onTap: (){
                                        bottomSheet();


                                      },

                                      child: Container(
                                        child: const Center(
                                            child: Text("Order Now")),
                                        width: Get.width * .27,
                                        decoration: BoxDecoration(
                                            color:  Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                      ),
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
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}

Future bottomSheet(){
  return

    Get.bottomSheet(Container(
      height: Get.height / 2,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:
              Radius.circular(25),
              topRight:
              Radius.circular(25))),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * .03,
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                    left: 15.0),
                child: Icon(
                  Icons
                      .arrow_back_outlined,
                  color: Colors.black,
                ),
              ),
              Text("Efhes Services",
                  style: (TextStyle(
                    fontSize: 21,
                  ))),
              SizedBox()
            ],
          ),
          SizedBox(
            height: Get.height * .03,
          ),

          /// list of Services in bottomBar Sheet ///

          Expanded(
              child:
              SingleChildScrollView(
                  scrollDirection:
                  Axis.vertical,
                  child: Column(
                      mainAxisSize:
                      MainAxisSize
                          .max,
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                      children: [
                        InkWell(onTap:(){
                          Get.to(const OngoingInspectionUi());



                        },
                          child: customDetailBar(
                              showImageAddress: 'assets/ongoing.png',
                              width:
                              Get.width *
                                  .9,
                              height:
                              Get.height *
                                  .1),
                        ),
                        InkWell(onTap: (){Get.to(()=>const CenterInspectionUi());},
                          child: customDetailBar(
                              showImageAddress: "assets/centerInspection.png",
                              width:
                              Get.width *
                                  .9,
                              height:
                              Get.height *
                                  .1),
                        )
                      ]))),
          SizedBox(
            height: Get.height * .04,
          ),
          InkWell(
            onTap: (){
              Get.to(()=>const OngoingInspectionUi());

            },
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: const [
                Text(
                  "To order more than one car ?",
                  style: TextStyle(
                      color: Colors.grey),
                ),
                Text(
                  " order now",
                  style: TextStyle(
                      fontWeight:
                      FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * .09,
          )
        ],
      ),
    ));




}