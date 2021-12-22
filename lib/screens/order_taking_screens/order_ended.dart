import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils.dart';
import 'link_ui.dart';



class OrderEnded extends StatefulWidget {
  const OrderEnded({Key? key}) : super(key: key);

  @override
  _OrderEndedState createState() => _OrderEndedState();
}

class _OrderEndedState extends State<OrderEnded> {
  Future ratingDialog() {
    return Get.defaultDialog(title: "Rate Your Please", actions: [
      SvgPicture.asset('assets/leftarrow.svg'),
      SvgPicture.asset('assets/leftarrow.svg'),
      SvgPicture.asset('assets/leftarrow.svg'),
      SvgPicture.asset('assets/leftarrow.svg'),
      SvgPicture.asset('assets/leftarrow.svg'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
                onTap: () {
                  Get.to(() => const LinkUi());
                },
                child: SvgPicture.asset('assets/menu.svg')),
          )
        ],
        title: LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          width: Get.width * .6,
          lineHeight: 10.0,
          percent: progressBarPersent = 1.0,
          backgroundColor: Colors.grey.withOpacity(.5),
          progressColor: Colors.black,
          padding: const EdgeInsets.all(0),
        ),
      ),
      body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .06,
              ),
              Container(
                  height: Get.height * .6,
                  width: Get.width * .7,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.withOpacity(.1),
                        child: CircleAvatar(
                            child: Image.asset('assets/tick.png'),
                            radius: 39,
                            backgroundColor: Colors.white),
                      ),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      const Text(
                        'Your Order has ended',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      SizedBox(
                        height: Get.height * .05,
                      ),
                      Container(
                        height: Get.height * .2,
                        width: Get.width * .65,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.1))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('11:24',
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(.5))),
                                  Text('12:38',
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(.5))),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/blue_dot.png",
                                  ),
                                  Expanded(
                                    child: Container(
                                        width: .5,
                                        color: Colors.grey.withOpacity(.5)),
                                  ),
                                  Image.asset(
                                    "assets/red_triangle.png",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Check-in Time',
                                      style: TextStyle(
                                          color: primaryColor)),
                                  Text('Check-out Time (Est)',
                                      style: TextStyle(
                                          color: primaryColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SizedBox(
                          width: Get.width * .65,
                          child: Row(
                            children: [
                              Image.asset("assets/mastercard .png"),
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text("**** 8295"),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("\$ "),
                                  Text(
                                    "7",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                  Text(
                                    " 63",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: Get.height * .06,
              ),
              SizedBox(
                width: Get.width * .7,
                child: Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: InkWell(
                            onTap: () {
                              ratingDialog();
                            },
                            child: const Text(
                              "Skip",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        customButton(
                            onClick: () {
                              ratingDialog();
                            },

                            buttonWidget: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Text(
                                      'Report',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward, color: Colors.white,size: 18,)
                                ],
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
