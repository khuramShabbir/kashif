import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InvoiceWebView extends StatefulWidget {
  final String link;
  final String title;
  InvoiceWebView(this.link,this.title);

  @override
  _InvoiceWebViewState createState() => _InvoiceWebViewState();
}

class _InvoiceWebViewState extends State<InvoiceWebView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Text(widget.title),),
      body: Container(
        // height: Get.width * 0.6,
        // width: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(35),),
        child:  Stack(children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.link,
            gestureNavigationEnabled: true,
            onWebViewCreated: (WebViewController webViewController) {

            },
            onProgress: (int progress) {
              print('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    child: Center(child: Text("Status",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        height: 55,
                        width: Get.width * 0.9,
                      ),
                )),
              )
            ],)
        // child: ,
      ),
    );
  }
}
