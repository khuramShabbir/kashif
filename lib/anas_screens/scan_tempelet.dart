import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kashif/anas_screens/scan.dart';

class ScanTemplate extends StatefulWidget {
  const ScanTemplate({Key? key}) : super(key: key);

  @override
  _ScanTemplateState createState() => _ScanTemplateState();
}

class _ScanTemplateState extends State<ScanTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blueGrey.shade300,
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: InkWell(onTap: (){Get.to(Scan());},child: Image.asset("assets/card-atm.png")),
          ),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 18,
          ),
          const SizedBox(
            height: 18,
          ),
          StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return const SizedBox(
                height: 18,
              );
            }
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "Hold the card inside the frame.It will\n"
            "          be scanned automatically",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ));
  }
}
