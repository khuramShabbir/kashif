import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils.dart';


class ReportDetailsScreen extends StatefulWidget {
  const ReportDetailsScreen({Key? key}) : super(key: key);

  @override
  _ReportDetailsScreenState createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12,),
              appBar('Report details'),
              SizedBox(height: Get.height*0.01,),
              carBrand('Toyota'),
              SizedBox(height: 18,),
              Container(height: 1,width: Get.width*0.9,color: Colors.grey,),
              SizedBox(height: 22,),
              Container(
                height: Get.width*0.6,
                width: Get.width*0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/CarDoor.png')
                  )
                ),
              ),
              SizedBox(height: 22,),
              Container(height: 1,width: Get.width*0.9,color: Colors.grey,),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    carReports('internal order', '(error)', 'seat Dirty','(available in photos)')
                  ],
                ),
              ),
              Image.asset('assets/CarView.png')
            ],
          ),
        ),
      ),
    );
  }
}

class CarReports{

}
