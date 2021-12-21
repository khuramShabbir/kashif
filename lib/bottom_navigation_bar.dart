import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/odrder_start.dart';
import 'package:kashif/screen_list.dart';
import 'package:kashif/utils.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var list = ScreenSList();
  int initialScreen = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: list.screensList[initialScreen],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: Get.width,
                height: Get.height * .15,
                child: Stack(
                  children: [
                    Align(
                      child: Container(
                        height: Get.height * .08,
                        width: Get.width * .9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
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
                                        initialScreen = 0;
                                        setState(() {});
                                        logger.e("Home Screen");
                                      },
                                      child: SvgPicture.asset(
                                        'assets/Home.svg',
                                        color: initialScreen == 0
                                            ? const Color(primaryColor)
                                            : Colors.grey,
                                      )),
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: initialScreen == 0
                                            ? const Color(primaryColor)
                                            : Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                //TODO: Vehicles

                                onTap: () {
                                  initialScreen = 1;

                                  setState(() {});
                                  logger.e('Screen for Vehicles');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/vec.svg',
                                      color: initialScreen == 1
                                          ? const Color(primaryColor)
                                          : Colors.grey,
                                    ),
                                    Text(
                                      'Vehicles',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: initialScreen == 1
                                            ? const Color(primaryColor)
                                            : Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                //TODO: Records
                                onTap: () {
                                  initialScreen = 2;
                                  setState(() {});
                                  logger.e('Screen for Records');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/records.svg',
                                      color: initialScreen == 2
                                          ? const Color(primaryColor)
                                          : Colors.grey,
                                    ),
                                    Text(
                                      'Records',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: initialScreen == 2
                                            ? const Color(primaryColor)
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
                                  initialScreen = 3;
                                  setState(() {});
                                  logger.e('Screen for Profile');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/profile.png',
                                      height: 30,
                                      color: initialScreen == 3
                                          ? const Color(primaryColor)
                                          : Colors.grey,
                                    ),
                                    Text(
                                      'Profile',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: initialScreen == 3
                                            ? const Color(primaryColor)
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: InkWell(
                                //TODO: Implement on Button
                                onTap: () {
                                  bottomSheet();
                                },
                                child: Container(
                                  height: Get.width * .17,
                                  width: Get.width * .17,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: const Color(primaryColor)),
                                  child: const Icon(
                                    Icons.add,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .035,
                        ),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}