// API takes in URL for health Advices
// so web view navigates to the page

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:proheal/core/style/color_contants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/navigation/navigation.dart';

class WebViewPage extends StatefulWidget {
  final String? data;
  const WebViewPage({Key? key, this.data}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 19,
              color: black,
              onPressed: () {
                pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Stack(
                children: [
                  WebView(
                    initialUrl: widget.data,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (finish) => setState(() {
                      isLoading = false;
                    }),
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Stack(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
