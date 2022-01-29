import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:provider/provider.dart';

import '../utils.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
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
            title: Text(
              "Report details",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 15),
                    child: Container(
                      width: Get.width * .9,
                      child: Row(
                        children: [
                          Text(
                            "Car Brand : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            " Toyota",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/upload.png',
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/printer.png',
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 1,
                    width: Get.width * 0.9,
                    color: Colors.grey,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width*.05,),
                        SvgPicture.asset('assets/TimeCalendar.svg'),
                         Text(
                          ' date :',
                        ),
                         Text('20/11/2021')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width*.9,
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
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/TimeCalendar.svg'),
                                        const SizedBox(width: 8),
                                        const Text('Mechanical'),
                                        Expanded(child: Container()),
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.greenAccent,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                body: const ListTile(
                                  title: Text('Description text',
                                      style: TextStyle(color: Colors.black)),
                                ),
                                isExpanded: _expanded,
                                canTapOnHeader: true,
                              ),
                            ],
                            dividerColor: Colors.red,
                            expansionCallback: (panelIndex, isExpanded) {
                              _expanded = !_expanded;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Get.width * 0.6,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(35),
                        image: const DecorationImage(
                            image: AssetImage('assets/CarDoor.png'))),
                  ),











                  carSetting(
                      'ad',
                      'asdsa',
                      'sadsa',
                      'asd',
                      'asd',
                      'adw',
                      'asAD',
                      'asdsa',
                      'sadsa',
                      'asd',
                      'asd',
                      'QWESADC',
                      'ZXC',
                      'asdaxz'),
                  Image.asset('assets/CarView.png')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
