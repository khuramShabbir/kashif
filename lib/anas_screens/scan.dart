import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kashif/anas_screens/support.dart';



class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  int a=0;
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
                        Get.back();
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
          Expanded(child: Container()),
          /// SLIDER
          Expanded(flex:4,
              child:
              CarouselSlider(
                items: [

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Image.asset("assets/card-atm.png")
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Image.asset("assets/card-atm.png")
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Image.asset("assets/card-atm.png")
               ),

                ],
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    onPageChanged: (index , reason){
                      a = index ;
                      setState(() {
                      });

                    }
                ),
              )

          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height:5,
                  width:5,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: a==0 ? Colors.grey.shade500 : Colors.grey.shade300,

                  )
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    height: 5,
                    width: 5,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: a==1 ? Colors.grey.shade500 : Colors.grey.shade300,

                    )
                ),
              ),
              Container(
                  height: 5,
                  width: 5,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: a==2 ?Colors.grey.shade500 : Colors.grey.shade300,
                    // border: Border.all(
                    //   color: Colors.white,
                    // ),
                  )
              )
            ],
          )),
          Expanded(child: Container()),
          Expanded(child: Container()),
          /// SCAN
          Expanded(
            flex: 3,
            child:  Column(
            children: [
              Container(
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
            ],
          ),),
          Expanded(child: Container()),
        ],),
      ),
    );
  }
}
