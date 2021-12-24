import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/splash_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Get.offAll(()=>const OnboardingScreen());
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        color: const Color(0xff203840),
        child: Center(
            child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.fill,
          height: Get.height * 0.35,width: Get.width  *0.75,
        )));
  }
}
