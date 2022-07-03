import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/model_classes/get_vehicle_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/ongoing_inspection.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';

class ServiceSearchScreen extends StatefulWidget {
  const ServiceSearchScreen({Key? key}) : super(key: key);

  @override
  State<ServiceSearchScreen> createState() => _ServiceSearchScreenState();
}

class _ServiceSearchScreenState extends State<ServiceSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back,color: primaryColor,)),
      ),
      body: Consumer<DashboardProvider>(builder: (build, data, child) {
        return Container(
            child: ListView.builder(
                itemCount: data.vehicleServicesFromJson.data.length,
                itemBuilder: (context, index) {return getSearchItem(data.vehicleServicesFromJson.data[index], data);
                }));
      }),
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

  getSearchItem(SingleService service, DashboardProvider data) {
    return InkWell(
      onTap: () {
        print(service.price);
        data.serviceTyoeId = getServiceName(data, service.name);
        data.vat_percentage =
            data.vehicleServicesFromJson.vat_percentage.toString();
        data.vatValue = service.vat_value.toString();

        Get.back();
        Get.to(() => const OngoingInspectionUi());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF7F8FB),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ListTile(
            title: Text(service.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            subtitle: Text("${service.price.toString()}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
            trailing: Text('${service.detailsService}'),
          ),
        ),
      ),
    );
  }
}
