import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kashif/utils.dart';

class GooGleMap extends StatefulWidget {
  const GooGleMap({Key? key}) : super(key: key);

  @override
  _GooGleMapState createState() => _GooGleMapState();
}

class _GooGleMapState extends State<GooGleMap> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              child: SvgPicture.asset(
                'assets/BellIcon.svg',
                color: Colors.black,
                width: 25.0,
                height: 25.0,
              ),
            ),
          ),
        ],
      ),

      body: Container(color: Colors.yellow,
      child:const Center(child: Text('TODO : Google Map ')),

      ),
floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),backgroundColor: Color(primaryColor),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:BottomNavigationBar( items: [
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/Home_Bottom_Nav_Bar.svg'),label: ""),
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/Home_Bottom_Nav_Bar.svg'),label: ""),
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/Home_Bottom_Nav_Bar.svg',color: Colors.transparent,),label: ""),
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/Home_Bottom_Nav_Bar.svg'),label: ""),
        BottomNavigationBarItem(icon: SvgPicture.asset('assets/Home_Bottom_Nav_Bar.svg'),label: ""),




      ], )
        ,





    );
  }
}
