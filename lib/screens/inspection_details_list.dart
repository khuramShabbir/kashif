import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/utils.dart';

import 'inspection_item_detail.dart';

class InspectionDetailsList extends StatefulWidget {
  const InspectionDetailsList({Key? key}) : super(key: key);

  @override
  _InspectionDetailsListState createState() => _InspectionDetailsListState();
}

class _InspectionDetailsListState extends State<InspectionDetailsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            Get.to(const InspectionItemDetails());

          },

          child: Padding(
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
                          heroTag: 'tag $index',
                          backgroundColor: primaryColor,
                          onPressed: () {Get.to(const InspectionItemDetails());},
                          child: SvgPicture.asset('assets/svg/Qr.svg'),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
