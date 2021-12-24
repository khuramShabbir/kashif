import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/anas_screens/support.dart';
import 'profile.dart';

class Support3 extends StatefulWidget {
  const Support3({Key? key}) : super(key: key);

  @override
  _Support3State createState() => _Support3State();
}

class _Support3State extends State<Support3> {
  Widget blackContainer({double height=17, double width=3.7, String text = "Log Out "}){
    return  Container(
      height:Get.height/height,
      width:Get.width/width,
      child: Center(child: Text(text,style: const TextStyle(
          color: Colors.white,
        fontWeight: FontWeight.bold
      ),)),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(13))
      ),
    );


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        Get.back(result: const Profile());
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
          ///BODY
          Expanded(flex:7,
              child:SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                boldtext("I left an item"),

                 const Padding(
                   padding: EdgeInsets.symmetric(vertical: 25.0),
                   child: Text("If you've lost an item you will ned to send us\n"
                       "an message immediately ,please remembering\n "
                       "to provide us with as many detail as possible \n"
                       "about ypur lost item and ride you took . if \n"
                       "we find it we'll connect you with the driver\n"
                       "directly to get it back "),
                 ),
                   const Padding(
                     padding: EdgeInsets.only(top:20.0 ,bottom: 10),
                     child: Text("TELL US" ,style: TextStyle(
                         fontWeight: FontWeight.bold,
                       fontSize: 12
                     ),),
                   ),
                    textField(3.4,1.25 ,hintText: "Your message here...")

                  ],
                  ),
              )),
            ///submit button
            Expanded(
              flex:2,
              child: Column(
                children: [
                  blackContainer(height: 15 ,width: 1.23 ,text: "Submit")
                ],

              ))
        ],

        ),
      ),
    );
  }
}

Widget textField(double height , double width  , {String hintText = ""}){
  return  Container(

    height: Get.height/height,
    width: Get.width/width,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(15))
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
        ),
      ),
    ),
  );
}
