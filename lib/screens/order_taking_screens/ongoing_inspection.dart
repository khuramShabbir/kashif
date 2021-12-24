import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/link_ui.dart';
import 'package:kashif/screens/order_taking_screens/scan_card_example.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../utils.dart';
import 'ongoing_inspection_pickup_address.dart';

class OngoingInspectionUi extends StatefulWidget {
  const OngoingInspectionUi({Key? key}) : super(key: key);

  @override
  _OngoingInspectionUiState createState() => _OngoingInspectionUiState();
}

class _OngoingInspectionUiState extends State<OngoingInspectionUi> {
  double width = .8;
  double height = .06;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){Get.back();},
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                  onTap: (){Get.to(()=>const LinkUi());},

                  child: SvgPicture.asset('assets/menu.svg')),
            )
          ],
          title: LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: Get.width * .6,
            lineHeight: 10.0,
            percent: progressBarPersent = 0.1,
            backgroundColor: Colors.grey.withOpacity(.5),
            progressColor: Colors.black,
            padding: const EdgeInsets.all(0),
          ),
        ),
        body: SingleChildScrollView (
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    SizedBox(
                      width: Get.width * width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          labelText('Car Brand:'),
                          customInputFormField(
                              hintText: "Ford",
                              isOutlinedBorder: true,
                              onChange: (carBrand) {
                                logger.e(carBrand);
                              }),
                          labelText('Car Model:'),
                          customInputFormField(
                              hintText: "Crown Victoria",
                              isOutlinedBorder: true,
                              onChange: (value) {}),
                          labelText('Manufacture year:'),
                          customInputFormField(
                              hintText: "2011",
                              isOutlinedBorder: true,
                              onChange: (value) {}),
                          labelText('vin:'),
                          customInputFormField(
                              onChange: (value) {},
                              hintText: "2FABP7CWI8X13",
                              isOutlinedBorder: true,
                              suffixIcon: InkWell(
                                onTap: (){Get.to(()=>const ScanCardExample());},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/ic_scan.svg",
                                      height: 20,
                                    ),
                                    const Text("  Scan")
                                  ],
                                ),
                              )),
                          labelText('Car plate'),

                          customInputFormField(
                              hintText: "AAA - 0000",
                              isOutlinedBorder: true,
                              onChange: (value) {}),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .1,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              customButton(
                buttonWidth: 0.30,
                  onClick: () {Get.to(()=>const OngoingInspectionPickUpAddressUi());},
                  buttonWidget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                     mainAxisAlignment:MainAxisAlignment.spaceEvenly,
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
                    ),
                  ))
            ],
          ),
        ));
  }
}

labelText(String text) {
  return Padding(
    padding: const EdgeInsets.only(top:20,bottom: 5),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}
