import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/anas_screens/support.dart';
import 'package:kashif/anas_screens/supportscreen3.dart';

import 'profile.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isChecked = false;
  var checked = false;
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
                        Get.back(result: Builder(
                          builder: (context) {
                            return const Profile();
                          }
                        ));
                      },
                      child: SvgPicture.asset(
                        "assets/images/leftarrow.svg",
                        width: 16,
                        height: 16,
                      ),
                    ),
                    texttext("Support", 16),
                    SvgPicture.asset("assets/images/bell-ringing.svg"),
                  ],
                ),
              )),
          Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      boldtext("I was involved in an accident"),
                      const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text("If you've lost an item you will ned to send us\n"
                          "an message immediately ,please remembering\n "
                          "to provide us with as many detail as possible \n"
                          "about ypur lost item and ride you took . if \n"
                          "we find it we'll connect you with the driver\n"
                          "directly to get it back "),
                    ),
                      const SizedBox(height: 15,),
                      Row(

                        children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            boldtext("DATE" ,size: 12),
                              const SizedBox(height: 6,),
                            textField(19,2.5)
                          ],),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldtext("TIME" ,size: 12),
                              const SizedBox(height: 6,),
                              textField(19,2.5  )
                            ],),
                        )
                      ],),
                      const SizedBox(height: 12,),
                      Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       boldtext("PLACE" ,size: 12),
                         const SizedBox(height: 3,),
                       textField(19, 1.15),
                     ],),
                      const SizedBox(height: 20),
                      boldtext("HAVE YOU BEEN HURT?" ,size: 12),
                      const SizedBox(height: 12,),
                      Row(children: [
                         Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              activeColor: Colors.teal.shade900,
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                  if(isChecked){
                                    checked = false;
                                  }

                                });
                              },
                            ),
                            const Text(
                              "Yes",
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        const SizedBox(width: 20,),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              activeColor: Colors.teal.shade900,
                              checkColor: Colors.white,
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  checked = value!;
                                  if(checked){
                                    isChecked = false;
                                  }

                                });
                              },
                            ),
                            const Text(
                              "No",

                            ),
                          ],)
                      ],),
                      const SizedBox(height: 12,),
                      Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       boldtext("HAVE THE ACCIDENT OCCURRED" ,size: 12),
                         const SizedBox(height:4,),
                       textField(19, 1.15),
                     ],),
                      const SizedBox(height: 15,),
                      const SizedBox(height:18),
                      Container(
                      height: Get.height/6,
                      width: Get.width/1.15,
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: SvgPicture.asset("assets/images/Vector.svg"),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.all(Radius.circular(17))
                        ),),
                      const SizedBox(height: 18)

                  ],),
                ),
              ))
        ],),
      ),
    );
  }
}
