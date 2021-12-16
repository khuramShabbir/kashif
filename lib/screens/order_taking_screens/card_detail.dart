import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(onTap: (){Get.back();},
        child: Center(
          child: Container(
            width: Get.width * .9,
            height: Get.height * .3,
            decoration: BoxDecoration(
              color: const Color(0xFF465A60),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * .15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Khaled Al-Kayali',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          'ID : 675765767',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                            width: Get.width * .9,
                            height: Get.height * .09,
                            color: const Color(0xFF203840),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Get.width * .2,
                                ),
                                const Text(
                                  "\$599.00",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: Get.width * .2,
                                ),
                                const Text(
                                  ' SR.(Link)',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 15),
                            child: Column(
                              children: const [
                                Text(
                                  '\$5 / F',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$1 All',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
