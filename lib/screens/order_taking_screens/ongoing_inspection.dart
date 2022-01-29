import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/model_classes/getVehicleMakers.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/link_ui.dart';
import 'package:kashif/screens/order_taking_screens/scan_card_example.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../utils.dart';
import 'ongoing_inspection_pickup_address.dart';
import 'package:dropdown_search/dropdown_search.dart';

class OngoingInspectionUi extends StatefulWidget {
  const OngoingInspectionUi({Key? key}) : super(key: key);

  @override
  _OngoingInspectionUiState createState() => _OngoingInspectionUiState();
}

class _OngoingInspectionUiState extends State<OngoingInspectionUi> {
  double width = .8;
  double height = .06;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      ApiServices.getVehicleMaker();
      ApiServices.getVehicleServices();
    });
  }

  String modelname = "Select Model";

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (builder, data, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkWell(
                    onTap: () {
                      Get.to(() => const LinkUi());
                    },
                    child: SvgPicture.asset('assets/menu.svg')),
              )
            ],
            title: LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: Get.width * .6,
              lineHeight: 10.0,
              percent: progressBarPersent = 0.1,
              backgroundColor: Colors.grey.withOpacity(.5),
              progressColor: Colors.black,
              padding: const EdgeInsets.all(0),
            ),
          ),
          body: data.isVehicleMakerLoaded
              ? SingleChildScrollView(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width * .1,
                          ),
                          SizedBox(
                            width: Get.width * width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelText('Car Brand:'),
                                DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  items: getItemsMake(data),
                                  onChanged: (value) {
                                    data.carMakeId =
                                        getCarVehicleMakeId(value!, data);
                                    print(getCarVehicleMakeId(value, data));
                                    modelname = modelname + " ";
                                    data.carMakeModelId="";
                                    setState(() {});
                                  },
                                  selectedItem: "Select Make",
                                  dropdownSearchDecoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                labelText('Car Model:'),
                                 DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  items: getItemsMakeModels(data),
                                  onChanged: (modelName) {
                                    data.carMakeModelId =
                                        getCarVehicleMakeModelId(
                                            modelName!, data);
                                    print(getCarVehicleMakeModelId(
                                        modelName, data));
                                  },
                                  selectedItem: modelname,
                                  dropdownSearchDecoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),

                                data.isServiceDataLoaded ?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  labelText('Service Type:'),
                                  DropdownSearch<String>(
                                    mode: Mode.MENU,
                                    items: getItemsServices(data),
                                    onChanged: (value) {
                                      data.serviceTyoeId=getServiceName(data,value!);
                                      print(data.serviceTyoeId);
                                    },
                                    selectedItem: "Select Inspection",
                                    dropdownSearchDecoration: InputDecoration(
                                        contentPadding:
                                        EdgeInsets.only(left: 10, right: 10),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            borderSide:
                                            BorderSide(color: Colors.grey)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                  ),

                                ],)
                                : Container(),




                                labelText('Manufacture year:'),
                                new DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  items: [
                                    '1999',
                                    '2001',
                                    '2002',
                                    '2003',
                                    '2004',
                                    '2005',
                                    '2006',
                                    '2007',
                                    '2008',
                                    '2009',
                                    '2010',
                                    '2011',
                                    '2012',
                                    '2013',
                                    '2014',
                                    '2014',
                                    '2015',
                                    '2016',
                                    '2017',
                                    '2018',
                                    '2019',
                                    '2020',
                                    '2021',
                                    '2022',
                                  ],
                                  onChanged: (year) {
                                    data.manufacturYear = year!;
                                  },
                                  selectedItem: "Select year",
                                  dropdownSearchDecoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                labelText('vin:'),
                                customInputFormField(
                                    onChange: (value) {
                                      data.vinCode=value;

                                    },
                                    hintText: "2FABP7CWI8X13",
                                    isOutlinedBorder: true,
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        Get.to(() => const ScanCardExample());
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/cards.svg",
                                            height: 20,
                                          ),
                                          const Text("Scan")
                                        ],
                                      ),
                                    )),


                                labelText('Car plate'),

                                Container(
                                  height: 70,
                                  width: Get.width,
                                  child: Row(children: [
                                  Expanded(
                                    child: customInputFormField(
                                      keyboardType: TextInputType.text,
                                        hintText: "AAAA",
                                        isOutlinedBorder: true,
                                        onChange: (value) {
                                          if(value.toString().length>4){
                                            return;
                                          }
                                          data.numberPlateEnglish=value;

                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text("-",style: TextStyle(fontSize: 35),),
                                  ),
                                  Expanded(
                                    child: customInputFormField(
                                        keyboardType: TextInputType.number,
                                        hintText: "1234",
                                        isOutlinedBorder: true,
                                        onChange: (value) {
                                          if(value.toString().length>4){
                                            return;
                                          }
                                          data.numberPlateDigits=value;

                                        }),
                                  ),
                                    ],
                                  ),
                                )




                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * .1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    customButton(
                        buttonWidth: 0.30,
                        onClick: () {
                          data.btnNextForTimeAndAddress();
                          },
                        buttonWidget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                  ],
                ))
              : Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }

  List<String> getItemsMake(DashboardProvider data) {
    List<String> list = [];
    data.getVehicleMaker!.data!.forEach((element) {
      list.add(element.name!);
    });

    return list;
  }

  getCarVehicleMakeId(String value, DashboardProvider data) {
    for (int i = 0; i < data.getVehicleMaker!.data!.length; i++) {
      if (value.toString().toLowerCase() ==
          data.getVehicleMaker!.data![i].name.toString().toLowerCase()) {
        return data.getVehicleMaker!.data![i].id.toString();
      }
    }
  }

  List<String> getItemsMakeModels(DashboardProvider data) {
    List<Models>? models = [];
    data.getVehicleMaker!.data!.forEach((element) {
      if (data.carMakeId == element.id.toString()) {
        models = element.models;
      }
    });

    List<String> modelList = [];
    for (int i = 0; i < models!.length; i++) {
      modelList.add(models![i].name!);
    }

    return modelList;
  }

  String getCarVehicleMakeModelId(String modelName, DashboardProvider data) {
    String modelId = '';
    for (int i = 0; i < data.getVehicleMaker!.data!.length; i++) {
      if (data.carMakeId.toString().toLowerCase() ==
          data.getVehicleMaker!.data![i].id.toString().toLowerCase()) {
        var models = data.getVehicleMaker!.data![i];
        models.models!.forEach((element) {
          if (element.name.toString().toLowerCase() ==
              modelName.toLowerCase()) {
            modelId = element.id.toString();
          }
        });
      }
    }
    return modelId;
  }

  getItemsServices(DashboardProvider data) {
    List<String> list=[];
    data.vehicleServicesFromJson!.data!.forEach((element) {
      list.add(element.name!);
    });
    return list;


  }

  String getServiceName(DashboardProvider data, String name) {
    String id='';
    for(int i= 0;i<data.vehicleServicesFromJson!.data!.length ; i++){
      if(data.vehicleServicesFromJson!.data![i].name.toLowerCase()==name.toLowerCase()){
        id= data.vehicleServicesFromJson!.data![i].id.toString();
      }
    }
    return id;

  }
}

labelText(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}
