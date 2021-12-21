import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kashif/utils.dart';

import '../../DashBoardScreen.dart';

class OtpVerifyCode extends StatefulWidget {
  const OtpVerifyCode({Key? key}) : super(key: key);

  @override
  _OtpVerifyCodeState createState() => _OtpVerifyCodeState();
}

class _OtpVerifyCodeState extends State<OtpVerifyCode> {
  int counterTime = 30;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      counterTime--;
      if (counterTime > 0) {
        setState(() {});
      }
    });
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:  Text(
            "Verify Code",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: Get.width*.05),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * .06,
            ),
            Text(
              'A Code hase been sent to',
              style: TextStyle(color: Colors.grey,fontSize: Get.width*.04),
            ),
            Text(
              '+966  555  555  555 via SMS',
              style: TextStyle(color: Colors.grey, fontSize: Get.width*.04),
            ),
            SizedBox(
              height: Get.height * .06,
            ),
            //TODO: Implement On OTP Field

            OtpTextField(
              cursorColor: Colors.transparent,
              numberOfFields: 4,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: false,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),

            SizedBox(
              height: Get.height * .04,
            ),
            Text(
              'Resend in 00:$counterTime',
              style:  TextStyle(color: Colors.grey, fontSize: Get.width*.04),
            ),
            SizedBox(
              height: Get.height * .04,
            ),
            customButton(
                onClick: () {
                  Get.to(() => const DashBoardScreen());
                },
                buttonHeight: Get.height * .068,
                buttonWidth: Get.width * .4,
                buttonWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Verify ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
