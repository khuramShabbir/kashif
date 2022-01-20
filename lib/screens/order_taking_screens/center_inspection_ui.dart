import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/car_brand_scan_ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../utils.dart';
import 'google_mape.dart';

class CenterInspectionUi extends StatefulWidget {
  const CenterInspectionUi({Key? key}) : super(key: key);

  @override
  _CenterInspectionUiState createState() => _CenterInspectionUiState();
}

class _CenterInspectionUiState extends State<CenterInspectionUi> {
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
            Get.to(() => const CarBrandScanUi());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset('assets/bell-ringing.svg'),
          )
        ],
        title: LinearPercentIndicator(
          alignment: MainAxisAlignment.center,
          width: Get.width * .6,
          lineHeight: 10.0,
          percent: progressBarPersent = 0.3,
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
                  InkWell(
                    onTap: () {
                      Get.to(() => GMaps(title: "Map",));
                    },
                    child: pickupAddress(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Get.height * .18,
                  ),
                  Container(
                    width: Get.width * .8,
                    height: Get.height * .15,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(.3))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Available Places",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Container(
                            width: Get.width * .5,
                            height: Get.height * .05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: primaryColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/carWhite.png'),
                                  Image.asset('assets/clockYellow.png'),
                                  Image.asset('assets/carRed.png'),
                                  Image.asset('assets/carYellow.png'),
                                  Image.asset('assets/clockRed.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .12,
                  ),
                  customButton(
                      onClick: () {
                        //TODO: BottomSheet
                        Get.bottomSheet(bottomSheet(),
                            isScrollControlled: true);
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
