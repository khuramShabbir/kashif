import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';

import '../boarding/dashboardscreen.dart';

class OtpVerifyCode extends StatefulWidget {
 bool isFromLogin;
  OtpVerifyCode({this.isFromLogin:false});

  @override
  _OtpVerifyCodeState createState() => _OtpVerifyCodeState();
}

class _OtpVerifyCodeState extends State<OtpVerifyCode> {
  int counterTime = 30;
  @override
  void initState() {
    var provider=Provider.of<UserAuthProvider>(Get.context!,listen: false);


    provider.sendOTP();
    Future.delayed(Duration(seconds: 0),(){
      showProgress();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      if (counterTime > 0) {
        counterTime--;
        setState(() {});
      }
    });
    return Consumer<UserAuthProvider>(builder: (build,data,child){return Scaffold(
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
              '${data.mobileNumber} via SMS',
              style: TextStyle(color: Colors.grey, fontSize: Get.width*.04),
            ),
            SizedBox(
              height: Get.height * .06,
            ),
            //TODO: Implement On OTP Field

            OtpTextField(
              cursorColor: Colors.transparent,
              numberOfFields: 6,
              borderColor: const Color(0xFF512DA8),
              showFieldAsBox: false,

              onCodeChanged: (String code) {

                // print(data.inputCode);

              },
              onSubmit: (String verificationCode) {

                data.verifyOTP(verificationCode,widget.isFromLogin);

                logger.wtf(verificationCode);
              }, // end onSubmit
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
                  // data.verifyOTP(verificationCode);

                  // Get.to(() => const DashBoardScreen());
                },

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
        ));});
  }
}
