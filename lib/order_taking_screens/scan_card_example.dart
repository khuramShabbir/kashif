import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanCardExample extends StatelessWidget {
  const ScanCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF656D79),
      body: InkWell(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .18,
              ),
              SizedBox(
                width: Get.width * .6,
                height: Get.height * .2,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/constrains.png',
                      fit: BoxFit.cover,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/vin-03 1.png',
                        fit: BoxFit.cover,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .17,
              ),
              const Text(
                "Hold The Card Inside the frame. it will be",
                style: TextStyle(color: Colors.white),
              ),
              const Text("scanned automatically",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
