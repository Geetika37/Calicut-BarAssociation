import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    RxBool isLoading = true.obs;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WebView(
            onWebViewCreated: (WebViewController controller) {
              _controller.complete(controller);
            },
            initialUrl: 'https://law.mywebtest.fun/',
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              if (progress == 100) {
                isLoading.value = false;
              } else {
                isLoading.value = true;
              }
            },
          ),
          Obx(() {
            return isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox();
          })
        ],
      ),
    ));
  }
}
