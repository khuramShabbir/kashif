//@dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/model_classes/GetUserResponse.dart';
import 'package:kashif/model_classes/get_vehicle_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/center_inspection_ui.dart';
import 'package:kashif/screens/order_taking_screens/goolemap_for_center_inspection.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection.dart';
import 'package:kashif/screens/services/search_page.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

///
final storage = GetStorage();
final dashboardProvider =
    Provider.of<DashboardProvider>(Get.context, listen: false);
String userToken = 'USER_TOKEN';
String isUserLoggedIn = 'IS_USER_LOGGED_IN';
String COMPLETE_USER = 'COMPLETE_USER';

///
const primaryColor = Color(0xFFFF203840);
Color grey = const Color(0x0ffb8b8b);
Color yellowLight = const Color(0x0ffEDD593);
const primaryBlueColor = 0xFF304FFE;
const colorGrey = Colors.grey;
var barColor = Colors.black.withOpacity(0.2);
double progressBarPersent = 0.0; // should be > 1

var logger = Logger();

Widget lineBar({double height: 1}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: height,
        color: barColor,
      ),
    );

Widget pickupAddress(DashboardProvider data) {
  return Container(
    width: Get.width * .8,
    height: Get.height * .1,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SvgPicture.asset("assets/pin_location.svg"),
                ))),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick-up Address',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                data.address == null ? "" : data.address.addressLine,
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
        ),
        const Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'CHANGE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))),
      ],
    ),
  );
}

Widget carousalSlider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    child: CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, reason) {},
          viewportFraction: 1,
          height: Get.height * .18,
          autoPlay: false,
        ),
        items: List.generate(
            1,
            (index) => Stack(
                  children: [
                    Container(
                      width: Get.width * .9,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: yellowLight),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "08/08/2022",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Text(
                                    "%40",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.06,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Text(
                                    " خصم",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.035,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(
                                    width: 25,
                                  )

                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "للطلب من التطبيق",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.035,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
  );
}

/// Custom Button ///
///
///
///

Widget customButton(
    {var buttonWidget,
    double borderRadius = 50,
    double buttonHeight = 0.06,
    double buttonWidth = .4,
    Function onClick}) {
  return InkWell(
    onTap: () {
      onClick();
    },
    child: Container(

        /// Please Set values of height and width where`s you want hit this method
        ///   buttonHeight: Get.height * .06,
        ///   buttonWidth: Get.width * .4
        ///
        height: Get.height * buttonHeight,
        width: Get.width * buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: buttonWidget,
        )),
  );
}

/// Custom Indicator For Carousal Slider///
///
///
Widget indicator({
  double width = 10,
  double height = 10,
  var color = const Color(0xFFFEF3C7),
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      height: 10,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
    ),
  );
}

/// Custom InputForm Field ///
///
///

Widget customInputFormField({
  bool obscure = false,
  bool enable = true,
  var keyboardType,
  var onChange,
  var suffixIcon,
  var prefixIconList,
  String hintText,
  double fontSize = 16,
  var autoValidateMode,
  String errorText,
  var validator,
  TextEditingController textEditingController,
  var textColor = Colors.grey,
  bool isOutlinedBorder = false,
}) {
  return TextFormField(
    autovalidateMode: autoValidateMode,
    controller: textEditingController,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: obscure,
    enabled: enable,
    onChanged: onChange,
    decoration: InputDecoration(
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey)),
      border: isOutlinedBorder
          ? OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          : null,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      prefixIcon: prefixIconList,
      suffix: suffixIcon,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: fontSize,
        color: Colors.grey,
      ),
    ),
  );
}

Widget customDetailBar({
  double width = 400,
  double height = 20,
  double radius = 15,
  Widget children,
  String showImageAddress = "assets/ongoing.png",
  String inspectionType = 'On going inspection',
  String definitionOfService = 'Simple definition of a service',
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xFFDADDDE), Colors.white])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                width: Get.width * .18,
                height: Get.height * .08,
                child: Image.asset(
                  showImageAddress,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10),
                child: Text(
                  inspectionType,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  definitionOfService,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: const Icon(Icons.arrow_forward_outlined),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
            ),
          )
        ],
      ),
    ),
  );
}

Widget confirmedOrder({
  var textBorderColor = Colors.green,
  var textColor = Colors.green,
  var inspectionTypeText = 'Full Car Inspection',
  var checkInTypeText = 'CONFIRMED',
  var typeCode = '#00678',
  var rating = const SizedBox(),
}) {
  return SizedBox(
    width: Get.width * .9,
    height: Get.height * .1,
    child: Column(
      children: [
        Expanded(
            child: Row(
          children: [
            SizedBox(
              width: Get.width * .03,
            ),
            Text(
              inspectionTypeText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: Get.width * .2,
            ),
            Container(
              width: Get.width * .2,
              height: Get.height * .022,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: textBorderColor)),
              child: Center(
                child: Text(
                  checkInTypeText,
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              ),
            )
          ],
        )),
        Expanded(
            child: Row(
          children: [
            SizedBox(
              width: Get.width * .03,
            ),
            Text(typeCode),
            SizedBox(width: Get.width * .05),
            rating
          ],
        )),
        lineBar()
      ],
    ),
  );
}

Future bottomSheetStartOrder() {
  return Get.bottomSheet(Container(
    height: Get.height / 2,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * .03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
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
            const Text("Efhes Services",
                style: (TextStyle(fontSize: 21, fontWeight: FontWeight.bold))),
            const SizedBox()
          ],
        ),
        SizedBox(
          height: Get.height * .03,
        ),

        /// list of Services in bottomBar Sheet ///

        Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          // Get.back();
                          Get.back();
                          dashboardProvider.orderType = 1;

                          showProgress();
                          bool status = await ApiServices.getVehicleServices();
                          dismissDialogue();
                          if (status) {
                            showServiceType();
                            // vehicleServicesFromJson
                          }

                          // Get.to(const OngoingInspectionUi());
                        },
                        child: customDetailBar(
                            showImageAddress: 'assets/ongoing.png',
                            width: Get.width * .9,
                            definitionOfService: "service at your door step",
                            height: Get.height * .1),
                      ),
                      InkWell(
                        onTap: () async {
                          Get.back();
                          dashboardProvider.orderType = 2;
                          showProgress();
                          bool status = await ApiServices.getVehicleServices();
                          dismissDialogue();
                          if (status) {
                            showServiceType();
                          }
                        },
                        child: customDetailBar(
                            showImageAddress: "assets/centerInspection.png",
                            inspectionType: "Center Inspection",
                            definitionOfService: "service at our center",
                            width: Get.width * .9,
                            height: Get.height * .1),
                      )
                    ]))),
        SizedBox(
          height: Get.height * .04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "To order more than one car ?",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              " order now",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * .09,
        )
      ],
    ),
  ));
}

class Person {
  final String name, surname;
  final num age;

  Person(this.name, this.surname, this.age);
}

void showServiceType() async {
  showSearch(
    context: Get.context,
    delegate: SearchPage<SingleService>(
      items: dashboardProvider.vehicleServicesFromJson.data,
      searchLabel: 'Search here',
      suggestion: SingleChildScrollView(
        child: Column(
          children: List.generate(
              dashboardProvider.vehicleServicesFromJson.data.length,
              (index) => getSearchItem(
                  dashboardProvider.vehicleServicesFromJson.data[index])),
        ),
      ),
      failure: Center(
        child: Text('Nothing found :('),
      ),
      filter: (person) => [
        person.name,
        // person.id,
        // person.age.toString(),
      ],
      builder: (person) => getSearchItem(person),
    ),
  );
}

getSearchItem(SingleService service) {
  return InkWell(
    onTap: () {
      print(service.price);
      dashboardProvider.serviceTyoeId =
          getServiceName(dashboardProvider, service.name);
      dashboardProvider.vat_percentage =
          dashboardProvider.vehicleServicesFromJson.vat_percentage.toString();
      dashboardProvider.vatValue = service.vat_value.toString();

      Get.back();
      Get.to(() => const OngoingInspectionUi());
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: primaryColor, width: 0.5))),
        child: ListTile(
          title: Text(service.name),
          subtitle: Text("${service.price.toString()}"),
          trailing: Text('${service.detailsService}'),
        ),
      ),
    ),
  );
}

String getServiceName(DashboardProvider data, String name) {
  String id = '';
  for (int i = 0; i < data.vehicleServicesFromJson.data.length; i++) {
    if (data.vehicleServicesFromJson.data[i].name.toLowerCase() ==
        name.toLowerCase()) {
      id = data.vehicleServicesFromJson.data[i].id.toString();
    }
  }
  return id;
}

StringPicture carDoor = 'assets/CarDoor.png' as StringPicture;

bool value = true;

Widget customCarCardView() {
  return Stack(
    children: [
      Center(
        child: Container(
          height: Get.height * .2,
          width: Get.width * .8,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(-3, 3),
                blurRadius: 5),
          ]),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Ford Crown Victoria',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'AAA - 0000',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                const Text('******879CG'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width: Get.width * .18,
                                    height: Get.height * .022,
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(.15),
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.green)),
                                    child: const Center(
                                      child: Text(
                                        "CONFIRMED",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.withOpacity(.3))),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Center(
                                    child: Text(
                              're-application',
                              style: TextStyle(
                                  color: Color(primaryBlueColor),
                                  fontWeight: FontWeight.bold),
                            ))),
                            Container(color: Colors.grey, width: 1),
                            const Expanded(
                                child: Center(
                                    child: Text(
                              'Service report',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/car_model.png',
            height: Get.width * .3,
            width: Get.width * .4,
          ))
    ],
  );
}

Widget appBar(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
    child: Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        Expanded(child: Container()),
        InkWell(onTap: () {}, child: SvgPicture.asset("assets/BellIcon.svg")),
      ],
    ),
  );
}

Widget carBrand(String carName) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22.0),
    child: Row(
      children: [
        const Text(
          'Car brand :',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(carName),
        Expanded(child: Container()),
        SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              "assets/upload.png",
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 8,
        ),
        Image.asset("assets/printer.png")
      ],
    ),
  );
}

Widget carReports(String text1, String text2, String text3, String text4) {
  bool internalOrder = true;
  bool seatsDirty = false;

  return Column(
    children: [
      Row(
        children: [
          internalOrder
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.greenAccent,
                )
              : const Icon(
                  Icons.info_outline,
                  color: Colors.redAccent,
                ),
          const SizedBox(width: 8),
          internalOrder
              ? Text(
                  text1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      text2,
                      style: const TextStyle(color: Colors.redAccent),
                    )
                  ],
                )
        ],
      ),
      Row(
        children: [
          seatsDirty
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.greenAccent,
                )
              : const Icon(
                  Icons.info_outline,
                  color: Colors.redAccent,
                ),
          const SizedBox(width: 8),
          seatsDirty
              ? Text(
                  text3,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text3,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      text4,
                      style: const TextStyle(color: Colors.redAccent),
                    )
                  ],
                )
        ],
      ),
    ],
  );
}

showMessage(
  String data, {
  double fontsize = 16.0,
}) {
  Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: fontsize);
}

showProgress({bool isdimissnable = true}) {
  Get.dialog(const Center(child: CircularProgressIndicator()),
      barrierDismissible: isdimissnable);
}

dismissDialogue() {
  if (Get.isDialogOpen) {
    Get.back();
  }
}

GetUserResponse getUser() =>
    getUserResponseFromJson(storage.read(COMPLETE_USER));
