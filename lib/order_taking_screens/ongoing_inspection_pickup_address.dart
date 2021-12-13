import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/order_taking_screens/google_mape.dart';
import 'package:kashif/order_taking_screens/stepper_ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utils.dart';

class OngoingInspectionPickUpAdressUi extends StatefulWidget {
  const OngoingInspectionPickUpAdressUi({Key? key}) : super(key: key);

  @override
  _OngoingInspectionPickUpAdressUiState createState() =>
      _OngoingInspectionPickUpAdressUiState();
}

class _OngoingInspectionPickUpAdressUiState
    extends State<OngoingInspectionPickUpAdressUi> {
  bool isSelected=false;


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
          percent: progressBarPersent = 0.5,
          backgroundColor: Colors.grey.withOpacity(.5),
          progressColor: Colors.black,
          padding: const EdgeInsets.all(0),
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: Get.width * .1,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(onTap:(){Get.to(()=>const GooGleMap());},
                    child: Container(
                      width: Get.width * .8,
                      height: Get.height * .1,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(primaryColor).withOpacity(.1)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: SvgPicture.asset(
                                        "assets/pin_location.svg"),
                                  ))),
                          Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Pick-up Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  'B/62,Bhaweshwar Darshan,Altamount',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                              flex: 3,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'CHANGE',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    height: Get.height * .3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            timePicker(time: '8:00am - 8:30am'),
                            timePicker(
                                time: '9:00am - 930am',
                                timeColor: const Color(primaryBlueColor),
                                borderColor: const Color(primaryBlueColor)),
                            timePicker(
                              time: '10:00 - 10:30am',
                            ),
                            timePicker(time: '11:00 - 1130am'),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            timePicker(time: '8:00am - 8:30am'),
                            timePicker(time: '9:00am - 930am'),
                            timePicker(time: '10:00 - 10:30am'),
                            timePicker(time: '11:00 - 1130am'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  customButton(
                      onClick: () {
                        //TODO: BottomSheet
                        Get.bottomSheet(bottomSheet(),
                            isScrollControlled: true);
                      },
                      buttonHeight: Get.height * .06,
                      buttonWidget: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Book',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white)
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              width: Get.width * .1,
            ),
          ],
        ),
      ),
    );
  }
}

Widget timePicker(
    {String time = "00:00am",
    var timeColor = Colors.black,
    var borderColor = const Color(0x81BBBBB8)}) {
  return Container(
    height: Get.height * .055,
    width: Get.width * .37,
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(25)),
    child: Center(
        child: Text(
      time,
      style: TextStyle(fontWeight: FontWeight.bold, color: timeColor),
    )),
  );
}

Widget bottomSheet() {
  return Container(
    width: Get.width,
    height: Get.height * .77,
    decoration: const BoxDecoration(
        color: Color(primaryColor),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: Get.back,
              child:const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: const Text(
              "Order Confirmation",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )),
        Expanded(
            flex: 7,
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset('assets/bank_Riyadh.png')),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Riyadh',
                                  style: TextStyle(
                                      color: Color(primaryColor),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '29846264 HH',
                                  style: TextStyle(
                                      color: Color(primaryColor), fontSize: 12),
                                ),
                                Text(
                                  'Saudi Arabia Riyadh',
                                  style: TextStyle(
                                      color: Color(primaryColor), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset('assets/Edit.png'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  SizedBox(
                    width: Get.width * .7,
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        //TODO:Payment method Selection

                        Container(
                          child: Image.asset('assets/slection.png'),


                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: const Color(primaryColor)),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Cash',
                                style: TextStyle(
                                    color: Color(primaryColor),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Pay the delegate',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: SvgPicture.asset('assets/cards.svg'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  SizedBox(
                    width: Get.width * .7,
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: const Color(primaryColor)),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Credit Card',
                                style: TextStyle(
                                    color: Color(primaryColor),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2540 xxxx xxxx 2648',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset('assets/visa.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset('assets/mastercard .png'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    height: Get.height * .14,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  color: Color(primaryColor), fontSize: 12),
                            ),
                            Text(
                              '\$9.00',
                              style: TextStyle(
                                  color: Color(primaryColor), fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tax(10%)',
                              style: TextStyle(
                                  color: Color(primaryColor), fontSize: 12),
                            ),
                            Text(
                              '\$0.90',
                              style: TextStyle(
                                  color: Color(primaryColor), fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Delivery fee',
                              style: TextStyle(
                                  color: Color(primaryColor), fontSize: 12),
                            ),
                            Text(
                              '\$2.00',
                              style: TextStyle(
                                  color: Color(primaryColor), fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style:
                                  TextStyle(color: Colors.grey.withOpacity(.5)),
                            ),
                            const Text(
                              '\$11.20',
                              style: TextStyle(
                                  color: Color(primaryColor),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        customButton(
                            onClick: () {Get.to(()=>const StepperUi());},
                            buttonHeight: Get.height * .06,
                            buttonWidget: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                children: [
                                  Image.asset('assets/pay-now.png'),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'Pay now',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )),
      ],
    ),
  );
}
