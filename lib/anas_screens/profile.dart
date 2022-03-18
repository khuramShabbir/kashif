import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kashif/screens/boarding/dashboardscreen.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:kashif/screens/login-Screens/sign_in_ui.dart';
import 'package:kashif/screens/splash_screen/splash_screen.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';
import 'payment.dart';
import 'support.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthProvider>(builder: (build,data,child){
      return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: null,
              actions: [Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset('assets/bell-ringing.svg'),
              )
              ],
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * .07,
                  ),
                 data.isUserLoaded ?
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profileDetail(text: '${data.userFromJson!.data[0].name}'),
                      profileDetail(
                          svgImageAddress: 'assets/phone (Stroke).svg',
                          labelText: 'Phone number',
                          text: '${data.userFromJson!.data[0].mobile}'),
                      profileDetail(
                          svgImageAddress: 'assets/Message.svg',
                          labelText: "phone number",
                          text: '${data.userFromJson!.data[0].email}'),
                      profileDetail(
                          svgImageAddress: 'assets/Location.svg',
                          labelText: 'Address',
                          text: 'Required'),
                      InkWell(
                        onTap: () {
                          Get.to(() => const PaymentMethod());
                        },
                        child: paymentMethodAndHelp(
                          svgImageAddress: 'assets/Work.svg',
                          text: "Payment method",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const Support());
                        },
                        child: paymentMethodAndHelp(
                          svgImageAddress: 'assets/Chat.svg',
                          text: 'Help',
                        ),
                      ),
                      const Expanded(child: SizedBox(child: SizedBox())),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: customButton(
                            onClick: () async{

                              await storage.erase();
                              Get.offAll(SignInUI());
                            },
                            buttonWidget: const Center(
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(color: Colors.white),
                                )),

                            borderRadius: 18),
                      ),
                      const Expanded(
                        child: SizedBox(child: SizedBox()),
                      )
                    ],
                  )
                     : Center(child: CircularProgressIndicator(),)
                ],
              ),
            )),
      );
    },);
  }
}

Widget profileDetail({
  String svgImageAddress = "assets/user.svg",
  String labelText = 'Name',
  String text = '',
}) {
  return SizedBox(
    width: Get.width * .9,
    height: Get.height * .08,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(svgImageAddress),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  labelText,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
              Text(
                text,
                style: const TextStyle(),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: SvgPicture.asset('assets/Edit.svg'),
        )
      ],
    ),
  );
}

Widget paymentMethodAndHelp({
  String svgImageAddress = "assets/user.svg",
  String text = 'Name',
}) {
  return SizedBox(
    width: Get.width * .9,
    height: Get.height * .08,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(svgImageAddress),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  text,
                  style: const TextStyle(),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: SvgPicture.asset('assets/Edit.svg'),
        )
      ],
    ),
  );
}


