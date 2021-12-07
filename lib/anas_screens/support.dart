import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'contactus.dart';
import 'profile.dart';
import 'supportscreen2.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {

  Widget SupportRow({String Entertext="Frequently"}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

      Text(Entertext ,style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade800
      ),),
      SvgPicture.asset("assets/shape .svg"),

    ],);

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ///APP BAR
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Get.back(result: Profile());
                    },
                    child: SvgPicture.asset(
                      "assets/leftarrow.svg",
                      width: 16,
                      height: 16,
                    ),
                  ),
                  texttext("Support", 16),
                  SvgPicture.asset("assets/bell-ringing.svg"),
                ],
              ),
            )),
            Expanded(
                flex:2
                ,child: Container()),
            Expanded(
                flex:8,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height / 4.2,
                        width: Get.width / 1.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius:3,
                              blurRadius:5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0 ,vertical:10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            InkWell(
                              onTap:(){
                                Get.to(Support2());

                              },
                                child: SupportRow(Entertext: "Frequently asked questions")),
                            /// container height = 1
                            Container(height: 1,
                            color: Colors.grey.shade400,),
                            SupportRow(Entertext: "Your support tickets"),
                            /// container height = 1
                            Container(height: 1,
                              color: Colors.grey.shade400,),
                            InkWell(
                                onTap: (){
                                  Get.to(ContactUs());
                                },
                                child: SupportRow(Entertext: "Contact us")),


                          ],),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
texttext(String a, double b) {
  return Text(
    a,
    style: TextStyle(fontSize: b, fontWeight: FontWeight.w500),
  );
}
boldtext(String text , {double size=15}){
  return  Text(text ,style: TextStyle(

      fontSize:size,

      fontWeight: FontWeight.bold

  ),);
}
