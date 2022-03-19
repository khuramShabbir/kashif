import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/junaid_Screens/car_brand_details_2_ui.dart';
import 'package:kashif/model_classes/GetAllRecords.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:kashif/screens/order_taking_screens/stepper_ui.dart';
import 'package:provider/provider.dart';
import '../utils.dart';
import 'report_screen.dart';
import 'package:intl/intl.dart';

class OnGoingServicesUi extends StatefulWidget {
  const OnGoingServicesUi({Key? key}) : super(key: key);

  @override
  _OnGoingServicesUiState createState() => _OnGoingServicesUiState();
}

class _OnGoingServicesUiState extends State<OnGoingServicesUi> {
  int color = 0xFF304FFE;
  bool isTaped = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    ApiServices.getAllCardsRecord();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (builder,data,child){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Order Records',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 15.0),
            //   child: InkWell(
            //     child: SvgPicture.asset(
            //       'assets/BellIcon.svg',
            //       color: Colors.black,
            //       width: 25.0,
            //       height: 25.0,
            //     ),
            //   ),
            // ),
          ],
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child:


          data.isAllRecordsLoaded?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      isTaped = true;
                      // logger.e('UPCOMING');
                      setState(() {});
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                            'UPCOMING',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isTaped
                                    ? const Color(primaryBlueColor)
                                    : primaryColor.withOpacity(.4)),
                          )),
                      height: Get.height * .055,
                      width: Get.width * .4,
                      decoration: BoxDecoration(
                          color: isTaped
                              ? const Color(primaryBlueColor).withOpacity(.3)
                              : const Color(0x00ffffff),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          border: Border.all(
                            width: 1.5,
                            color: isTaped
                                ? const Color(primaryBlueColor)
                                : primaryColor.withOpacity(.3),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isTaped = false;
                      // logger.e('Past');
                      setState(() {});
                    },
                    child: Container(
                      child: Center(
                          child: Text(
                            'PAST',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isTaped
                                    ? primaryColor.withOpacity(.4)
                                    : const Color(primaryBlueColor)),
                          )),
                      height: Get.height * .055,
                      width: Get.width * .4,
                      decoration: BoxDecoration(
                          color: isTaped
                              ? const Color(0x00ffffff)
                              : Color(color).withOpacity(.3),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          border: Border.all(
                            width: 1.5,
                            color: isTaped
                                ? primaryColor.withOpacity(.3)
                                : const Color(primaryBlueColor),
                          )),
                    ),
                  ),
                ],
              ),
              isTaped
                  ? Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.allRecordsFromJson.data.length,
                    itemBuilder: (context, index) {

                      if(data.allRecordsFromJson.data[index].status=="DONE"){
                        return  Container();
                      }

                      return InkWell(
                          onTap: () async{
                            if(data.allRecordsFromJson.data[index].status=="WORKING" || data.allRecordsFromJson.data[index].status=="PENDING" ){
                              print("cardId: data.allRecordsFromJson.data[index].id "
                                  "${data.allRecordsFromJson.data[index].id}");
                              Get.to(() => StepperUi(cardId: data.allRecordsFromJson.data[index].id,));

                              return;
                            }
                            else if(data.allRecordsFromJson.data[index].status=="CLOSED"){
                              showProgress();
                              await ApiServices.getCardInfoByCardId(
                                  data.allRecordsFromJson.data[index].id);
                              dismissDialogue();
                              Get.to(() => const ReportScreen());
                            }

                          },
                          child: upcomingDetail(data.allRecordsFromJson.data[index]));
                    }),
              )
                  : Expanded(
                    child: ListView.builder(
                        itemCount: data.allRecordsFromJson.data.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if(data.allRecordsFromJson.data[index].status=="DONE"){
                            print(index);
                          return pastDetail(data.allRecordsFromJson.data[index]);
                          }

                            return  Container();

                        }),
                  )
            ],
          )
              :
          Center(child: CircularProgressIndicator(),)

          ,
        ),
      );
    });
  }
  Widget upcomingDetail(RecodsData recodsData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.2))),
        child: Padding(
          padding: EdgeInsets.all(Get.width * .03),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recodsData.inspectionType.toString().contains("1")? "Ongoing Inspection"
                        : "Center Inspection",
                    style: TextStyle(
                        fontSize: Get.width * .04, fontWeight: FontWeight.bold),
                  ),
                  statusButton(recodsData)
                ],
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              Row(
                children: [
                  Text(
                    "${recodsData.vehicle.maker.name} ${recodsData.vehicle.models.name}",
                    style: TextStyle(
                        fontSize: Get.width * .035,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: Get.width * .05,
                  ),
                  Text(
                    '#${recodsData.id}',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.width * .035,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * .08,
              ),
              /// 5star ratting
              // Row(
              //   children: [
              //     RatingBar.builder(
              //       initialRating: 0,
              //       itemSize: 18,
              //       minRating: recodsData.rating==null ? 0 : double.parse(recodsData.rating.toString()),
              //       direction: Axis.horizontal,
              //       allowHalfRating: true,
              //       itemCount: 5,
              //       itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              //       itemBuilder: (context, _) => const Icon(
              //         Icons.star,
              //         color: Colors.amber,
              //       ),
              //       onRatingUpdate: (rating) {},
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DATE',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: Get.width * .035,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'PICK-UP TIME',
                    style: TextStyle(
                        fontSize: Get.width * .035,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    DateFormat('yyyy-MM-dd hh:mm:ss a').format(DateTime.parse(recodsData.vehicle.createdAt)),
                    // '21ST Sept 2021, Monday',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${recodsData.startTime} - ${recodsData.endTime}',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusButton(RecodsData recodsData) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.greenAccent.withOpacity(.2),
          color:recodsData.status=="PENDING"?Colors.orange.withOpacity(.2) : Colors.green.withOpacity(.2),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color:recodsData.status=="PENDING"?Colors.orange : Colors.green,)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          recodsData.status,
          style: TextStyle(
              color:recodsData.status=="PENDING"?Colors.orange : Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: Get.width * .03),
        ),
      ),
    );
  }
  Widget pastDetail(RecodsData recordsData) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * .02),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: Get.height * .2,
              width: Get.width * .8,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: const Offset(-3, 3),
                    blurRadius: 5),
              ]),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    "${recordsData.vehicle.maker.name} ${recordsData.vehicle.models.name}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '${recordsData.vehicle.plateChar} - ${recordsData.vehicle.plateNumber}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text('${recordsData.invoice.invoiceNumber}'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: Get.width * .18,
                                        height: Get.height * .022,
                                        decoration: BoxDecoration(
                                            color: Colors.green.withOpacity(.15),
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            border:
                                            Border.all(color: Colors.green)),
                                        child:  Center(
                                          child: Text(
                                            recordsData.status,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async{
                              await ApiServices.reApplication(recordsData.id);

                              isTaped=true;
                              setState(() {
                                
                              });

                              logger.e("isTaped $isTaped");


                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(.3))),
                              child: Row(
                                children: [
                                  const Expanded(
                                      child: Center(
                                          child: Text(
                                            're-application',
                                            style: TextStyle(
                                                color: Color(primaryBlueColor),
                                                fontWeight: FontWeight.bold),
                                          ))),
                                  Container(color: Colors.grey, width: 1),
                                  Expanded(
                                      child: InkWell(

                                        onTap: ()async {

                                          showProgress();
                                          await ApiServices.getCardInfoByCardId(recordsData.id);
                                          dismissDialogue();
                                          Get.to(() => const ReportScreen());

                                        },
                                        child: Container(
                                          child: Center(
                                              child: Text(
                                                'Service report',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/svg/sedan_car.png',
                  height: Get.width * .3,
                  width: Get.width * .4,
                )),
          )
        ],
      ),
    );
  }

}



