//@dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/providers/user_auth_provider.dart';
import 'package:kashif/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'junaid_Screens/report_screen.dart';

main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => UserAuthProvider()),
      ChangeNotifierProvider(create: (ctx) => DashboardProvider()),
    ],
    child: const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: ReportScreen()
    ),
  ));
}
