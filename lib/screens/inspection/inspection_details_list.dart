import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/junaid_Screens/report_screen.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/stepper_ui.dart';
import 'package:kashif/utils.dart';
import 'package:provider/provider.dart';

import 'inspection_item_detail.dart';

class InspectionDetailsList extends StatefulWidget {
  int vehicleId;
   InspectionDetailsList(this.vehicleId, {Key? key}) : super(key: key);

  @override
  _InspectionDetailsListState createState() => _InspectionDetailsListState(this.vehicleId);
}

class _InspectionDetailsListState extends State<InspectionDetailsList> {
  int vehicleId;
  _InspectionDetailsListState(this.vehicleId);

  @override
  void initState() {
    super.initState();
    ApiServices.dashboardProvider.isCardListLoadedbyVehicle=false;
    logger.e(vehicleId);
    ApiServices.getCardsListByVehicleId(vehicleId);

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (builder,data,child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back, color: Colors.black)),
          ),
          body:
          data.isCardListLoadedbyVehicle?
              data.cardsListByVehicleIdFromJson.data.card.isNotEmpty?

          ListView.builder(
            itemCount: data.cardsListByVehicleIdFromJson.data.card.length,
            itemBuilder: (context, index) {

              var card = data.cardsListByVehicleIdFromJson.data.card[index];
              return InkWell(
              onTap: ()async{
                logger.e(card.status);
                if(card.status=="WORKING"
                    || card.status=="PENDING"
                    || card.status=="NEW"

                ){

                  Get.to(() => StepperUi(cardId:card.id,));

                  return;
                }
                showProgress();

                var value = await ApiServices.getCardInfoByCardId(card.id);
                if(value==false) return;
                dismissDialogue();
                Get.to(() => const ReportScreen());

              },

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: Get.height * .35,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height * .28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey)
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.35),
                                    blurRadius: 20,
                                    offset: const Offset(5, 5))
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${card.inspectionTypeText}',
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Text(
                                      '${card.id}',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(.7)),
                                    )
                                  ],
                                ),
                                lineBar(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Unique ID:",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Row(
                                      children:  [
                                        Text(
                                          '${card.vmVehicleId}',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Check-in Time:',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(.6)),
                                    ),
                                     Text(
                                      '${card.startTime}',
                                      style: TextStyle(color: primaryColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Check-out Time(Est):',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(.6)),
                                    ),
                                Text(
                                    '${card.endTime}',
                                    style: TextStyle(color: primaryColor)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          color: primaryColor.withOpacity(.6)),
                                    ),
                                     Text('${card.status}',
                                        style: TextStyle(color: primaryColor)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: const Alignment(0, 0.77),
                            child: FloatingActionButton(
                              heroTag: 'tag $index',
                              backgroundColor: primaryColor,
                              onPressed: () {


                              },
                              child: SvgPicture.asset('assets/svg/Qr.svg'),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
            },
          )
                  :
                  Center(child: Text("No Record Found",style: TextStyle(color: primaryColor,fontSize: 20,
                  fontWeight: FontWeight.bold),),)
              :
          Center(child: CircularProgressIndicator(),),
        );
      }
    );
  }




}
