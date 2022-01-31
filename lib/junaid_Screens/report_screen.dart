import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/model_classes/GetCardInfoByCardID.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';
import 'package:kashif/expansion_tile.dart' as exp;
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int initIndex = -1;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

}
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (BuildContext context, data, Widget? child) {
        logger.e(data.cardInfoByCardIdFromJson.data.report.carBodyChecking);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: Get.back,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset('assets/bell-ringing.svg'),
              )
            ],
            title: Text(
              "Report details",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                    child: Container(
                      width: Get.width * .9,
                      child: Row(
                        children: [
                          Text(
                            "Car Brand : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            " ${data.cardInfoByCardIdFromJson.data.card.vehicle
                                .maker.name} ${data.cardInfoByCardIdFromJson
                                .data.card.vehicle.models.name}",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/upload.png',
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/printer.png',
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: Get.width * 0.9,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width * .05,
                        ),
                        SvgPicture.asset('assets/TimeCalendar.svg'),
                        Text(
                          ' date :',
                        ),
                        Text(
                            DateFormat("yyyy-MM-dd hh:mm:ss a").format(DateTime
                                .parse(data.cardInfoByCardIdFromJson.data.card
                                .createdAt))
                        )
                      ],
                    ),
                  ),
                  data.isSingleCardLoaded
                      ? SizedBox(
                    width: Get.width * .9,
                    child: Column(
                      children: List.generate(
                        data.cardInfoByCardIdFromJson.data.report
                            .mechanicalIssue.length,
                            (index) {
                          MechanicalIssue mechanicalIssue = data
                              .cardInfoByCardIdFromJson
                              .data
                              .report
                              .mechanicalIssue[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: exp.ExpansionPanelList(
                              elevation: 0,
                              children: [
                                exp.ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return InkWell(
                                      onTap: () {
                                        if (initIndex == index) {
                                          initIndex = -1;
                                          setState(() {});
                                          return;
                                        }

                                        initIndex = index;
                                        print(index);
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 50,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(4)),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 8),
                                            Text(mechanicalIssue
                                                .menuNameAr),
                                            Expanded(child: Container()),
                                            getIssuesIFHave(
                                                mechanicalIssue)
                                                .toString()
                                                .isEmpty
                                                ? Icon(
                                              Icons.check_circle,
                                              color: Colors
                                                  .greenAccent,
                                            )
                                                : Container(
                                              decoration: BoxDecoration(
                                                  color: Color(
                                                      0xffF9B93B),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5)),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    5,
                                                    vertical:
                                                    3),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "ملاحظات",
                                                      style: TextStyle(
                                                          fontSize:
                                                          15,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      getIssuesIFHave(
                                                          mechanicalIssue),
                                                      style: TextStyle(
                                                          fontSize:
                                                          15,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )

                                            // Icon(Icons.keyboard_arrow_down_sharp)
                                          ].reversed.toList(),
                                        ),
                                      ),
                                    );
                                  },
                                  body: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: List.generate(
                                        mechanicalIssue.subIssue.length,
                                            (index) {
                                          var key = mechanicalIssue
                                              .subIssue.keys
                                              .elementAt(index);
                                          var value = mechanicalIssue
                                              .subIssue.values
                                              .elementAt(index);

                                          return Container(
                                            width: Get.width,
                                            child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          top: 5,
                                                          bottom: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .end,
                                                        children: [
                                                          Container(

                                                            decoration: BoxDecoration(
                                                                color:
                                                                value == 0
                                                                    ? Color(
                                                                    0xff4CB463)
                                                                    : Color(
                                                                    0xffF9B93B),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5)),
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 6,
                                                                  horizontal: 10),
                                                              child: Text(
                                                                value == 0
                                                                    ? "جدید"
                                                                    : "متوسط",
                                                                textAlign: TextAlign
                                                                    .right,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight: FontWeight
                                                                        .bold),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            key,
                                                            textAlign:
                                                            TextAlign
                                                                .right,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: Get.width,
                                                      height: 0.5,
                                                      color: Colors.grey,
                                                    )
                                                  ],
                                                )),
                                          );
                                          // return Text(value,textAlign: TextAlign.right,);
                                        }),
                                  ),
                                  isExpanded:
                                  initIndex == index ? true : false,
                                  canTapOnHeader: true,
                                ),
                              ],
                              dividerColor: Colors.red,
                              expansionCallback:
                                  (panelIndex, isExpanded) {},
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      : Container(),
                  carInformation(" Year: ${data.cardInfoByCardIdFromJson.data.card.vehicle.year}",
                      " Plate: ${data.cardInfoByCardIdFromJson.data.card.vehicle.plateChar}-${data.cardInfoByCardIdFromJson.data.card.vehicle.plateNumber}",Icons.calendar_today_outlined,Icons.confirmation_num),

                 carInformation(" Transmission: ${data.cardInfoByCardIdFromJson.data.card.vehicle.transmission}",
                      " Model: ${data.cardInfoByCardIdFromJson.data.card.vehicle.models.name}",Icons.engineering_outlined,Icons.model_training_outlined),

                 carInformation(" Make: ${data.cardInfoByCardIdFromJson.data.card.vehicle.maker.name}",
                      "",
                     Icons.branding_watermark_outlined,IconData(0xeef99, fontFamily: 'MaterialIcons')),


                  Container(
                    height: Get.width * 0.6,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(35),),
                    child:  WebView(
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: data.cardInfoByCardIdFromJson.data.report.carBodyChecking,
                      gestureNavigationEnabled: true,
                      onWebViewCreated: (WebViewController webViewController) {

                      },
                      onProgress: (int progress) {
                        print('WebView is loading (progress : $progress%)');
                      },
                      onPageStarted: (String url) {
                        print('Page started loading: $url');
                      },
                      onPageFinished: (String url) {
                        print('Page finished loading: $url');
                      },
                    ),
                    // child: ,
                  ),
                  SizedBox(height: 50,)


                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String getIssuesIFHave(MechanicalIssue mechanicalIssue) {
    int x = 0;
    var keys = mechanicalIssue.subIssue.keys;
    keys.forEach((element) {
      if (mechanicalIssue.subIssue[element] == 1) {
        x++;
      }
    });

    if (x > 0) {
      return x.toString();
    }
    return "";
  }


  carInformation(String title1,String title2,IconData icon1,IconData icon2) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                      Icon(icon1),
                        Expanded(child: Text(title1,)),
                    ],),
                  ),
                  Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Icon(icon2),
                      Expanded(child: Text(title2)),

                    ],),
                 )
      ],),);
  }
}
