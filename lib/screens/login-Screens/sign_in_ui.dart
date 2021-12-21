import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kashif/screens/login-Screens/sign_up_ui.dart';

import 'package:kashif/utils.dart';

import 'forget_password.dart';
import 'otp_verify_code.dart';

class SignInUI extends StatefulWidget {
  const SignInUI({Key? key}) : super(key: key);

  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  bool isTrue = false;
  var userName;
  var password;

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
                        "Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "What's Your Number?",
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
                      children: [
                        SizedBox(
                          height: Get.height * 0.09,
                        ),
                        //TODO: implement on onChange'
                        customInputFormField(
                            onChange: (value) {
                              userName = value;
                              logger.e(userName);
                            },
                            prefixIconList: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/user_outline.svg',
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
                            hintText: "Create an account here",
                            fontSize: 13),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        customInputFormField(
                          //TODO: implement on 'onChange'
                          onChange: (value) {
                            password = value;

                            logger.e(value);
                          },
                          keyboardType: TextInputType.phone,
                          prefixIconList: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/smartphone.svg',
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
                          hintText: "Mobile Number",
                          fontSize: 13,
                        ),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ForgetPasswordUi());
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        customButton(
                          onClick: () {
                           /* if (userName != null && password != null) {
                              Get.to(() => const OtpVerifyCode());
                            } else {
                              Get.defaultDialog(
                                  title: 'Please Provide Your account detail',
                                  titleStyle: const TextStyle(color: Colors.red),
                                  middleText: "Demo mode !",
                                  middleTextStyle: const TextStyle(
                                      color: Colors.brown, fontSize: 20));
                            }*/

                            Get.to(() => const OtpVerifyCode());


                          },
                          buttonWidth: Get.width * .3,
                          buttonHeight: Get.height * .055,
                          buttonWidget: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'New member ?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const SignUpUi());
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
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

