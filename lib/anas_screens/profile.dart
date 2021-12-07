import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'payment.dart';
import 'support.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

  class _ProfileState extends State<Profile> {
  ///black Container FUNCTION
  Widget blackContainer({double height=17, double width=3.7, String text = "Log Out "}){
    return  Container(
      height:Get.height/height,
      width:Get.width/width,
      child: Center(child: Text(text,style: const TextStyle(
          color: Colors.white
      ),)),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade900,
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
    );


  }

  /// CONTAINER FUNCTION
  Widget container1(
      {String name = "",
      String kaya = "kaya",
      String picture = "assets/user.svg"}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: Get.height / 18,
            width: Get.width / 1.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: SvgPicture.asset(picture),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30))),
                        height: Get.height / 20,
                        width: Get.width / 9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 10),
                            ),
                            Text(
                              kaya,
                              style:
                                  const TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0, bottom: 10),
                    child:
                        SvgPicture.asset("assets/Edit.svg"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///TEXT FUNCTION
  textText(String a, double b) {
    return Text(
      a,
      style: TextStyle(fontSize: b, fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


      ///app bar
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/leftarrow.svg",
                    width: 16,
                    height: 16,
                  ),
                  textText("Profile", 16),
                  SvgPicture.asset("assets/bell-ringing.svg"),
                ],
              ),
            )),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      container1(name: "Name", kaya: "Khaled Al-kayali"),
                      container1(name: "Phone number" ,kaya: " +966000000000" ,picture: "assets/phone (Stroke).svg"),
                      container1(name: "Email" ,kaya: "lqaya ali@ .com" ,picture: "assets/Message.svg"),
                      container1(name: "Magic Coffee store Address" ,kaya: "BradFoard " ,picture: "assets/pin.svg"),
                      InkWell(
                          onTap: (){

                            Get.to(const PaymentM());
                          },
                          child: container1(kaya: "Payment Methode" ,picture: "assets/work.svg")),
                      InkWell(
                          onTap: (){
                            Get.to(const Support());
                          },
                          child: container1(kaya: "Help" ,picture: "assets/chat.svg")),

                    ],
                  ),
                ),
              ),
            ),
             Expanded(
               flex:3,
               child: Padding(
                 padding: const EdgeInsets.only(left: 30.0),
                 child: Column(

                   children: [

                     blackContainer(height:17 ,width: 3.7 ,text:" Log Out"),
                   ],
                 ),
               ),)

          ],
        ),
      ),
    );
  }
}
