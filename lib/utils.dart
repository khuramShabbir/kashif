import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/order_taking_screens/goolemap_for_center_inspection.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';

const primaryColor = Color(0xFFFF203840);

const primaryBlueColor = 0xFF304FFE;
var barColor = Colors.black.withOpacity(0.2);
double progressBarPersent = 0.0;

var logger = Logger();

///bar///
///
///
///
Widget lineBar() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 1,
        color: barColor,
      ),
    );

/// pickup Address///
///

Widget pickupAddress(){
  return
    Container(
      width: Get.width * .8,
      height: Get.height * .1,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child:
                    SvgPicture.asset("assets/pin_location.svg"),
                  ))),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Pick-up Address',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  'B/62,Bhaweshwar Darshan,Altamount',
                  style:
                  TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          ),
          const Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'CHANGE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))),
        ],
      ),
    )



    ;

}



/// Carousal Slider///
///
///

Widget carousalSlider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    child: CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, reason) {},
          viewportFraction: 1,
          height: Get.height * .22,
          autoPlay: true,
        ),
        items: List.generate(
            5,
            (index) => Stack(
                  children: [
                    SizedBox(
                        width: Get.width * .9,
                        child: Image.asset(
                          "assets/card.jpeg",
                          fit: BoxFit.fill,
                        )),
                    Text(
                      "Index $index",
                      style: const TextStyle(color: Colors.red, fontSize: 20),
                    )
                  ],
                ))),
  );
}

/// Custom Button ///
///
///
///

Widget customButton(
    {var buttonWidget,
    double borderRadius = 50,
    double buttonHeight = 0.06,
    double buttonWidth = .4,
    required Function onClick}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(

        /// Please Set values of height and width where`s you want hit this method
        ///   buttonHeight: Get.height * .06,
        ///   buttonWidth: Get.width * .4
        ///
        height: Get.height * buttonHeight,
        width: Get.width * buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color:primaryColor ,
        ),
        child: buttonWidget),
  );
}

/// Custom Indicator For Carousal Slider///
///
///
Widget indicator({
  double width = 10,
  double height = 10,
  var color = const Color(0xFFFEF3C7),
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      height: 10,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
    ),
  );
}

/// Custom InputForm Field ///
///
///

Widget customInputFormField({
  bool obscure = false,
  var keyboardType,
  var onChange,
  var suffixIcon,
  var prefixIconList,
  String? hintText,
  double fontSize = 16,
  var autoValidateMode,
  String? errorText,
  var validator,
  TextEditingController? textEditingController,
  var textColor = Colors.grey,
  bool isOutlinedBorder = false,
}) {
  return TextFormField(

    autovalidateMode: autoValidateMode,
    controller: textEditingController,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: obscure,
    onChanged: onChange,
    decoration: InputDecoration(
      disabledBorder: InputBorder.none,
      border: isOutlinedBorder
          ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          : null,
      prefixIcon: prefixIconList,
      suffix: suffixIcon,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: fontSize,
        color: Colors.grey,
      ),
    ),
  );
}



Widget customDetailBar({
  double width = 400,
  double height = 20,
  double radius = 15,
  Widget? children,
  String showImageAddress = "assets/ongoing.png",
  String inspectionType = 'On going inspection',
  String definitionOfService = 'Simple definition of a service',
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xFFDADDDE), Colors.white])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                width: Get.width * .18,
                height: Get.height * .08,
                child: Image.asset(
                  showImageAddress,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  inspectionType,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  definitionOfService,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(
            width: Get.width * .17,
          ),
          Container(
            child: const Icon(Icons.arrow_forward_outlined),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
          )
        ],
      ),
    ),
  );
}



Widget confirmedOrder({
  var textBorderColor = Colors.green,
  var textColor = Colors.green,
  var inspectionTypeText = 'Full Car Inspection',
  var checkInTypeText = 'CONFIRMED',
  var typeCode = '#00678',
  var rating = const SizedBox(),
}) {
  return SizedBox(
    width: Get.width * .9,
    height: Get.height * .1,
    child: Column(
      children: [
        Expanded(
            child: Row(
          children: [
            SizedBox(
              width: Get.width * .03,
            ),
            Text(
              inspectionTypeText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: Get.width * .2,
            ),
            Container(
              width: Get.width * .2,
              height: Get.height * .022,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: textBorderColor)),
              child: Center(
                child: Text(
                  checkInTypeText,
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              ),
            )
          ],
        )),
        Expanded(
            child: Row(
          children: [
            SizedBox(
              width: Get.width * .03,
            ),
            Text(typeCode),
            SizedBox(width: Get.width * .05),
            rating
          ],
        )),
        lineBar()
      ],
    ),
  );
}

/// Status Button///
///
Widget statusButton({
  String statusText='CONFIRMED',


}) {
  return Container(

    decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 1, color: Colors.green)),
    alignment: Alignment.center,
    child:  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        statusText,
        style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: Get.width*.03),
      ),
    ),
  );
}

///
///  Bottom Sheet///
///
///
Widget bottomSheet() {
  return Container(
    width: Get.width,
    height: Get.height * .77,
    decoration: const BoxDecoration(
        color:primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Order Confirmation",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
        Expanded(
            flex: 7,
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset('assets/bank_Riyadh.png')),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Riyadh',
                                  style: TextStyle(
                                      color:primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '29846264 HH',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 12),
                                ),
                                Text(
                                  'Saudi Arabia Riyadh',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset('assets/Edit.png'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  SizedBox(
                    width: Get.width * .7,
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        //TODO:Payment method Selection

                        Container(
                          child: Image.asset('assets/slection.png'),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color:primaryColor),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Cash',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Pay the delegate',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: SvgPicture.asset('assets/cards.svg'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  SizedBox(
                    width: Get.width * .7,
                    height: Get.height * .08,
                    child: Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5, color: primaryColor),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Credit Card',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '2540 xxxx xxxx 2648',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.5),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset('assets/visa.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset('assets/mastercard .png'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    height: Get.height * .14,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  color: primaryColor, fontSize: 12),
                            ),
                            Text(
                              '\$9.00',
                              style: TextStyle(
                                  color:primaryColor, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tax(10%)',
                              style: TextStyle(
                                  color: primaryColor, fontSize: 12),
                            ),
                            Text(
                              '\$0.90',
                              style: TextStyle(
                                  color:primaryColor, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Delivery fee',
                              style: TextStyle(
                                  color:primaryColor, fontSize: 12),
                            ),
                            Text(
                              '\$2.00',
                              style: TextStyle(
                                  color:primaryColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style:
                              TextStyle(color: Colors.grey.withOpacity(.5)),
                            ),
                            const Text(
                              '\$11.20',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        customButton(
                            onClick: () {
                              Get.to(() => const GoogleMapForCenterInspectionUi());
                            },

                            buttonWidget: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/pay-now.png'),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    'Pay now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )),
      ],
    ),
  );
}

/// Junaid Utils ///
///

Color grey = const Color(0x0ffb8b8b);

StringPicture carDoor = 'assets/CarDoor.png' as StringPicture;

late bool value = true;

Widget customCardView() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Full car inspection',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      statusButton()
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Full car inspection',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('#number??')
                    ],
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: [
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Date',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '21st Sept 2021, monday',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'PICK-UP-TIME',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '9:00-9:30am',
                            style: TextStyle(),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
        )),
  );
}

Widget customCarCardView() {
  return Stack(
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
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.green)),
                                    child: const Center(
                                      child: Text(
                                        "CONFIRMED",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 10),
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
                                width: 1, color: Colors.grey.withOpacity(.3))),
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
  );
}



Widget appBar(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
    child: Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        Expanded(child: Container()),
        InkWell(onTap: () {}, child: SvgPicture.asset("assets/BellIcon.svg")),
      ],
    ),
  );
}

Widget carBrand(String carName) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22.0),
    child: Row(
      children: [
        const Text(
          'Car brand :',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(carName),
        Expanded(child: Container()),
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              "assets/upload.png",
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 8,
        ),
        Image.asset("assets/printer.png")
      ],
    ),
  );
}



Widget carReports(String text1, String text2, String text3, String text4) {
  late bool internalOrder = true;
  late bool seatsDirty = false;

  return Column(
    children: [
      Row(
        children: [
          internalOrder
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.greenAccent,
                )
              : const Icon(
                  Icons.info_outline,
                  color: Colors.redAccent,
                ),
          const SizedBox(width: 8),
          internalOrder
              ? Text(
                  text1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      text2,
                      style: const TextStyle(color: Colors.redAccent),
                    )
                  ],
                )
        ],
      ),
      Row(
        children: [
          seatsDirty
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.greenAccent,
                )
              : const Icon(
                  Icons.info_outline,
                  color: Colors.redAccent,
                ),
          const SizedBox(width: 8),
          seatsDirty
              ? Text(
                  text3,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text3,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      text4,
                      style: const TextStyle(color: Colors.redAccent),
                    )
                  ],
                )
        ],
      ),
    ],
  );
}

Widget carSetting(
  String t1,
  String t2,
  String t3,
  String t4,
  String t5,
  String t6,
  String t7,
  String t8,
  String t9,
  String t10,
  String t11,
  String t12,
  String t13,
  String t14) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Brand:'),
                      Text(t1)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t2)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t3)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t4)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t5)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t6)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t7)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t8)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t9)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t10)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t11)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t12)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t13)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset('assets/TimeCalendar.svg'),
                      const Text('Paint:'),
                      Text(t14)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
