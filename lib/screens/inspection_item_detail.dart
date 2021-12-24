import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils.dart';

class InspectionItemDetails extends StatefulWidget {
  const InspectionItemDetails({Key? key}) : super(key: key);

  @override
  _InspectionItemDetailsState createState() => _InspectionItemDetailsState();
}

class _InspectionItemDetailsState extends State<InspectionItemDetails> {
   int _index=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: Get.height * .35,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * .28,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey)
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.35),
                                  blurRadius: 20,
                                  offset: const Offset(5, 5))
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'test',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                  Text(
                                    'Space 4c',
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(.7)),
                                  )
                                ],
                              ),
                              lineBar(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Unique ID:",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        ' CPA-0129',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Check-in Time:',
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(.6)),
                                  ),
                                  const Text(
                                    '11:00 am',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Check-out Time(Est):',
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(.6)),
                                  ),
                                  const Text('05:00 pm',
                                      style: TextStyle(color: primaryColor)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Specification',
                                    style: TextStyle(
                                        color: primaryColor.withOpacity(.6)),
                                  ),
                                  const Text('None',
                                      style: TextStyle(color: primaryColor)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: const Alignment(0, 0.77),
                          child: FloatingActionButton(
                            heroTag: 'tag1',
                            backgroundColor: primaryColor,
                            onPressed: () {
                          popupQr();


                            },
                            child: SvgPicture.asset('assets/svg/Qr.svg'),
                          ))
                    ],
                  ),
                ),
              ),
            ),

            Stepper(

              currentStep: _index,
              onStepCancel: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (_index <= 0) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _index = index;
                });
              },
              steps: <Step>[
                Step(
                  title: const Text('Step 1 title'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Content for Step 1')),
                ),
                const Step(
                  title: Text('Step 2 title'),
                  content: Text('Content for Step 2'),
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}



 popupQr(){
  return
    Get.dialog(
        Material(
          child: InkWell(
            onTap: (){Get.back();},
            child: Container(color: Colors.black.withOpacity(.3),
child: Center(
  child: Column(

    children: [
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: Get.height * .35,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * .28,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Colors.grey)
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.35),
                                blurRadius: 20,
                                offset: const Offset(5, 5))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'test',
                                  style: TextStyle(color: primaryColor),
                                ),
                                Text(
                                  'Space 4c',
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(.7)),
                                )
                              ],
                            ),
                            lineBar(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Unique ID:",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      ' CPA-0129',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Check-in Time:',
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(.6)),
                                ),
                                const Text(
                                  '11:00 am',
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Check-out Time(Est):',
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(.6)),
                                ),
                                const Text('05:00 pm',
                                    style: TextStyle(color: primaryColor)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Specification',
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(.6)),
                                ),
                                const Text('None',
                                    style: TextStyle(color: primaryColor)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: const Alignment(0, 0.77),
                        child: FloatingActionButton(
                          heroTag: 'tag1',
                          backgroundColor: primaryColor,
                          onPressed: () {
                            },
                          child: SvgPicture.asset('assets/svg/Qr.svg'),
                        ))
                  ],
                ),
              ),
            ),
      ),
      SizedBox(
            width: Get.width*.8,
            height: Get.height*.3,
            child: Image.asset('assets/Qr_demo.png'))
    ],
  ),
),


            ),
          ),
        ));

}