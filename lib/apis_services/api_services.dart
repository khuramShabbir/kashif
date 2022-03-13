import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kashif/model_classes/GetAllRecords.dart';
import 'package:kashif/model_classes/GetCardInfoByCardID.dart';
import 'package:kashif/model_classes/GetCustomerVehicle.dart';
import 'package:kashif/model_classes/GetLifters.dart';
import 'package:kashif/model_classes/getCardsListByVehicleId.dart';
import 'package:kashif/model_classes/getVehicleMakers.dart';
import 'package:kashif/model_classes/get_user.dart';
import 'package:kashif/model_classes/get_vehicle_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:kashif/screens/order_taking_screens/stepper_ui.dart';
import 'package:provider/provider.dart';

import '../dashboardscreen.dart';
import '../utils.dart';

class ApiServices   {
  static const _BASE_URL = "https://test.cashif.cc/api/";
  static const _LOGIN = "login";
  static const _GET_CARD_INFO = "get_card_info";
  static const _REGISTER = "register";
  static const _FORGOT_PASSWORD = "forgot-password";
  static const _GET_VEHICLE_SERVICES = "get_vehcile_services";
  static const _GET_VEHICLE_MAKERS = "get_vehcile_maker";
  static const _CREATE_CARD = "create_card";
  static const _GET_USER_PERSONAL_INFO = "get_self_info";
  static const _GET_LIFTERS = "get_lifters";
  static const _GET_All_CARD_RECORD = "get_inspection_record";
  static const _GET_Re_APPLICATION = "re_application";
  static const _GET_CUSUTOMER_VEHICLE= "customer_vehicles";
  static const _GET_CARDSLIST_BY_VEHICLE_ID= "vehicle_cards";

  static _getHeaders(){
    return {
      'Authorization': 'Bearer ${storage.read(userToken)}',
      'Content-Type': 'application/json'
    };
  }


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
      logger.i(response.body);

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
      logger.e(value);
      showMessage(json.decode(value.toString())['error']['message'].toString());
      }
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
        showMessage(json.decode(value.toString())['error']['message'].toString());
      }
      logger.e(value);
    }

  }

  static void getVehicleMaker() async {
    // showProgrress();




    var value = await getApi(_GET_VEHICLE_MAKERS,

        headers: _getHeaders());

    dismissDialogue();
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        dashboardProvider.setVehicleMakers(true, getVehicleMakerFromJson(value.toString()));

      } else {
        showMessage(value.toString());
        showMessage("ERROR 404");
      }
    }
  }

  static Future<bool> getVehicleServices() async{
    var value = await getApi(_GET_VEHICLE_SERVICES);
    if (value != null) {
      var decode = json.decode(value);
      if (decode['success'].toString().contains('1')) {
        dashboardProvider.setVehicleServices(true, getVehicleServicesFromJson(value.toString()));
        return true;
      } else {
        showMessage(value.toString());
        showMessage("ERROR 404");
        return false;

      }
      logger.e(value);
    }
    return false;

  }

  static void createCard()async{

    // logger.e(storage.read(userToken));


    var request = http.Request('POST', Uri.parse('$_BASE_URL$_CREATE_CARD'));
    var splittime = dashboardProvider.getTimeSlot.split("-");
    request.body = json.encode({
      "plate_number" : "${dashboardProvider.numberPlateDigits}",
      "plate_char" : "${dashboardProvider.numberPlateEnglish}",
      "car_brand" : "${dashboardProvider.carMakeId}",
      "car_model" : "${dashboardProvider.carMakeModelId}",
      "car_year" : "${dashboardProvider.manufacturYear}",
      "transmission" : "AUTOMATIC",
      "inspection_type" : '${dashboardProvider.orderType}',
      "service_type" : '${dashboardProvider.serviceTyoeId}',
      "start_time" : "${splittime[0].replaceAll(" ", '')}",
      "end_time" : "${splittime[1].replaceAll(" ", '')}",
      "latitude" : "${dashboardProvider.lat}",
      "longitude" : "${dashboardProvider.lng}",
      // "lifter_no" : "${dashboardProvider.carLifterId==-1? 1 :dashboardProvider.carLifterId}",
      "payment_method" : "CASH"
      ///it can be two types one is CASH and second is CREDIT_VISA_MASTER
      // "payment_method" : "CREDIT_VISA_MASTER"
    });


    logger.e(request.body);


    request.headers.addAll(_getHeaders());

    http.StreamedResponse response = await request.send();
    dismissDialogue();

    if (response.statusCode == 200) {
      Get.back();
      Get.back();
      if(dashboardProvider.carLifterIndex>-1){
        logger.i("message");
      Get.back();
      }

      var body = await response.stream.bytesToString();
      logger.i(body);
      showMessage('Card Created Successfully');
      showProgress();
      var decoded = json.decode(body.toString());
      int cardId = decoded['data']['id'];
      dismissDialogue();
      logger.wtf(cardId);
      showInvoice(body.toString());



      dashboardProvider.resetOrderVaribales();


    }
    else {
      var s = await response.stream.bytesToString();
      showMessage(s);
      // print(response.reasonPhrase);
      logger.wtf(s);
    }



  }

 static showInvoice(decoded){


   Get.to(() => StepperUi(cardId:cardId));

 }

  static void getUserPersonalInfo() async{


    var value =await getApi(_GET_USER_PERSONAL_INFO,headers:_getHeaders() );

    userAuthProvider.setuserInfoData(true,getUserFromJson(value.toString()));


  }

  static Future<bool> getCardInfoByCardId(int cardId) async {


    var request = http.Request('GET', Uri.parse(_BASE_URL + _GET_CARD_INFO));
    request.body = json.encode({
      "card_id": "$cardId"

      // "card_id": "67163"
    });
    request.headers.addAll(_getHeaders());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var body = await response.stream.bytesToString();
      logger.d("bodybodybody $body");
      dashboardProvider.setCardInformation(getCardInfoByCardIdFromJson(body.toString()),true);
      return true;
    }
    else {
      var s = await response.stream.bytesToString();
      showMessage(s);
      logger.wtf(s);
      return false;

    }

    return true;


  }

  static void getLifters() async {

   var body = await getApi(_GET_LIFTERS,headers: _getHeaders());

   logger.e(body);
   GetLifters liftersFromJson = getLiftersFromJson(body);
   dashboardProvider.setLifterData(true,liftersFromJson);




  }

  static Future<void> getAllCardsRecord()async {
    var body = await getApi(_GET_All_CARD_RECORD,headers: _getHeaders());
    dashboardProvider.setAllCardRecords(true,getAllRecordsFromJson(body));
    logger.e("getAllCardsRecord $body");

  }

  static Future<void> reApplication(int card_id)async {
logger.e(card_id);



   showProgress();

    var request = http.Request('GET', Uri.parse(_BASE_URL+_GET_Re_APPLICATION));

    request.body = json.encode({
      "card_id": card_id
    });

    request.headers.addAll(_getHeaders());

    logger.i(request.headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var body = await response.stream.bytesToString();

      await getAllCardsRecord();
      logger.e("reApplication $body");
      showMessage("New Card Created");

    }

    else {
      await getAllCardsRecord();

      print(response.reasonPhrase);
      print(await response.stream.bytesToString());
    }

    dismissDialogue();


  }

  static Future<void> getCustomerAllVehicles()async {
      dashboardProvider.setCustomerVehicles(getCustomerVehicleFromJson(await getApi(_GET_CUSUTOMER_VEHICLE,headers: _getHeaders())),true);
  }

  static Future<void> getCardsListByVehicleId(int vehicleId) async{

    var request = http.Request('GET', Uri.parse("$_BASE_URL$_GET_CARDSLIST_BY_VEHICLE_ID"));
    request.body = json.encode({
      "vehicle_id": vehicleId
    });
    request.headers.addAll(_getHeaders());

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var body = await response.stream.bytesToString();

      dashboardProvider.setCardsListByVehicleId(getCardsListByVehicleIdFromJson(body),true);



    }
    else {

            print(response.reasonPhrase);
            print(await response.stream.bytesToString());
    }



  }

}


final dashboardProvider =Provider.of<DashboardProvider>(Get.context!, listen: false);
