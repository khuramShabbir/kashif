import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kashif/screens/boarding/dashboardscreen.dart';
import 'package:kashif/screens/boarding/onboarding_screen.dart';
import 'package:kashif/utils.dart';

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

      if(storage.read(isUserLoggedIn) != null ){
        Get.offAll(()=>const DashBoardScreen());
      }
      else{
        Get.offAll(()=>const OnboardingScreen());
      }
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
