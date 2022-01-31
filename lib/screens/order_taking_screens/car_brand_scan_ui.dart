import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/goolemap_for_center_inspection.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils.dart';

class CarBrandScanUi extends StatelessWidget {
  const CarBrandScanUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: Get.back,
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
          percent: progressBarPersent = 0.2,
          backgroundColor: Colors.grey.withOpacity(.5),
          progressColor: Colors.black,
          padding: const EdgeInsets.all(0),
        ),
      ),
      body: SizedBox(
        width: Get.width,
        child: Row(
          children: [
            SizedBox(
              width: Get.width * .1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               InkWell(
                   onTap: (){Get.to(()=>const GoogleMapForCenterInspectionUi());},
                   // child: pickupAddress()

               ),
                const Text(
                  "Vin:",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                vinInformation(),
                const Text(
                  "Vin:",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                vinInformation(),
                const Text(
                  "Vin:",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                vinInformation(),
                vinInformation(),
                SizedBox(height: Get.height*.05,),
                SizedBox(width: Get.width*.8,child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customButton(
                      //TODO:Button
                      onClick: () {},
                      buttonWidget: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 13,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),)



              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget vinInformation({
  String text = '2FABP7CWX136869',
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: SizedBox(
        width: Get.width * .8,
        child: customInputFormField(
          isOutlinedBorder: true,
          hintText: text,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  'assets/Work.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                'Scan',
                style: TextStyle(color: primaryColor, fontSize: 13),
              )
            ],
          ),
        )),
  );
}
