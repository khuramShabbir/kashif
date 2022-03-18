//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';



/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
///



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  listenFcm(event);


}


class FCM {
  FirebaseMessaging _messaging= FirebaseMessaging.instance;



  FCM() {
    try{
      FlutterLocalNotificationsPlugin fltrNotification;

      var androidInitilize = new AndroidInitializationSettings('logo');
      var iOSinitilize = new IOSInitializationSettings();
      var initilizationsSettings = new InitializationSettings(
          android: androidInitilize, iOS: iOSinitilize);
      fltrNotification = new FlutterLocalNotificationsPlugin();
      fltrNotification.initialize(initilizationsSettings,
          onSelectNotification: _openScreenForNotifications);
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
          /// call when app is in BG
          await Firebase.initializeApp();

          /// will call when user click on notification created by OS it self or using FCM when app was in BG
          FirebaseMessaging.onMessageOpenedApp.listen((event) {
            _openScreenForNotifications(event.data);
          });

          /// generate notification your self
          FirebaseMessaging.onMessage.listen((event) {
            listenFcm(event);
            // logger.e(getUser().user.id.toString());

          });
        }
      });
    }
    catch(e){
      logger.e(e);
    }
  }









}


_openScreenForNotifications(payload) {

  // if(payload.runtimeType == String){
  //   logger.e("STRING");
  // } else if(payload.runtimeType == Map)
  // {
  //   logger.e("MAP");
  // }
  // else{
    logger.e(payload.runtimeType);
  // }

}
void listenFcm(RemoteMessage event) async{

  logger.e(event.data);

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
  fltrNotification.initialize(initilizationsSettings,onSelectNotification:_openScreenForNotifications );

  // logger.i("event.notification != null ${event.notification} ");


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
