import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils.dart';


class ReportDetailScreen1 extends StatefulWidget {
  const ReportDetailScreen1({Key? key}) : super(key: key);

  @override
  _ReportDetailScreen1State createState() => _ReportDetailScreen1State();
}

class _ReportDetailScreen1State extends State<ReportDetailScreen1> {

  // List <Widget> reportList = [
  //   carReportDetails('assets/BellIcon.svg', 'Engine'),
  //   carReportDetails('assets/BellIcon.svg', 'Gear type'),
  //   carReportDetails('assets/BellIcon.svg', 'Battery'),
  //   carReportDetails('assets/BellIcon.svg', 'Mobile oil'),
  //   carReportDetails('assets/BellIcon.svg', 'Examine Vehicle'),
  //   carReportDetails('assets/BellIcon.svg', 'Below car'),
  //   carReportDetails('assets/BellIcon.svg', 'Break System'),
  //   carReportDetails('assets/BellIcon.svg', 'Below car'),
  //   carReportDetails('assets/BellIcon.svg', 'Below car'),
  //   carReportDetails('assets/BellIcon.svg', 'Internal'),
  //
  // ] ;


  bool _expanded = false;


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
              appBar('Report details'),
              SizedBox(height: Get.height*0.01,),
              carBrand('Toyota'),
              const SizedBox(height: 18),
              Container(height: 1,width: Get.width*0.9,color: Colors.grey,),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/TimeCalendar.svg'),
                    const Text(
                      'date :',
                    ),
                    const Text('20/11/2021')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0,right: 22,top: 8,bottom: 22),
                child: Column(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ExpansionPanelList(
                        elevation: 0,
                        children: [
                          ExpansionPanel(
                            headerBuilder: (context, isExpanded) {
                              return Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/TimeCalendar.svg'),
                                    const SizedBox(width: 8),
                                    const Text('avcdf'),
                                    Expanded(child: Container()),
                                    const Icon(Icons.check_circle,color: Colors.greenAccent,),
                                  ],
                                ),
                              );
                            },
                            body:const ListTile(
                              title: Text('Description text',style: TextStyle(color: Colors.black)),
                            ),
                            isExpanded: _expanded,
                            canTapOnHeader: true,
                          ),
                        ],
                        dividerColor: Colors.red,
                        expansionCallback: (panelIndex, isExpanded) {
                          _expanded = !_expanded;
                          setState(() {
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),


              // Column(
              //   children: List.generate(reportList.length, (index) => reportList[index]),
              // ),
              Container(
                height: Get.width*0.6,
                width: Get.width*0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(35),
                  image: const DecorationImage(
                    image: AssetImage('assets/CarDoor.png')
                  )
                ),
              ),
              carSetting('ad','asdsa','sadsa','asd','asd','adw','asAD','asdsa','sadsa','asd','asd','QWESADC','ZXC','asdaxz'),
              Image.asset('assets/CarView.png')
            ],
          ),
        ),
      ),
    );
  }
}




