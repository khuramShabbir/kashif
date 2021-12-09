import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils.dart';

class OnGoingServicesUi extends StatefulWidget {
  const OnGoingServicesUi({Key? key}) : super(key: key);

  @override
  _OnGoingServicesUiState createState() => _OnGoingServicesUiState();
}

class _OnGoingServicesUiState extends State<OnGoingServicesUi> {
  int color = 0xFF304FFE;
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Ongoing Service',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              child: SvgPicture.asset(
                'assets/BellIcon.svg',
                color: Colors.black,
                width: 25.0,
                height: 25.0,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    isTaped = true;
                    logger.e('UPCOMING');
                    setState(() {});
                  },
                  child: Container(
                    child: Center(child: Text('UPCOMING',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isTaped?const Color(primaryBlueColor):const Color(primaryColor).withOpacity(.4) ),)),


                    height: Get.height * .055,
                    width: Get.width * .4,
                    decoration: BoxDecoration(
                        color: isTaped
                            ? const Color(primaryBlueColor).withOpacity(.3)
                            : const Color(0x00ffffff),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        border: Border.all(
                            width: 1.5, color: isTaped
                            ? const Color(primaryBlueColor)
                            : const Color(primaryColor).withOpacity(.3),)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    isTaped = false;
                    logger.e('Past');
                    setState(() {

                    });
                  },
                  child: Container(
                    child: Center(child: Text('PAST',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isTaped?Color(primaryColor).withOpacity(.4):Color(primaryBlueColor) ),)),
                    height: Get.height * .055,
                    width: Get.width * .4,
                    decoration: BoxDecoration(
                        color: isTaped
                            ? const Color(0x00ffffff)
                            : Color(color).withOpacity(.3),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        border: Border.all(
                            width: 1.5, color: isTaped
                            ? const Color(primaryColor).withOpacity(.3)
                            : const Color(primaryBlueColor),)),
                  ),
                ),
              ],
            ),

            isTaped? customCardView ():Column(children: [Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: customCarCardView(),
            ),Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: customCarCardView(),
            )],)




          ],
        ),
      ),
    );
  }
}
