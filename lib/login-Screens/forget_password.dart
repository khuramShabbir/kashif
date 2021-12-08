import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kashif/utils.dart';

import 'otp_verify_code.dart';

class ForgetPasswordUi extends StatefulWidget {
  const ForgetPasswordUi({Key? key}) : super(key: key);

  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<ForgetPasswordUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Enter Your email address",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              height: Get.height * 0.35,
            ),
            SizedBox(
              width: Get.width,
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: Get.height * 0.09,
                        ),
                        //TODO: implement on 'onChange'
                        customInputFormField(
                            onChange: (value) {
                              logger.e(value);
                            },
                            prefixIconList: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/email.svg',
                                  color: Colors.black,
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  color: Colors.grey,
                                  width: 1.5,
                                  height: 20,
                                )
                              ],
                            ),
                            hintText: "Email address",
                            fontSize: 13),

                        SizedBox(
                          height: Get.height * .30,
                        ),

                        InkWell(
                          onTap: () {
                            Get.to(() =>const OtpVerifyCode());
                          },
                          child: customRoundButton(
                              radius: Get.width * .1,
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.15,
                  )
                ],
              ),
              height: Get.height * 0.65,
            ),
          ],
        ));
  }
}
