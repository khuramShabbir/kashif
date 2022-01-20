import 'package:flutter/cupertino.dart';
import 'package:kashif/screens/order_taking_screens/center_inspection_ui.dart';
import 'package:kashif/screens/order_taking_screens/compelet_order.dart';
import 'package:kashif/screens/order_taking_screens/OrderStartHomeScreen.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection_pickup_address.dart';
import 'package:kashif/screens/order_taking_screens/vehicles.dart';
import 'anas_screens/profile.dart';
import 'junaid_Screens/ongoing_service.dart';

class ScreenSList{
  List<Widget> screensList=const [
    OrderStartHomeScreen(),
    Vehicles(),
    OnGoingServicesUi(),
    Profile(),
    OnGoingServicesUi(),
    CenterInspectionUi(),
    CompleteYourOrder(),
    OngoingInspectionPickUpAddressUi(),
  ];
}



