import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/anas_screens/profile.dart';
import 'package:kashif/junaid_Screens/ongoing_service.dart';
import 'package:kashif/order_taking_screens/compelet_order.dart';
import 'package:kashif/order_taking_screens/link_ui.dart';
import 'package:kashif/order_taking_screens/ongoing_inspection.dart';
import 'package:kashif/order_taking_screens/vehicles.dart';
import 'package:kashif/utils.dart';



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
                                                                    Get.to(OngoingInspectionUi());
                                                                    
                                                                    
                                                                    
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
                                                                  customDetailBar(
                                                                    showImageAddress: "assets/centerInspection.png",
                                                                      width:
                                                                          Get.width *
                                                                              .9,
                                                                      height:
                                                                          Get.height *
                                                                              .1)
                                                                ]))),
                                                SizedBox(
                                                  height: Get.height * .04,
                                                ),
                                                Row(
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
                                                SizedBox(
                                                  height: Get.height * .09,
                                                )
                                              ],
                                            ),
                                          ));
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

                  //TODO: BottomNavigationBar

                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: BottomAppBar(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(() => const CompleteYourOrder());
                                  },
                                  child: SvgPicture.asset("assets/Union.svg")),
                              InkWell(
                                  onTap: () {
                                    Get.to(() => const Vehicles());
                                  },
                                  child: SvgPicture.asset("assets/Union.svg")),
                              SvgPicture.asset("assets/Union.svg"),
                              InkWell(
                                  onTap: () {
                                    Get.to(() => const OnGoingServicesUi());
                                  },
                                  child: SvgPicture.asset("assets/Union.svg")),
                              InkWell(
                                  onTap: () {
                                    Get.to(() => const Profile());
                                  },
                                  child: SvgPicture.asset("assets/Union.svg")),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
            ],
          )),
    );
  }
}
