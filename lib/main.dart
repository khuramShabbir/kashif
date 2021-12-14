// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kashif/splash_screen/home_screen.dart';
import 'package:kashif/utils.dart';
import 'package:percent_indicator/percent_indicator.dart';




main() {

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeUi()
    ),
  );
}
class ProgressBar extends StatefulWidget {
  const ProgressBar({key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double progress=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back,color: Colors.black,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset('assets/menu.svg'),
          )
        ],
        title:LinearPercentIndicator(alignment: MainAxisAlignment.center,
        width: Get.width*.6,
        lineHeight: 10.0,
        percent:progress,
        backgroundColor: Colors.grey.withOpacity(.5),
        progressColor: Colors.black,
          padding: const EdgeInsets.all(0),
      ) ,),
      body: Container(color: Colors.yellow,height: Get.height,width: Get.width,
child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [ InkWell(onTap: (){
    if(progress<.9){progress=progress+0.1;logger.e(progress);}

    else {progress=0.1;}
    setState(() {

    });
    },
    child:const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.red,
      ),
  ),
  ]
),
      ),
    );
  }
}
