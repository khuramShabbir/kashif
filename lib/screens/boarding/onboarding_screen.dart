import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/login-Screens/sign_in_ui.dart';
import 'package:kashif/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> assetImages = [
    'assets/splash_bg.png',
    'assets/splash_bg.png',
  ];
  int carousalIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  carousalIndex = index;
                  setState(() {});
                },
                viewportFraction: 1,
                height: Get.height,
                reverse: true,
                autoPlay: false,
              ),
              items: [
                Stack(
                  children: [
                    Image(
                        width: Get.width,
                        height: Get.height,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          assetImages[0],
                        )),
                    Container(
                      color: Colors.black.withOpacity(.3),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Image(
                        width: Get.width,
                        height: Get.height,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          assetImages[0],
                        )),
                    Container(
                      color: Colors.black.withOpacity(.3),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                    height: Get.height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 2, child: Container()),
                        Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    width: Get.width * .3,
                                    height: Get.height * .2,
                                    child: Image.asset(
                                      "assets/logo.png",
                                      fit: BoxFit.cover,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    indicator(
                                        width: carousalIndex == 0 ? 30 : 10,
                                        color: carousalIndex == 0
                                            ? const Color(0xFFFEF3C7)
                                            : Colors.white),
                                    indicator(
                                        width: carousalIndex == 1 ? 30 : 10,
                                        color: carousalIndex == 1
                                            ? const Color(0xFFFEF3C7)
                                            : Colors.white)
                                  ],
                                )
                              ],
                            )),
                      ],
                    )),
                SizedBox(
                    height: Get.height * 0.25,
                    child: ShapeOfView(
                      child: Container(
                        color: Colors.white,
                      ),
                      elevation: 4,
                      // height:Get.height  ,
                      shape: DiagonalShape(
                          position: DiagonalPosition.Top,
                          direction: DiagonalDirection.Left,
                          angle: DiagonalAngle.deg(angle: 10)),
                    )),
              ],
            ),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: Get.height * 0.8,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => const SignInUI());
                              },
                              child: Text(
                                "skip",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Get.height *0.02,
                                ),
                              ),
                            ),
                          ),
                          customButton(buttonWidth: 0.35,
                              onClick: () => {Get.to(() => const SignInUI())},
                              buttonWidget: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: Get.height *0.02),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              borderRadius: 50,
                             ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
