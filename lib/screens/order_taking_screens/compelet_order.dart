import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils.dart';
import 'link_ui.dart';

class CompleteYourOrder extends StatefulWidget {
  const CompleteYourOrder({Key? key}) : super(key: key);

  @override
  _CompleteYourOrderState createState() => _CompleteYourOrderState();
}

class _CompleteYourOrderState extends State<CompleteYourOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4F4),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: InkWell(
            onTap: Get.back,
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(onTap: (){
              Get.to(() =>const LinkUi());
            },
              child: SvgPicture.asset(
                'assets/menu.svg',
                color: Colors.black,
                width: 25.0,
                height: 25.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Welcome !",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Khaled Al-Kayali",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  bar(),

                  ///
                  /// /// Carousal Slider /// ///
                  ///
                  ///
                  //TODO: Carousal Slider

                  carousalSlider(),
                  bar()
                ],
              )),
          Expanded(

              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        confirmedOrder(rating: Row(
                          children: List.generate(
                              4,
                                  (index) => SvgPicture.asset(
                                'assets/star.svg',

                                height: 12,
                              )),
                        )),
                        confirmedOrder(
                            textColor: Colors.red,
                            textBorderColor: Colors.red,
                            checkInTypeText: "ON GOING",

                        )],
                    ),
                  ),

                  //TODO: Bottom Navigation Bar
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: BottomAppBar(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  child:
                                  SvgPicture.asset("assets/Union.svg")),
                              SvgPicture.asset("assets/Union.svg"),
                              SvgPicture.asset("assets/Union.svg"),
                              SvgPicture.asset("assets/Union.svg"),
                              SvgPicture.asset("assets/Union.svg"),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
