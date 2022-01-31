//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/apis_services/api_services.dart';
import 'package:kashif/providers/dashboard_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:top_sheet/top_sheet.dart';
import '../../utils.dart';
import 'order_ended.dart';
import 'stepper.dart' as stepper;
import 'package:intl/intl.dart';

class StepperUi extends StatefulWidget {
  int cardId;
   StepperUi({Key key,this.cardId }) : super(key: key);

  @override
  _StepperUiState createState() => _StepperUiState();
}

class _StepperUiState extends State<StepperUi> {


  @override
  void initState() {

    super.initState();

    var dashboardProvider=Provider.of<DashboardProvider>(Get.context,listen: false);

    dashboardProvider.setCardInformation(null,false);

    ApiServices.getCardInfoByCardId(widget.cardId);

  }

  @override
  Widget build(BuildContext context) {

    return Consumer<DashboardProvider>(builder: (builder,data,child){


      return  Scaffold(

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
                child: SvgPicture.asset('assets/menu.svg'),
              )
            ],
            title: LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: Get.width * .6,
              lineHeight: 10.0,
              percent: progressBarPersent = 0.8,
              backgroundColor: Colors.grey.withOpacity(.5),
              progressColor: Colors.black,
              padding: const EdgeInsets.all(0),
            ),
          ),

          body:
          data.isSingleCardLoaded
              ?
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      SizedBox(
                        height: Get.height * .25,
                        width: Get.width * .9,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    data.cardInfoByCardIdFromJson.data.card.vehicle.maker.name + " "+ data.cardInfoByCardIdFromJson.data.card.vehicle.models.name,
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "#"+data.cardInfoByCardIdFromJson.data.card.id.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.withOpacity(.5)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                 Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    '${data.cardInfoByCardIdFromJson.data.card.vehicle.plateChar} - ${data.cardInfoByCardIdFromJson.data.card.vehicle.plateNumber}',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text(
                                  'DATE',
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                                ),
                                 Text(
                                   DateFormat('yyyy-MM-dd').parse(data.cardInfoByCardIdFromJson.data.card.createdAt).toString().replaceAll("00:00:00.000", ''),
                                  style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/carPng.png',
                                    height: Get.height * .2,
                                  ),
                                   Text(
                                    "${data.cardInfoByCardIdFromJson.data.card.startTime} - ${data.cardInfoByCardIdFromJson.data.card.endTime}",
                                    style: TextStyle(fontSize: 13),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),



                      InkWell(
                        onTap: () {
                          // Get.to(() => const OrderEnded());
                        },
                        child: Container(
                          width: Get.width,
                          child:  stepper.Stepper(
                            physics: NeverScrollableScrollPhysics(),
                            steps: [
                              stepper.Step(
                                  state: data.cardInfoByCardIdFromJson.data.card.inspectionStart!=null ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title:      Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text("The Vehicle Arrived at the center",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
                                Text(data.cardInfoByCardIdFromJson.data.card.inspectionStart,style: TextStyle(color: Colors.grey),),

                              ],),
                                  content:   Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(Icons.camera_alt_outlined),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text("Vehicle checking in progress",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
                                    Text("in progress",style: TextStyle(color: Colors.grey),),

                                ],)


                              ],)
                                  ),
                              stepper.Step(
                                  state: data.cardInfoByCardIdFromJson.data.card.card_step!=null  &&data.cardInfoByCardIdFromJson.data.card.card_step>0 ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Mechanical Issues"), content: Text("step 1")),
                              stepper.Step(
                                  state:data.cardInfoByCardIdFromJson.data.card.card_step!=null  &&data.cardInfoByCardIdFromJson.data.card.card_step>1 ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Tympanic Indicator checking"), content: Text("")),
                              stepper.Step(
                                  state:data.cardInfoByCardIdFromJson.data.card.card_step!=null  &&data.cardInfoByCardIdFromJson.data.card.card_step>2 ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Tires checking"), content: Text("")),
                              stepper.Step(
                                  state: data.cardInfoByCardIdFromJson.data.card.card_step!=null  &&data.cardInfoByCardIdFromJson.data.card.card_step>3 ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Sensors checking"), content: Text("")),
                              stepper.Step(
                                  state: data.cardInfoByCardIdFromJson.data.card.card_step!=null  &&data.cardInfoByCardIdFromJson.data.card.card_step>4 ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Road Testing"), content: Text("")),
                              stepper.Step(
                                  state: data.cardInfoByCardIdFromJson.data.card.card_step!=null  &&data.cardInfoByCardIdFromJson.data.card.card_step>5 ? stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Responsibilities"), content: Text("")),
                              stepper.Step(
                                  state: data.cardInfoByCardIdFromJson.data.report!=null ?  stepper.StepState.complete: stepper.StepState.indexed,
                                  title: Text("Inspection Completed"), content: Text("")),


                            ],),
                        ),
                      ),
                      data.cardInfoByCardIdFromJson.data.report!=null ?
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customButton(onClick: () {
                          //
                          //
                          // if(data.cardInfoByCardIdFromJson.data.card.rating==null){
                          //
                          //   Get.dialog(Container(
                          //
                          //     height: Get.height,
                          //     width: Get.width,
                          //     color: Colors.white.withOpacity(0.5),
                          //     child: Center(child: Container(
                          //
                          //       ),),
                          //
                          //   ));
                          //
                          // }
                          // else{
                          Get.to(()=>OrderEnded());
                          // }




                      /*    TopSheet.show(
                              context: context,
                              direction: TopSheetDirection.TOP,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                title: LinearPercentIndicator(
                                  alignment: MainAxisAlignment.center,
                                  width: Get.width * .6,
                                  lineHeight: 10.0,
                                  percent: progressBarPersent = .7,
                                  backgroundColor: Colors.white.withOpacity(.5),
                                  progressColor: Colors.black,
                                  padding: const EdgeInsets.all(0),
                                ),
                                trailing: SvgPicture.asset('assets/menu.svg'),
                                subtitle: Container(
                                  height: Get.height * .4,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                ),
                              ));*/



                        },buttonWidget: Center(child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 20),))),
                      )
                      :
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          )
              :
          Center(child: CircularProgressIndicator(),)

      );
    });

  }

}
