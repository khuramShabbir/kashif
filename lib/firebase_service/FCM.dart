//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/stepper_ui.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {



}


class FCM {
  FirebaseMessaging _messaging= FirebaseMessaging.instance;



  FCM() {
    try{

      Firebase.initializeApp().then((fbr)async {
        await _messaging.subscribeToTopic("AllUsers").then((value) => null);
        await FirebaseMessaging.instance.subscribeToTopic(getUser().user.id.toString());

        FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
        NotificationSettings settings = await _messaging.requestPermission(
          alert: true,
          badge: true,
          provisional: false,
          sound: true,
        );


        if (settings.authorizationStatus == AuthorizationStatus.authorized) {

          await Firebase.initializeApp();

          FirebaseMessaging.onMessageOpenedApp.listen((event) {
            _openScreenForNotifications(event.data);
          });
          FirebaseMessaging.onMessage.listen((event) {
            listenForgroundFcm(event);
            _openScreenForNotifications(event.data,isOpenScreenRequired: false);
          });
        }
      });
    }
    catch(e){
      logger.e(e);
    }
  }









}


_openScreenForNotifications(Map<String, dynamic> payload,{bool isOpenScreenRequired=true}) {

  logger.e(payload);
  if(payload==null) return;
  if(payload['type'].toString().contains("card_updated")){

    if(Get.currentRoute.toString().contains("StepperUi")){
      Future.delayed(Duration.zero, () {
        var dashboardProvider =Provider.of<DashboardProvider>(Get.context, listen: false);

        dashboardProvider.setCardInformation(null, false);
        ApiServices.getCardInfoByCardId(int.parse(payload['table_id'].toString()));
      });
    }
    else{
    if(isOpenScreenRequired){
      Get.to(()=> StepperUi(cardId: int.parse(payload['table_id'].toString())));
    }
    }



  }


}


void listenForgroundFcm(RemoteMessage event) async{

  // logger.e(event.data);

  var dashboardProvider;
  if(Get.context!=null){
    dashboardProvider= Provider.of<DashboardProvider>(Get.context, listen: false);
  }

  // logger.e(event.notification.title);
  FlutterLocalNotificationsPlugin fltrNotification;

  var androidDetails = new AndroidNotificationDetails("Channel ID", "Desi programmer",
      importance: Importance.max,
      // sound: RawResourceAndroidNotificationSound('alert'),
      // sound: null,
      playSound: true,
      priority: Priority.max);
  var iSODetails = new IOSNotificationDetails();
  var generalNotificationDetails =   new NotificationDetails(android: androidDetails, iOS: iSODetails);
  var androidInitilize = new AndroidInitializationSettings('logo');
  var iOSinitilize = new IOSInitializationSettings();
  var initilizationsSettings = new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
  fltrNotification = new FlutterLocalNotificationsPlugin();
  fltrNotification.initialize(initilizationsSettings,onSelectNotification:(v){
    _openScreenForNotifications(event.data);
  } );

  await fltrNotification.show(
      dashboardProvider!=null ? dashboardProvider.notificationNumber: 0,
      event.notification != null
          ? event.notification.title
          : "",
      event.notification != null
          ? event.notification.body
          : "",
      generalNotificationDetails,
      payload: event.data.toString());
  dashboardProvider!=null ? ++dashboardProvider.notificationNumber : 0;
}
