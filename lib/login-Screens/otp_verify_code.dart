import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/order_taking_screens/odrder_start.dart';
import 'package:kashif/utils.dart';

class OtpVerifyCode extends StatefulWidget {
  const OtpVerifyCode({Key? key}) : super(key: key);

  @override
  _OtpVerifyCodeState createState() => _OtpVerifyCodeState();
}

class _OtpVerifyCodeState extends State<OtpVerifyCode> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "Verify Code",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * .13,
          ),
          SizedBox(
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "A Code has been sent to ",
                    style: TextStyle(color: Colors.grey, fontSize: 23),
                  ),
                  const Text(
                    "+966 555 5555 5555 via SMS ",
                    style: TextStyle(color: Colors.grey, fontSize: 23),
                  ),
                  SizedBox(
                    height: Get.height * .12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * .1,
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Container(
                        width: Get.width * .1,
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Container(
                        width: Get.width * .1,
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                      Container(
                        width: Get.width * .1,
                        height: 2,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Resend in ",
                        style: TextStyle(color: Colors.grey, fontSize: 23),
                      ),
                      Text(
                        "00:30 ",
                        style: TextStyle(color: Colors.grey, fontSize: 23),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .09,
                  ),
                  customButton(
                      onClick: () {Get.to(() =>const StartYourOrder());},
                      buttonHeight: Get.height * 0.07,
                      buttonWidth: Get.width * 0.4,
                      buttonWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Verify ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 23),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          )
                        ],
                      ))
                ],
              ),
            ),
            height: Get.height * .60,
          ),
        ],
      ),
    );
  }
}
