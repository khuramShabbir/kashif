import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screen_list.dart';
import 'package:kashif/screens/order_taking_screens/center_inspection_ui.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection.dart';
import 'package:kashif/utils.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var list = ScreenSList();
  int initialScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Expanded(
              child: SizedBox(
                width: Get.width,


                child: list.screensList[initialScreen],
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

          ],),

          Align(
            alignment: const Alignment(0,0.975),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: InkWell(onTap: (){Get.to(()=>bottomSheet());},
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
            ),
          ),

        ],
      ),
    );
  }
}
Future bottomSheet() {
  return Get.bottomSheet(Container(
    height: Get.height / 2,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * .03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
            Text("Efhes Services",
                style: (TextStyle(
                  fontSize: 21,
                ))),
            SizedBox()
          ],
        ),
        SizedBox(
          height: Get.height * .03,
        ),

        /// list of Services in bottomBar Sheet ///

        Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(const OngoingInspectionUi());
                        },
                        child: customDetailBar(
                            showImageAddress: 'assets/ongoing.png',
                            width: Get.width * .9,
                            height: Get.height * .1),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const CenterInspectionUi());
                        },
                        child: customDetailBar(
                            showImageAddress: "assets/centerInspection.png",
                            width: Get.width * .9,
                            height: Get.height * .1),
                      )
                    ]))),
        SizedBox(
          height: Get.height * .04,
        ),
        InkWell(
          onTap: () {
            Get.to(() => const OngoingInspectionUi());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "To order more than one car ?",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                " order now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Get.height * .09,
        )
      ],
    ),
  ));
}