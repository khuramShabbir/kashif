import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/splash_screen/home_screen.dart';


main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeUI(),
    ),
  );
}
