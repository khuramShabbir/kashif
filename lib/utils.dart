import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';



const primaryColor = 0xFFFF203840;
var barColor=Colors.black.withOpacity(0.2);
var logger = Logger();

///bar///
///
///
///
Widget bar()=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0),
  child:   Container(

  height: 1,

  color: barColor,

        ),
);

/// Carousal Slider///
///
///

Widget carousalSlider (){
  return
    Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 15),
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
                  SizedBox(width: Get.width*.9,

                      child: Image.asset("assets/card.jpeg",fit: BoxFit.fill,)),

                  Text(
                    "Index $index",
                    style: const TextStyle(
                        color: Colors.red, fontSize: 20),
                  )
                ],
              ))),
    );



}





/// Custom Button ///
///
///
///

Widget customButton({
  var buttonWidget,
  double borderRadius = 50,
  double buttonHeight = 50,
  double buttonWidth = 150,
  required Function onClick,
}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: const Color(primaryColor),
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
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      height: 10,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
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
  double fontSize = 20,
  var textColor = Colors.grey,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscure,
    onChanged: onChange,
    decoration: InputDecoration(
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

Widget customRoundButton({double radius = 50, var child}) {
  return CircleAvatar(
    backgroundColor: const Color(
      primaryColor,
    ),
    child: child,
    radius: radius,
  );
}

Widget customDetailBar({
  double width = 400,
  double height = 20,
  double radius = 15,
  Widget? children,
  String showImageAddress = "assets/Kashif.png",
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

// width:
//  Get.width * .9
//  height:
// Get.height * .1

Widget confirmedOrder(
    {var textBorderColor = Colors.green,
    var textColor = Colors.green,
    var inspectionTypeText = 'Full Car Inspection',
    var checkInTypeText = 'CONFIRMED',
    var typeCode = '#00678',
    var  rating= const SizedBox(),

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
              width: Get.width * .22,
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
       bar()
      ],
    ),
  );
}



/// Junaid Utils ///
///





Color grey = const Color(0x0ffb8b8b);

StringPicture carDoor = 'assets/CarDoor.png' as StringPicture;

late bool value = true;




Widget customCardView (){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        width: Get.width*0.8,
        height: Get.height*0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Colors.grey)
        ),
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Expanded(child: Container()),
                          confirmButton()
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            'Full car inspection',
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                          SizedBox(width: 8,),
                          Text('#number??')
                        ],
                      )
                    ],
                  )
              ),
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
                            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {


                            },
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                '21st Sept 2021, monday',
                                style: TextStyle(
                                    fontSize: 15
                                ),
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
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                '9:00-9:30am',
                                style: TextStyle(
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
              )
            ],
          ),
        )
    ),
  ) ;
}

Widget customCarCardView (){
  return Padding(
    padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
    child: Column(
      children: [
        Stack(
            children: [
              Container(

                  width: Get.width*0.8,
                  height: Get.height*0.21,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height*0.05),
                        const Text(
                          'Car Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 12,),
                        const Text(
                          'AAA - 0000',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 12,),

                        Row(
                          children: [
                            const Text(
                              '*******7945CG',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 8,),
                            confirmButton()
                          ],
                        ),
                      ],
                    ),
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/car.png"),
                ],
              )
            ]
        ),
       Container(width: Get.width*.8,height: 1,color: Colors.grey.withOpacity(.5),),
        Container(
          width: Get.width*0.8,
          height: Get.height*0.07,
          decoration: const BoxDecoration( color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),

          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    decoration:  BoxDecoration(color:Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),

                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]
                    ),

                      alignment: Alignment.center,
                      child: const Text(
                        're-application',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  )
              ),

              Container(
                width: 1,

                color: Colors.grey.withOpacity(.5),
              ),
              Expanded(
                  child: Container(


                      decoration: BoxDecoration(color:Colors.white,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(3,0.0), // changes position of shadow
                            ),
                          ]

                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'service report',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  )
              )
            ],
          ),
        )
      ],
    ),
  ) ;
}

Widget confirmButton (){
  return Container(
    height: 20,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 1, color: Colors.greenAccent)
    ),
    alignment: Alignment.center,
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        'CONFIRMED',
        style: TextStyle(
            color: Colors.greenAccent
        ),
      ),
    ),
  );
}

Widget appBar (String text){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 18),
    child: Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        Expanded(child: Container()),
        InkWell(
            onTap: (){},
            child: SvgPicture.asset("assets/BellIcon.svg")
        ),
      ],
    ),
  );
}

Widget carBrand (String carName){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22.0),
    child: Row(
      children: [
        const Text(
          'Car brand :',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        Text(carName),
        Expanded(child: Container()),
        SvgPicture.asset('assets/ShareIcon.svg',height: 22,),
        const SizedBox(width: 8,),
        SvgPicture.asset('assets/TimeCalendar.svg')
      ],
    ),
  );
}


// Widget carReportDetails (String icon, String text, ){
//   bool _expanded = false;
//
//   return
//     Column(
//       children: [
//         Container(
//           child: ExpansionPanelList(
//             elevation: 0,
//             children: [
//               ExpansionPanel(
//                 headerBuilder: (context, isExpanded) {
//                   return Container(
//                     height: 50,
//                     width: Get.width,
//                     decoration: BoxDecoration(
//                         color: grey,
//                         borderRadius: BorderRadius.circular(4)
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 12.0),
//                       child: Row(
//                         children: [
//                           SvgPicture.asset('assets/TimeCalendar.svg'),
//                           SizedBox(width: 8),
//                           Text('avcdf'),
//                           Expanded(child: Container()),
//                           Icon(Icons.check_circle,color: Colors.greenAccent,),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 body:ListTile(
//                   title: Text('Description text',style: TextStyle(color: Colors.black)),
//                 ),
//                 isExpanded: _expanded,
//                 canTapOnHeader: true,
//               ),
//             ],
//             dividerColor: Colors.grey,
//             expansionCallback: (panelIndex, isExpanded) {
//               _expanded = !_expanded;
//               setState(() {
//               });
//             },
//           ),
//         ),
//       ],
//     );
// }


Widget carReports (String text1, String text2, String text3, String text4){

  late bool internalOrder = true;
  late bool seatsDirty = false;


  return Column(
    children: [
      Row(
        children: [
          internalOrder? const Icon(Icons.check_circle,color: Colors.greenAccent,):
          const Icon(Icons.info_outline,color: Colors.redAccent,),
          const SizedBox(width: 8),
          internalOrder?Text(
            text1,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18),
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          seatsDirty? const Icon(Icons.check_circle,color: Colors.greenAccent,):
          const Icon(Icons.info_outline,color: Colors.redAccent,),
          const SizedBox(width: 8),
          seatsDirty?Text(
            text3,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18),
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text3,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

Widget carSetting (String t1, String t2, String t3, String t4, String t5, String t6, String t7, String t8, String t9, String t10, String t11, String t12,String t13,String t14,){
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 18),
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




