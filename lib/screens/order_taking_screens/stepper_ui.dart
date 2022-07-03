//@dart=2.9

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/main.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:top_sheet/top_sheet.dart';
import '../../utils.dart';
import 'order_ended.dart';
import 'stepper.dart' as stepper;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:map_launcher/map_launcher.dart';

class StepperUi extends StatefulWidget {
  int cardId;

  StepperUi({Key key, this.cardId}) : super(key: key);

  @override
  _StepperUiState createState() => _StepperUiState();
}

class _StepperUiState extends State<StepperUi> {
  var dashboardProvider =Provider.of<DashboardProvider>(Get.context, listen: false);

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      dashboardProvider.setCardInformation(null, false);
      ApiServices.getCardInfoByCardId(widget.cardId);
    });
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    dashboardProvider.setCardInformation(null, false);
    ApiServices.getCardInfoByCardId(widget.cardId);

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (builder, data, child) {
      showPopupToNotifyUser(data);
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: [
              InkWell(
                onTap: (){
                  _showPopupCamera(data);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.camera_alt_outlined,color: primaryColor,),
                ),
              )
            ],
            title: LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: Get.width * .6,
              lineHeight: 10.0,
              percent: progressBarPersent = 0.8,
              backgroundColor: Colors.grey.withOpacity(.5),
              progressColor: Colors.black,
              padding: const EdgeInsets.all(0),
            ),
          ),
          body: data.isSingleCardLoaded
              ? SizedBox(
                width: Get.width,
                height: Get.height,
                child: SmartRefresher(
                  enablePullDown: true,
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Get.height * .03,
                              ),
                              SizedBox(
                                height: Get.height * .25,
                                width: Get.width * .9,
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            data.cardInfoByCardIdFromJson.data
                                                    .card.vehicle.maker.name +
                                                " " +
                                                data
                                                    .cardInfoByCardIdFromJson
                                                    .data
                                                    .card
                                                    .vehicle
                                                    .models
                                                    .name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                "#" +
                                                    data.cardInfoByCardIdFromJson
                                                        .data.card.id
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey
                                                        .withOpacity(.5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            '${data.cardInfoByCardIdFromJson.data.card.vehicle.plateChar} - ${data.cardInfoByCardIdFromJson.data.card.vehicle.plateNumber}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Text(
                                          'DATE',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          DateFormat('yyyy-MM-dd')
                                              .parse(data
                                                  .cardInfoByCardIdFromJson
                                                  .data
                                                  .card
                                                  .createdAt)
                                              .toString()
                                              .replaceAll("00:00:00.000", ''),
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            'assets/svg/sedan_car.png',
                                            height: Get.height * 0.09,
                                          ),

                                          Text(
                                            "${data.cardInfoByCardIdFromJson.data.card.startTime} - ${data.cardInfoByCardIdFromJson.data.card.endTime}",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                          SizedBox(height: Get.height * 0.01,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              FloatingActionButton(
                                heroTag:
                                    '${data.cardInfoByCardIdFromJson.data.card.id}',
                                backgroundColor: primaryColor,
                                onPressed: () {
                                  Uint8List _bytes = Base64Decoder().convert(
                                      data.cardInfoByCardIdFromJson.data.card
                                          .qr_code
                                          .replaceAll(
                                              "data:image/png;base64,", ""));
                                  Get.dialog(Center(
                                      child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Image.memory(_bytes),
                                          ))));
                                },
                                child: SvgPicture.asset('assets/svg/Qr.svg'),
                              ),
                              Container(
                                width: Get.width,
                                child: stepper.Stepper(
                                  physics: NeverScrollableScrollPhysics(),
                                  steps: [
                                    stepper.Step(
                                        state: data
                                                    .cardInfoByCardIdFromJson
                                                    .data
                                                    .card
                                                    .inspectionStart !=
                                                null
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text(
                                          "The Vehicle Arrived at the center\n${data.cardInfoByCardIdFromJson.data.card.inspectionStart??""}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey),
                                        ),
                                        content:

                                        Row(
                                          children: [

                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  "",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            )
                                          ],
                                        )

                                    ),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    0
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Mechanical Issues"),
                                        content: Text('')),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    2
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title:
                                            Text("Tympanic Indicator checking"),
                                        content: Text("")),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    3
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Tires checking"),
                                        content: Text("")),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    4
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Sensors checking"),
                                        content: Text("")),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    5
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Body checking"),
                                        content: Text("")),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    6
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Road Testing"),
                                        content: Text("")),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                int.parse(data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .card_step
                                                        .toString()) >
                                                    7
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Attaching Pictures"),
                                        content: Text("")),
                                    stepper.Step(
                                        state: data.cardInfoByCardIdFromJson
                                                        .data.report !=
                                                    null &&
                                                data.cardInfoByCardIdFromJson
                                                        .data.card.card_step !=
                                                    null &&
                                                data
                                                        .cardInfoByCardIdFromJson
                                                        .data
                                                        .card
                                                        .inspectionEnd !=
                                                    null
                                            ? stepper.StepState.complete
                                            : stepper.StepState.indexed,
                                        title: Text("Inspection Completed"),
                                        content: Text("")),
                                  ],
                                ),
                              ),
                              data.cardInfoByCardIdFromJson.data.report != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: customButton(
                                          onClick: () {
                                            //
                                            //
                                            // if(data.cardInfoByCardIdFromJson.data.card.rating==null){
                                            //
                                            //   Get.dialog(Container(
                                            //
                                            //     height: Get.height,
                                            //     width: Get.width,
                                            //     color: Colors.white.withOpacity(0.5),
                                            //     child: Center(child: Container(
                                            //
                                            //       ),),
                                            //
                                            //   ));
                                            //
                                            // }
                                            // else{
                                            Get.to(() => OrderEnded());
                                            // }

                                            /*    TopSheet.show(
                                    context: context,
                                    direction: TopSheetDirection.TOP,
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                      title: LinearPercentIndicator(
                                        alignment: MainAxisAlignment.center,
                                        width: Get.width * .6,
                                        lineHeight: 10.0,
                                        percent: progressBarPersent = .7,
                                        backgroundColor: Colors.white.withOpacity(.5),
                                        progressColor: Colors.black,
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      trailing: SvgPicture.asset('assets/menu.svg'),
                                      subtitle: Container(
                                        height: Get.height * .4,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20))),
                                      ),
                                    ));*/
                                          },
                                          buttonWidget: Center(
                                              child: Text(
                                            "Next",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ))),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
              )
              : Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }

  showMap(lat, lng, {String title: ""}) async {
    MapType mapType = MapType.google;
    if (isAndroid()) {
      mapType = MapType.google;
    } else {
      mapType = MapType.apple;
    }
    if (await MapLauncher.isMapAvailable(mapType)) {
      await MapLauncher.showMarker(
        mapType: mapType,
        coords: Coords(lat, lng),
        title: title,
        description: 'see on map',
      );
    }
  }

  void showPopupToNotifyUser(DashboardProvider data) async {
    await Future.delayed(Duration.zero);

    if (data.isSingleCardLoaded) {
      if (data.cardInfoByCardIdFromJson.data.card.inspectionStart == null &&
          data.cardInfoByCardIdFromJson.data.card.inspectionType
              .contains('2')) {
        while (Get.isBottomSheetOpen) {
          Get.back();
        }

        Get.bottomSheet(Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Card Created",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Congratulations, you can now go directly within the time you selected to the inspection center.",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                customButton(
                    onClick: () {
                      Get.back();
                      logger.e(data.cardInfoByCardIdFromJson.data.card.latitude+"\n"+data.cardInfoByCardIdFromJson.data.card.longitude);
                      var latitude = double.parse(data.cardInfoByCardIdFromJson.data.card.latitude??"0");
                      var longitude = double.parse(data.cardInfoByCardIdFromJson.data.card.longitude??"0");
                      showMap(latitude, longitude, title: "Cashif");
                    },
                    buttonWidget: Center(
                        child: Text(
                      "Navigate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))),
                SizedBox(height: 25),
              ],
            ),
          ),
        ));
      }
    }
  }
  void _showPopupCamera(DashboardProvider data) async {
    await Future.delayed(Duration.zero);


        while (Get.isBottomSheetOpen) {
          Get.back();
        }

        Get.bottomSheet(Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Live Camera".tr,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "The live camera service will be available so soon",
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                customButton(
                    onClick: () {
                      Get.back();
                    },
                    buttonWidget: Center(
                        child: Text(
                      "OK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))),
                SizedBox(height: 25),
              ],
            ),
          ),
        ));

  }
}

extension Target on Object {
  bool isAndroid() {
    return Platform.isAndroid;
  }

  bool isIOS() {
    return Platform.isIOS;
  }

  bool isLinux() {
    return Platform.isLinux;
  }

  bool isWindows() {
    return Platform.isWindows;
  }

  bool isMacOS() {
    return Platform.isMacOS;
  }

  bool isWeb() {
    return kIsWeb;
  }
// ···
}
