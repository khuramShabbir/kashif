import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kashif/screens/order_taking_screens/stepper_ui.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../utils.dart';

class GoogleMapForCenterInspectionUi extends StatefulWidget {
  const GoogleMapForCenterInspectionUi({Key? key}) : super(key: key);

  @override
  _GoogleMapForCenterInspectionUiState createState() =>
      _GoogleMapForCenterInspectionUiState();
}

class _GoogleMapForCenterInspectionUiState
    extends State<GoogleMapForCenterInspectionUi> {
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          InkWell(
            onTap: (){
              Get.bottomSheet(bottomSheet(), isScrollControlled: true);
            },

            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SvgPicture.asset('assets/bell-ringing.svg'),
            ),
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
      body: const GoogleMap(initialCameraPosition: _kGooglePlex,),
    );
  }
}

Widget bottomSheet() {
  return Container(
    width: Get.width,
    height: Get.height * .35,
    decoration: const BoxDecoration(
        color:primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      children: [
        SizedBox(
          height: Get.height * .02,
        ),
        Container(
          height: Get.height * .33,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Center(
            child: SizedBox(
              width: Get.width * .8,
              height: Get.height * .25,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/carYellowOutlined.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Sending to you",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Preparing your order",
                              style: TextStyle(color: Colors.grey,fontSize: 13),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                   SizedBox(
                    height: Get.height*.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Column(mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            dot(),
                            dot(),
                            dot(),
                            dot(),
                          ],
                        ),
                      ),
                      customButton(
                          onClick: () {
                            Get.to( StepperUi());
                          },

                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ))
                    ],
                  ),
                SizedBox(
                  height: Get.height*.025,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/bank_Riyadh.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Kashif Shop',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                            Text(
                              'Estimated arrivals time 12:30 PM',
                              style: TextStyle(color: Colors.grey,fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget dot() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Container(
      width: Get.width * .012,
      height: Get.width * .012,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.3), borderRadius: BorderRadius.circular(50)),
    ),
  );
}
