import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/model_classes/GetCustomerVehicle.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/center_inspection_ui.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';

import '../inspection/inspection_details_list.dart';
import '../order_taking_screens/compelet_order.dart';
import '../order_taking_screens/ongoing_inspection_pickup_address.dart';

class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {


  @override
  void initState() {
    super.initState();

    ApiServices.getCustomerAllVehicles();


  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: const Icon(Icons.arrow_back, color: Colors.black),
          title: const Text(
            'Order',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Image.asset("assets/notification.png"),
          ],
        ),
        body: Consumer<DashboardProvider>(builder: (build,data,child){
          return data.isVehiclesLoaded
              ?
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: ListView.builder(itemCount: data.customerVehicleFromJson.data.length,
                    itemBuilder: (itemBuilder,index){

                      VehicleData vehicle = data.customerVehicleFromJson.data[index];
                  return InkWell(
                    onTap: (){

                      Get.to(InspectionDetailsList(data.customerVehicleFromJson.data[index].id));

                    },
                    child: customerVehiclesItemLayout(
                      vehicleName: vehicle.maker.name,
                      vehicleDetails:"Model: ${vehicle.models.name}\nYear: ${vehicle.year}\n"
                          "Plate: ${vehicle.plateChar} - ${vehicle.plateNumber}"
                    ),
                  );
                }))
              ],
            ),
          )
              :
          Center(child: CircularProgressIndicator(color: primaryColor,));


        },)
      ),
    );
  }

  Widget customerVehiclesItemLayout({
    double radius = 15,
    String showImageAddress = "assets/ongoing.png",
    String vehicleName = '',
    String vehicleDetails = '',
  }) {



    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(
                      vehicleName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5,bottom: 10),
                    child: Text(
                      vehicleDetails,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
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
}
