


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/anas_screens/profile.dart';
import 'package:kashif/anas_screens/support.dart';

import 'supportscreen3.dart';

class Support2 extends StatefulWidget {
  const Support2({Key? key}) : super(key: key);


  @override
  _Support2State createState() => _Support2State();
}

class _Support2State extends State<Support2> {

  boldText(String text){
    return  Text(text ,style: const TextStyle(

        fontSize: 17,

        fontWeight: FontWeight.bold

    ),);
  }

  Widget supportRow({String enterText="Frequently"}){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(enterText ,style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800
          ),),
          SvgPicture.asset("assets/shape .svg"),

        ],),
    );

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          ///APP BAR
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back(result: const Profile());
                      },
                      child: SvgPicture.asset(
                        "assets/leftarrow.svg",
                        width: 16,
                        height: 16,
                      ),
                    ),
                    texttext("Support", 16),
                    SvgPicture.asset("assets/images/bell-ringing.svg"),
                  ],
                ),
              )),
          /// body
          Expanded(
              flex: 10,
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
  ///Account
                    ///
  Padding(
  padding: const EdgeInsets.symmetric(vertical: 30.0),
  child: boldText("Account")
),
            InkWell(
                onTap: (){
                Get.to(const Support3());
                },
                child: supportRow(enterText: "Unblock account")),
          /// container height = 1
          Container(height: 1,
            color: Colors.grey.shade300,),
          supportRow(enterText: "Change phone number"),
          /// container height = 1
          Container(height: 1,
            color: Colors.grey.shade300,),
          supportRow(enterText: "Privacy information"),
                    /// Payment and pricing
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child:  boldText("Payment and Pricing")
                    ),
                    supportRow(enterText: "Accepted payment methods"),
                    /// container height = 1
                    Container(height: 1,
                      color: Colors.grey.shade300,),
                    supportRow(enterText: "Price estimate"),
                    /// container height = 1
                    Container(height: 1,
                      color: Colors.grey.shade300,),
                    supportRow(enterText: "Cancellation fee"),
                    Container(height: 1,
                      color: Colors.grey.shade300,),
                    supportRow(enterText: "Damage or cleaning fee"),
                    /// container height = 1
                    Container(height: 1,
                      color: Colors.grey.shade300,),
                    supportRow(enterText: "Price higher than expected"),
                    /// container height = 1
                    Container(height: 1,
                      color: Colors.grey.shade300,),
                    supportRow(enterText: "Using a coupon"),
                    Container(height: 1,
                      color: Colors.grey.shade300,),
                    const SizedBox(height:10,)
          ],),
              ))
  ])
      ),
    );
  }
}
