import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
    height: Get.height * .35,
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
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize:MainAxisSize.min,children: const [
                          Text("Sending to you",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Preparing your order",style: TextStyle(color: Colors.grey),),


                        ],),
                      )




                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Column(children: [
                        dot(),
                        dot(),
                        dot(),
                        dot(),
                      ],),
                    ),
                      customButton(onClick: (){
                        Get.to(const StepperUi());


                      },
                        buttonHeight:Get.height*.055,
                        buttonWidth:Get.width*.35,
                        buttonWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                          Text('Next  ',style: TextStyle(color: Colors.white),),Icon(Icons.arrow_forward,color: Colors.white,)
                        ],)

                      )



                  ],),
                  const SizedBox(height: 15,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/bank_Riyadh.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Kashif Shop',style: TextStyle(fontWeight: FontWeight.bold,color: Color(primaryColor)),),
                            Text('Estimated arrivals time 12:30 PM',style: TextStyle(color: Colors.grey),)

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
Widget dot(){
  return
    Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(width: Get.width*.01,
      height: Get.width*.01,
      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(50)),

      ),
    )
    ;


}