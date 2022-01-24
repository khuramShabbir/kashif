import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kashif/model_classes/getVehicleMakers.dart';
import 'package:kashif/model_classes/get_user.dart';
import 'package:kashif/model_classes/get_vehicle_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:provider/provider.dart';

import '../dashboardscreen.dart';
import '../utils.dart';

class ApiServices   {
  static const _BASE_URL = "https://test.cashif.cc/api/";
  static const _LOGIN = "login";
  static const _REGISTER = "register";
  static const _FORGOT_PASSWORD = "forgot-password";
  static const _GET_VEHICLE_SERVICES = "get_vehcile_services";
  static const _GET_VEHICLE_MAKERS = "get_vehcile_maker";
  static const _CREATE_CARD = "create_card";
  static const _CGET_USER_PERSONAL_INFO = "get_self_info";



  static final userAuthProvider =Provider.of<UserAuthProvider>(Get.context!, listen: false);
  static final dashboardProvider =Provider.of<DashboardProvider>(Get.context!, listen: false);
  static Future<dynamic> postApi(String feedURL,
      {Map<String, String>? parameters,Map<String, String>? headers}) async {

    var parse = Uri.parse(_BASE_URL + feedURL);

    http.Response response = await http.post(parse, body: parameters,headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    }

    else {
      logger.i(response.body);
    }

    return response.body;
  }

  static Future<dynamic> getApi(String feedURL,
      {Map<String, String>? headers}) async {
    var parse = Uri.parse(_BASE_URL + feedURL);

    http.Response response = await http.get(parse, headers: headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      logger.i(response.body);
    }
    return response.body;
  }

  static registerUser() async {
    Map<String, String> body = {
      "name": userAuthProvider.userName,
      "mobile": userAuthProvider.mobileNumber,
      "email": userAuthProvider.emailAddress,
      "password": userAuthProvider.password,
    };

    var value = await postApi(_REGISTER, parameters: body);

    dismissDialogue();
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        ///ok
        await storage.write(userToken, decode['access_token']);
        await storage.write(isUserLoggedIn, true);

        Get.offAll(DashBoardScreen());
      }
      else {
        showMessage(value.toString());
           }
      logger.e(value);
    } else {}
  }

  static void loginUser() async {
    Map<String, String> body = {
      // "name":userAuthProvider.userName,
      "mobile": userAuthProvider.mobileNumber,
      // "email":userAuthProvider.emailAddress,
      "password": userAuthProvider.password,
    };

    var value = await postApi(_LOGIN, parameters: body);

    dismissDialogue();
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        ///ok
        await storage.write(userToken, decode['access_token']);
        await storage.write(isUserLoggedIn, true);
        Get.offAll(DashBoardScreen());
      }
      else {
        showMessage(value.toString());
      }
      logger.e(value);
    }

    else {}
  }

  static void getVehicleMaker() async {
    // showProgrress();

    var _header={
      'Authorization': 'Bearer ${storage.read(userToken)}',
    };

    var value = await getApi(_GET_VEHICLE_MAKERS,

        headers: _header);

    dismissDialogue();
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        dashboardProvider.setVehicleMakers(true, getVehicleMakerFromJson(value.toString()));

      } else {
        showMessage(value.toString());
        showMessage("ERROR 404");
      }
      logger.e(value);
    }
  }

  static void getVehicleServices() async{
    var value = await getApi(_GET_VEHICLE_SERVICES);
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        dashboardProvider.setVehicleServices(true, getVehicleServicesFromJson(value.toString()));
      } else {
        showMessage(value.toString());
        showMessage("ERROR 404");
      }
      logger.e(value);
    }

  }

  static void createCard()async{
logger.e(storage.read(userToken));
    var headers = {
      'Authorization': 'Bearer ${storage.read(userToken)}',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('$_BASE_URL$_CREATE_CARD'));
    var splittime = dashboardProvider.getTimeSlot.split("-");
    request.body = json.encode({
      "plate_number" : "${dashboardProvider.numberPlate}",
      "plate_char" : "abc",
      "car_brand" : "${dashboardProvider.carMakeId}",
      "car_model" : "${dashboardProvider.carMakeModelId}",
      "car_year" : "${dashboardProvider.manufacturYear}",
      "transmission" : "AUTOMATIC",
      "inspection_type" : '${dashboardProvider.serviceId}',
      "start_time" : "${splittime[0].replaceAll(" ", '')}",
      "end_time" : "${splittime[1].replaceAll(" ", '')}",
      "latitude" : "${dashboardProvider.lat}",
      "longitude" : "${dashboardProvider.lng}"
    });


    logger.e(request.body);


request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    dismissDialogue();

    if (response.statusCode == 200) {
      Get.back();
      Get.back();
      Get.back();
      print(await response.stream.bytesToString());
      showMessage('Card Created Successfully');
    }
    else {
      var s = await response.stream.bytesToString();
      showMessage(s);
      // print(response.reasonPhrase);
      logger.wtf(s);
    }



  }

  static void getUserPersonalInfo() async{
    var _header={
      'Authorization': 'Bearer ${storage.read(userToken)}',
    };

    var value =await getApi(_CGET_USER_PERSONAL_INFO,headers:_header );

    userAuthProvider.setuserInfoData(true,getUserFromJson(value.toString()));


  }
    /*var splittime = dashboardProvider.getTimeSlot.split("-");
    Map<String, String> parameters={
        "plate_number" : "${dashboardProvider.numberPlate}",
        "plate_char" : "${dashboardProvider.numberPlate}",
        "car_brand" : "${dashboardProvider.carMakeId}",
        "car_model" : "${dashboardProvider.carMakeModelId}",
        "car_year" : "${dashboardProvider.manufacturYear}",
        "transmission" : "AUTOMATIC",
        "inspection_type" : '${dashboardProvider.serviceId}',
        "start_time" : "${splittime[0].replaceAll(" ", '')}",
        "end_time" : "${splittime[1].replaceAll(" ", '')}",
        "latitude" : "${dashboardProvider.lat}",
        "longitude" : "${dashboardProvider.lng}"
    };

    logger.e(parameters);
    var value =await  postApi(_CREATE_CARD,parameters: parameters,headers: {
      'Authorization': 'Bearer ${storage.read(userToken)}',
      // 'Content-Type': 'application/json',
      'Cookie': 'XSRF-TOKEN=eyJpdiI6Im5qQ3BLMDdTeGtKRTBVa3BtZGh0eXc9PSIsInZhbHVlIjoiRkx3ZkJ1Uy9IYlBYdGJiVEpHTVZnN1NMV3lCbTZJNnoreFdhZjJHc2JnWEZOZTdZcm1yTEhmcHR1QlV3cG1LNk44NlF6M1gzZHpzd2tLSGcxWjdxUTJhRVpOMTd5TzNwcWJta29wSmZWZVRQU2c1U2VUOG1sRFFXNU01VTdWd20iLCJtYWMiOiJjZGE5ZTA1ZDcxOTJhOGMxYjNkZDJkMDlmMTQ1NTc0YWFiZDAxYWNlMWNjYTlmNWU5MGQ0OWE3ZTUyOWYzYzk2IiwidGFnIjoiIn0%3D; vehiclemanagement_session=eyJpdiI6IlB1b3NucnZQd1cvN2lIdGI5ZjlDdVE9PSIsInZhbHVlIjoiREdPR0RMZjVwNGpFc01hZEcvaUQ4WkJuaUVIalZlSHl0UFpqczNRMmY0N1A5SjVCeEZJQVE0ditDNCtGZWgzYVFYMW8zdHdEVGRycUZMOW40dXpwdmtTQkxyNGltS0srUzd3OFdPWk1GWFVtamxxNHBoYkUxaDUxbEJ1N3BxKzQiLCJtYWMiOiJjYTAxNjllOWFhYTgxM2RmNDBkYzY5NzhmNTdiNWMwZTZiMjc2MGNjODllMDVmMzgxZDI0ZGI3ODkyYzE5MDAxIiwidGFnIjoiIn0%3D'
    });
    dismissDialogue;
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        showMessage(decode['message'].toString());
      } else {
        showMessage(value.toString());
        showMessage("ERROR 404");
      }
      logger.e(value);
    }

  }*/
}
