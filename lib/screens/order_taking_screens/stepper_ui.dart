import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../utils.dart';
import 'order_ended.dart';

class StepperUi extends StatefulWidget {
  const StepperUi({Key? key}) : super(key: key);

  @override
  _StepperUiState createState() => _StepperUiState();
}

class _StepperUiState extends State<StepperUi> {
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
              child: SvgPicture.asset('assets/menu.svg'),
            )
          ],
          title: LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: Get.width * .6,
            lineHeight: 10.0,
            percent: progressBarPersent = 0.8,
            backgroundColor: Colors.grey.withOpacity(.5),
            progressColor: Colors.black,
            padding: const EdgeInsets.all(0),
          ),
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * .1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  SizedBox(
                    height: Get.height * .25,
                    width: Get.width * .9,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Ford Crown Victoria',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    '#00001',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.withOpacity(.5)),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  const Text(
                                    '*******',
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'AAA - 0000',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            const Text(
                              'DATE',
                              style: TextStyle(fontSize: 15),
                            ),
                            const Text(
                              '21st Sept 2021,Monday',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/carPng.png',
                                height: Get.height * .2,
                              ),
                              const Text(
                                "9:00-9:30am",
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  InkWell(onTap: (){Get.to(()=>const OrderEnded());},
                    child: Container(

                      width: Get.width * .8,



                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
