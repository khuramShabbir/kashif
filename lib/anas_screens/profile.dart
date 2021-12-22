import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kashif/utils.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileDetail(),
                    profileDetail(
                        svgImageAddress: 'assets/phone (Stroke).svg',
                        labelText: 'Phone number',
                        text: '+966 000 000 000'),
                    profileDetail(
                        svgImageAddress: 'assets/Message.svg',
                        labelText: "phone number",
                        text: 'alkayali@dr.com'),
                    profileDetail(
                        svgImageAddress: 'assets/Location.svg',
                        labelText: 'Magic coffee store address',
                        text: 'Bradford BD1 1PR'),
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
                          onClick: () {},
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
              ],
            ),
          )),
    );
  }
}

Widget profileDetail({
  String svgImageAddress = "assets/user.svg",
  String labelText = 'Name',
  String text = 'Khaled al-Kayali',
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


