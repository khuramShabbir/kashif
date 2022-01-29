import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/junaid_Screens/car_brand_details_2_ui.dart';
import '../utils.dart';
import 'car_brand_details.dart';

class OnGoingServicesUi extends StatefulWidget {
  const OnGoingServicesUi({Key? key}) : super(key: key);

  @override
  _OnGoingServicesUiState createState() => _OnGoingServicesUiState();
}

class _OnGoingServicesUiState extends State<OnGoingServicesUi> {
  int color = 0xFF304FFE;
  bool isTaped = true;

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
                    // logger.e('UPCOMING');
                    setState(() {});
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'UPCOMING',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isTaped
                              ? const Color(primaryBlueColor)
                              : primaryColor.withOpacity(.4)),
                    )),
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
                          width: 1.5,
                          color: isTaped
                              ? const Color(primaryBlueColor)
                              : primaryColor.withOpacity(.3),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    isTaped = false;
                    logger.e('Past');
                    setState(() {});
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'PAST',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isTaped
                              ? primaryColor.withOpacity(.4)
                              : const Color(primaryBlueColor)),
                    )),
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
                          width: 1.5,
                          color: isTaped
                              ? primaryColor.withOpacity(.3)
                              : const Color(primaryBlueColor),
                        )),
                  ),
                ),
              ],
            ),
            isTaped
                ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Get.to(() => const CarBrandDetailUi());
                              },
                              child: upcomingDetail());
                        }),
                  )
                : InkWell(
                    onTap: () {
                      Get.to(() => const CarBrandUi2());
                    },
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return pastDetail();
                        }),
                  )
          ],
        ),
      ),
    );
  }
}

Widget upcomingDetail() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.2))),
      child: Padding(
        padding: EdgeInsets.all(Get.width * .03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Full car inspection',
                  style: TextStyle(
                      fontSize: Get.width * .04, fontWeight: FontWeight.bold),
                ),
                statusButton()
              ],
            ),
            SizedBox(
              height: Get.height * .01,
            ),
            Row(
              children: [
                Text(
                  'Ford Crown Victoria',
                  style: TextStyle(
                      fontSize: Get.width * .035,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: Get.width * .05,
                ),
                Text(
                  '#00678',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: Get.width * .035,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: Get.height * .08,
            ),
            /// 5star ratting
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  itemSize: 18,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DATE',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: Get.width * .035,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'PICK-UP TIME',
                  style: TextStyle(
                      fontSize: Get.width * .035,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '21ST Sept 2021, Monday',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '9:00-9:30am',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget pastDetail() {
  return Padding(
    padding: EdgeInsets.only(top: Get.height * .02),
    child: Stack(
      children: [
        Center(
          child: Container(
            height: Get.height * .2,
            width: Get.width * .8,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  offset: const Offset(-3, 3),
                  blurRadius: 5),
            ]),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Ford Crown Victoria',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'AAA - 0000',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text('******879CG'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      width: Get.width * .18,
                                      height: Get.height * .022,
                                      decoration: BoxDecoration(
                                          color: Colors.green.withOpacity(.15),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border:
                                              Border.all(color: Colors.green)),
                                      child: const Center(
                                        child: Text(
                                          "CONFIRMED",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(.3))),
                          child: Row(
                            children: [
                              const Expanded(
                                  child: Center(
                                      child: Text(
                                're-application',
                                style: TextStyle(
                                    color: Color(primaryBlueColor),
                                    fontWeight: FontWeight.bold),
                              ))),
                              Container(color: Colors.grey, width: 1),
                              const Expanded(
                                  child: Center(
                                      child: Text(
                                'Service report',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/car_model.png',
              height: Get.width * .3,
              width: Get.width * .4,
            ))
      ],
    ),
  );
}
