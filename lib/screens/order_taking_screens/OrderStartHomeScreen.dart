import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';
import 'link_ui.dart';

class OrderStartHomeScreen extends StatefulWidget {
  const OrderStartHomeScreen({Key? key}) : super(key: key);

  @override
  _OrderStartHomeScreenState createState() => _OrderStartHomeScreenState();
}

class _OrderStartHomeScreenState extends State<OrderStartHomeScreen> {
  // bool isTaped = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiServices.getUserPersonalInfo();
  }
final dashboardProvider= Provider.of<DashboardProvider>(Get.context!,listen: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => const LinkUi());
                },
                child: SvgPicture.asset(
                  'assets/menu.svg',
                  color: Colors.black,
                  width: 25.0,
                  height: 25.0,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * .06,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Consumer<UserAuthProvider>(
                      builder: (build, data, child) {
                        return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            !data.isUserLoaded
                                ? ""
                                : data.userFromJson!.data[0].name,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            lineBar(height: 0.5),
            carousalSlider(),
            lineBar(height: 0.5),
            SizedBox(
              height: Get.height * .04,
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.receipt_long,color: primaryColor,size: 55,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Select the service you need",style: TextStyle(color: primaryColor),),
                      SizedBox(height: 8,),
                      Text("Order Now",style: TextStyle(color: primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),

                    ],)
                  ],
                ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width *0.08,vertical: Get.width*0.05),
                    child: InkWell(
                      onTap: () async {
                        dashboardProvider.orderType=1;


                        showProgress();
                        bool status=await ApiServices.getVehicleServices();
                        dismissDialogue();
                        if(status){
                          showServiceType();
                          // vehicleServicesFromJson
                        }


                      },
                      child: Container(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text("Center Inspection Order",style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,fontSize: 17),),
                          SizedBox(width: 10,),
                              Icon(Icons.receipt_long,color: primaryColor,),

                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: primaryColor)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width *0.08,vertical: Get.width*0.05),
                    child: InkWell(
                      onTap: () async {
                        dashboardProvider.orderType=2;
                        showProgress();
                        bool status=await ApiServices.getVehicleServices();
                        dismissDialogue();
                        if(status){
                          showServiceType();
                        }
                      },
                      child: Container(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "On going Inspection Order",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.receipt_long,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: primaryColor)
                        ),
                      ),
                    ),
                  ),





                ],
              ),
            )

                /*Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * .1,
                ),
                InkWell(
                  onTap: () {
                    isTaped = !isTaped;
                    setState(() {});
                  },
                  child: isTaped
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'cash-back SR 100',
                              style: TextStyle(fontSize: 12),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Your Next Order',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * .02,
                            ),
                            SizedBox(
                              width: Get.width * .8,
                              height: Get.height * .25,
                              child: Stack(
                                children: [
                                  SizedBox(
                                      width: Get.width * .6,
                                      height: Get.height * .28,
                                      child: Image.asset(
                                        'assets/SeekPng 1.png',
                                        width: Get.width * .6,
                                        height: Get.height * .28,
                                      )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: Get.width * .45,
                                      height: Get.height * 0.07,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              Color(0xFFDADDDE),
                                              Colors.transparent
                                            ]),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 10.0, bottom: 10),
                                          child: InkWell(
                                            onTap: () {
                                              bottomSheetStartOrder();
                                            },
                                            child: Container(
                                              child: const Center(
                                                  child: Text("Order Now")),
                                              width: Get.width * .27,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                confirmedOrder(
                                    rating: Row(
                                  children: List.generate(
                                      4,
                                      (index) => SvgPicture.asset(
                                            'assets/star.svg',
                                            height: 12,
                                          )),
                                )),
                                confirmedOrder(
                                  textColor: Colors.red,
                                  textBorderColor: Colors.red,
                                  checkInTypeText: "ON GOING",
                                ),
                              ],
                            ),
                          ],
                        ),
                )
              ],
            )*/
                )
          ],
        ));
  }
}
