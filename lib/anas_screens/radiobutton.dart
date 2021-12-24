import 'package:flutter/material.dart';

class Radiobutton extends StatefulWidget {
  const Radiobutton({Key? key}) : super(key: key);

  @override
  _RadiobuttonState createState() => _RadiobuttonState();
}

class _RadiobuttonState extends State<Radiobutton> {
  late MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(onTap: (){
              setState(() {
                color = Colors.red;
              });
            },
              child: Container(
                color: color,
                height:80,
                width: 80,
              ),
            ),

            InkWell(onTap: (){
              setState(() {
                color = Colors.yellow as MaterialColor;
              });
            },
              child: Container(
                color: color,
                height:80,
                width: 80,
              ),
            )

          ],
        ),
      ),
    );
  }
}
