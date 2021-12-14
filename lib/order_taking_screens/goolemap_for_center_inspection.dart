import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../utils.dart';

class GoogleMapForCenterInspectionUi extends StatefulWidget {
  const GoogleMapForCenterInspectionUi({Key? key}) : super(key: key);

  @override
  _GoogleMapForCenterInspectionUiState createState() =>
      _GoogleMapForCenterInspectionUiState();
}

class _GoogleMapForCenterInspectionUiState
    extends State<GoogleMapForCenterInspectionUi> {
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
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset('assets/bell-ringing.svg'),
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
        width: Get.width,
        height: Get.height,
        child: InkWell(
            onTap: () {
              Get.bottomSheet(bottomSheet(), isScrollControlled: true);
            },
            child: Image.asset(
              'assets/googleMap.png',
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

Widget bottomSheet() {
  return Container(
    width: Get.width,
    height: Get.height * .3,
    decoration: const BoxDecoration(
        color: Color(primaryColor),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      children: [
        SizedBox(
          height: Get.height * .02,
        ),
        Container(
          height: Get.height * .28,
          width: Get.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),

        ),
      ],
    ),
  );
}
