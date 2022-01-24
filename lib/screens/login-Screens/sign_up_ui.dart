import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:kashif/screens/login-Screens/otp_verify_code.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';

class SignUpUi extends StatefulWidget {
  const SignUpUi({Key? key}) : super(key: key);

  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignUpUi> {

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthProvider>(builder: (context, data, child) {
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
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * .055),
                        ),
                        SizedBox(
                          height: Get.width * .08,
                        ),
                        Text(
                          "Account Name",
                          style: TextStyle(
                              fontSize: Get.width * .04, color: Colors.grey),
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
                                data.userName = value;
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
                              hintText: "Account Name",
                              fontSize: 13),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          customInputFormField(
                            //TODO: implement on 'onChange' at MobileNumber
                            onChange: (value) {
                              data.mobileNumber = value;
                            },
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,

                            validator: (value) {
                              GetUtils.isPhoneNumber(value);
                            },
                            errorText: 'invalid mobile number',

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
                            height: Get.height * .02,
                          ),

                          //TODO: implement on 'onChange' at Email Address

                          customInputFormField(
                              onChange: (value) {
                                data.emailAddress = value;
                              },
                              errorText: 'invalid email',
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {},
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
                            keyboardType: TextInputType.text,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  data.securePassword = !data.securePassword;
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/eye.svg',
                                color:
                                data.securePassword ? Colors.grey : primaryColor,
                                width: 25.0,
                                height: 25.0,
                              ),
                            ),
                            obscure: data.securePassword,
                            onChange: (value) {
                              data.password = value;

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
                              color: primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .05,
                          ),
                          //TODO: SignUp Button

                          customButton(
                            onClick: () {
                              data.checkSignupFormValidity();
//                               /* if(formValidation.isFormOk(
//                                userName,
//                                mobileNumber,
//                                emailAddress,
//                                password,
//                             )){
//
//                               Get.to(()=>const OtpVerifyCode());
//
//                             }
//                             else{
//                               Get.defaultDialog(title: 'incorrect information');
//
//                             }
// */
//                               Get.to(() => const OtpVerifyCode());
                            },
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
                                      color: primaryColor,
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
    });
  }
}

class FormValidation {
  bool isFormOk(
    String? userName,
    String? mobileNumber,
    String? emailAddress,
    String? password,
  ) {
    if (userName != null &&
        mobileNumber != null &&
        emailAddress != null &&
        password != null) {
      if (GetUtils.isAlphabetOnly(userName) &&
          GetUtils.isEmail(emailAddress) &&
          GetUtils.isPhoneNumber(mobileNumber) &&
          GetUtils.isLengthBetween(password, 6, 20)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
