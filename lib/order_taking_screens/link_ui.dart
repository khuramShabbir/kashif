import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:kashif/order_taking_screens/card_detail.dart';

class LinkUi extends StatefulWidget {
  const LinkUi({Key? key}) : super(key: key);

  @override
  _LinkUiState createState() => _LinkUiState();
}

class _LinkUiState extends State<LinkUi> {
  var data1 = Data("Khuram", 'Khuram@khuram.com', '1500');
  List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    //1
    var data1 = Data("Khuram", 'email@email', "1500");

    //2
    var data2 = Data("name2", 'email', "1500");
    //3
    var data3 = Data("name3", 'email', "1500");
    //4
    var data4 = Data("name4", 'email', "1500");
    //5
    var data5 = Data("name5", 'email', "1500");

    dataList.add(data1);
    dataList.add(data2);
    dataList.add(data3);
    dataList.add(data4);
    dataList.add(data5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Link',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: InkWell(
            onTap: Get.back,
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                Get.to(() =>const CardDetail());
              },
              child: Image.asset("assets/profit_icon.png"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * .025,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * .1,
              ),
              const Text(
                "Most Recent Payer",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * .05,
              ),
              Column(
                children: [
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  recentPayer(dataList),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          InkWell(onTap: (){Get.to(const CardDetail());},
            child: Container(
              width: Get.width * .9,
              height: Get.height * .25,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 0)),
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Set Card Limit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Image.asset('assets/menu.png'),
                      ],
                    ),
                  )),
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset('assets/Chart.png'))),
                          Expanded(
                              flex: 2,
                              child: Padding (
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Limit Transaction",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "1,000",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Total Spent this Month",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "250",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * .65,
                    height: Get.height * .07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "http://cashif/467",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Copied',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      width: Get.width * .23,
                      height: Get.height * .07,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Colors.grey.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFE5E5E6)),
                      child: Image.asset('assets/share.png'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget recentPayer(List<Data> dataList) {
  return Container(
    color: Colors.red,
    width: Get.width * .9,
    height: Get.height * .36,
    child: SingleChildScrollView(
      child: Column(
          children: List.generate(
        dataList.length,
        (index) => Container(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor:
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [Text("First Name"), Text("first@email.com")],
              ),
              SizedBox(
                width: Get.width * .25,
              ),
              const Text("+ 95.00")
            ],
          ),
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          height: Get.height * .09,
        ),
      )),
    ),
  );
}

class Data {
  final String? _name, _email, _price;

  Data(this._name, this._email, this._price);

  get price => _price;

  get email => _email;

  get name => _name;
}
