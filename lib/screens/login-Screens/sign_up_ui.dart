import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/screens/login-Screens/otp_verify_code.dart';
import 'package:kashif/utils.dart';



class SignUpUi extends StatefulWidget {
  const SignUpUi({Key? key}) : super(key: key);

  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignUpUi> {
  var formValidation = FormValidation();
  bool securePassword = true;
  bool isNotValid = true;
  var userName;
  var mobileNumber;
  var emailAddress;
  var password;
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
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
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
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Create an account here",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              height: Get.height * 0.15,
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
                          height: Get.height * 0.05,
                        ),
                        //TODO: implement on 'onChange' at userName
                        customInputFormField(
                            onChange: (value) {
                              userName=value;


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
                          height: Get.height * .02,
                        ),
                        customInputFormField(
                          //TODO: implement on 'onChange' at MobileNumber
                          onChange: (value) {
                            mobileNumber=value;
                            },
                          autoValidateMode: AutovalidateMode.onUserInteraction,

                          validator: (value) {
                            GetUtils.isPhoneNumber(value);
                          },
                  errorText: 'invalid mobile number',

                          keyboardType: TextInputType.number,
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
                          height: Get.height * .02,
                        ),

                        //TODO: implement on 'onChange' at Email Address

                        customInputFormField(
                            onChange: (value) {
                              emailAddress=value;


                            },
                            errorText: 'invalid email',

                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {



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
                          height: Get.height * .02,
                        ),

                        //TODO: implement on 'onChange' at Password

                        customInputFormField(
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                securePassword = !securePassword;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/eye.svg',
                              color:
                                  securePassword ? Colors.black : Colors.blue,
                              width: 25.0,
                              height: 25.0,
                            ),
                          ),
                          obscure: securePassword,
                          onChange: (value) {
                            password=value;
                            logger.e(value);
                          },
                          prefixIconList: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/lock.svg',
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
                          hintText: "Password",
                          fontSize: 13,
                        ),

                        SizedBox(
                          height: Get.height * .05,
                        ),
                        const Text(
                          "By signing up you agree with our Terms of Use",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        //TODO: SignUp Button

                        customButton(
                          onClick: () {
                            if(formValidation.isFormOk(
                               userName,
                               mobileNumber,
                               emailAddress,
                               password,
                            )){

                              Get.to(()=>const OtpVerifyCode());

                            }
                            else{
                              Get.defaultDialog(title: 'incorrect information');

                            }




                          },
                          buttonHeight: Get.height * .055,
                          buttonWidth: Get.width * .3,
                          buttonWidget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Sign up ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                              'Already a member ?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                'Sign in',
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


class FormValidation {
  bool isFormOk(
    String? userName,
    String? mobileNumber,
    String? emailAddress,
    String? password,
  ) {
    if (userName!=null && mobileNumber!=null && emailAddress!=null && password != null)
    {
      if (GetUtils.isAlphabetOnly(userName) &&
          GetUtils.isEmail(emailAddress) &&
          GetUtils.isPhoneNumber(mobileNumber) &&
          GetUtils.isLengthBetween(password, 6, 20)) {
        return true;
      }
      else{
        return false;
      }

    }

    else {
      return false;
    }
  }
}