import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/firebase_service/FCM.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/boarding/screen_list.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {


  var list = ScreenSList();


  @override
  void initState() {

    FCM();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (build,data,child) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: Get.width,
                      child: list.screensList[data.initialScreen],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    //TODO: Home
                                    onTap: () {
                                      data.initialScreen = 0;
                                      setState(() {});
                                      logger.e("Home Screen");
                                    },
                                    child: SvgPicture.asset(
                                      'assets/Home.svg',
                                      color: data.initialScreen == 0
                                          ? primaryColor
                                          : Colors.grey,
                                    )),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: data.initialScreen == 0
                                          ? primaryColor
                                          : Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              //TODO: Vehicles

                              onTap: () {
                                data.initialScreen = 1;

                                setState(() {});
                                logger.e('Screen for Vehicles');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/vec.svg',
                                    color: data.initialScreen == 1
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  Text(
                                    'Vehicles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: data.initialScreen == 1
                                          ? primaryColor
                                          : Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.transparent),
                              child: Container(
                                height: Get.width * .125,
                                width: Get.width * .125,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.transparent),
                                child: const Icon(
                                  Icons.add,
                                  size: 32,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              //TODO: Records
                              onTap: () {
                                data.initialScreen = 2;
                                setState(() {});
                                logger.e('Screen for Records');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/records.svg',
                                    color: data.initialScreen == 2
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  Text(
                                    'Records',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: data.initialScreen == 2
                                          ? primaryColor
                                          : Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              //TODO: Profiles

                              onTap: () {
                                data.initialScreen = 3;
                                setState(() {});
                                // logger.e('Screen for Profile');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/profile.png',
                                    height: 30,
                                    color: data.initialScreen == 3
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: data.initialScreen == 3
                                          ? primaryColor
                                          : Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const Alignment(0, 0.975),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: InkWell(
                      onTap: () {
                        bottomSheetStartOrder();
                      },
                      child: Container(
                        height: Get.width * .17,
                        width: Get.width * .17,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: primaryColor),
                        child: const Icon(
                          Icons.add,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }


}