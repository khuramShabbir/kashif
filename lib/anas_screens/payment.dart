import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/anas_screens/scan_tempelet.dart';
import 'package:kashif/anas_screens/support.dart';
import 'package:kashif/anas_screens/supportscreen3.dart';
import 'profile.dart';


class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
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
                    texttext("Payment", 16),
                    SvgPicture.asset("assets/bell-ringing.svg"),
                  ],
                ),
              )),
          Expanded(
              flex:10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 18,),

                 Padding(
                   padding: const EdgeInsets.symmetric(vertical:20.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [

                     boldtext("CARD NUMBER" ,size: 12),
                       const SizedBox(height:5,),
                     textField(18, 1.25),
                   ],),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                     boldtext("CARD HOLDER NAME" ,size: 12),
                       const SizedBox(height:5,),
                     textField(18, 1.25),
                   ],),
                 ),

                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:20.0),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         boldtext("EXP.DATE" ,size: 12),
                           const SizedBox(height:5,),
                         textField(18,2.65),
                       ],),
                       textField(18,2.65),
                     ],),
                 ),

                    const SizedBox(height: 18,),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: InkWell(onTap: (){Get.to(const ScanTemplate());},
                        child: Container(
                          height: Get.height/14,
                          width: Get.width/1.12,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                            Row(children: [
                              SvgPicture.asset("assets/ic_scan.svg"),
                              const SizedBox(width: 5,),
                              const Text("Scan")


                            ],),
                            const Text("Done" ,style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),)
                          ],),
                        ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius:4,
                                blurRadius:6,
                                offset:
                                const Offset(1, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    )

                  ],
                  ),
              )),

          ],),
      ),
    );
  }
}
