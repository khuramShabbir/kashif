/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/junaid_Screens/car_brand_details_2_ui.dart';
import 'package:kashif/junaid_Screens/car_brand_details.dart';

import '../utils.dart';

class OngoingServiceScreen extends StatefulWidget {
  const OngoingServiceScreen({Key? key}) : super(key: key);

  @override
  _OngoingServiceScreenState createState() => _OngoingServiceScreenState();
}

class _OngoingServiceScreenState extends State<OngoingServiceScreen> {
  late bool tapYes = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12,),
              appBar('Ongoing service'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        tapYes=!tapYes;
                      });
                    },
                    child:  tapYes? Container(
                      height: 40,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                          border: Border.all(width: 1, color: Colors.blueAccent)

                      ),
                        alignment: Alignment.center,
                        child: const Text(
                            'UPCOMING',
                          style: TextStyle(
                              color: Colors.blueAccent
                          ),
                        )
                    ):
                    Container(
                        height: 40,
                        width: Get.width*0.4,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12)),
                            border: Border.all(width: 1,)

                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'UPCOMING',
                          style: TextStyle(
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      setState(() {
                        tapYes=!tapYes;
                      });
                    },
                    child:tapYes? Container(
                      height: 40,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          border: Border.all(width: 1)

                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'PAST'
                      ),
                    ):
                    Container(
                      height: 40,
                      width: Get.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          border: Border.all(width: 1, color: Colors.blueAccent)

                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'PAST',
                        style: TextStyle(
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12,),
              if (tapYes) SizedBox(
                height: Get.height*0.7,
                width: Get.width*0.9,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context,int index){
                      return InkWell(
                          onTap: (){
                            Get.to(() =>const ReportDetailScreen1());
                          },
                          child: customCardView()
                      );
                    }
                ),
              ) else SizedBox(
                height: Get.height*0.7,
                width: Get.width*0.9,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context,int index){
                      return InkWell(
                        onTap: (){
                          Get.to(() =>const ReportDetailsScreen());
                        },
                          child: customCarCardView()
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
