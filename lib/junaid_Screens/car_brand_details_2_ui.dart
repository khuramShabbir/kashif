// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../utils.dart';
//
//
// class CarBrandUi2 extends StatefulWidget {
//   const CarBrandUi2({Key? key}) : super(key: key);
//
//   @override
//   _CarBrandUi2State createState() => _CarBrandUi2State();
// }
//
// class _CarBrandUi2State extends State<CarBrandUi2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: (){
//             Get.back();
//           },
//           child: const Padding(
//             padding: EdgeInsets.only(left: 15.0),
//             child: Icon(Icons.arrow_back,color: Colors.black,),
//           ),
//         ),
//         title: const Text('Report detail',style: TextStyle(color: Colors.black),),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15.0),
//             child: SvgPicture.asset('assets/bell-ringing.svg'),
//           ),],
//
//       ),
//
//
//       body: SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//
//              SizedBox(height: Get.height*0.01,),
//               carBrand('Toyota'),
//               const SizedBox(height: 18,),
//               Container(height: 1,width: Get.width*0.9,color: Colors.grey,),
//               const SizedBox(height: 22,),
//               Container(
//                 height: Get.width*0.6,
//                 width: Get.width*0.9,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(35),
//                   image: const DecorationImage(
//                     fit: BoxFit.fill,
//                     image: AssetImage('assets/CarDoor.png')
//                   )
//                 ),
//               ),
//               const SizedBox(height: 22,),
//               Container(height: 1,width: Get.width*0.9,color: Colors.grey,),
//               const SizedBox(height: 12,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                 child: Column(
//                   children: [
//                     carReports('internal order', '(error)', 'seat Dirty','(available in photos)')
//                   ],
//                 ),
//               ),
//               Image.asset('assets/CarView.png')
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
