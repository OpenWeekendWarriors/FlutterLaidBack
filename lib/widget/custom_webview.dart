import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class CustomWebView extends StatefulWidget {
  String? url;
  CustomWebView({Key? key , this.url}) : super(key: key);

  @override
  CustomWebViewState createState() => CustomWebViewState();
}

class CustomWebViewState extends State<CustomWebView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // final Completer<WebViewController> _controller =
  // Completer<WebViewController>();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Enable hybrid composition.
  //   if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       elevation: 0,
  //       leading: IconButton(onPressed:(){
  //         Get.back();
  //       }, icon: Icon(
  //         Get.locale!.countryCode!.endsWith('IR') ?Icons.arrow_back_ios_outlined : Icons.arrow_forward_ios_outlined,
  //         color: Get.theme.primaryColor,
  //         size: 24.0,
  //       )),
  //       // title: CustomText(smart boom tv , color: Colors.white,),
  //       backgroundColor:Colors.white ,
  //       // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
  //       // actions: <Widget>[
  //       //   NavigationControls(_controller.future),
  //       //   SampleMenu(_controller.future),
  //       // ],
  //     ),
  //
  //     body: SafeArea(
  //       child: WebView(
  //         initialUrl:widget.url?? 'https://google.com',
  //
  //         javascriptMode: JavascriptMode.unrestricted,
  //         onWebViewCreated: (WebViewController webViewController) {
  //           _controller.complete(webViewController);
  //         },
  //         onProgress: (int progress) {
  //           debugPrint("WebView is loading (progress : $progress%)");
  //         },
  //         javascriptChannels: <JavascriptChannel>{
  //           _toasterJavascriptChannel(context),
  //         },
  //
  //         onPageStarted: (String url) {
  //           debugPrint('Page started loading: $url');
  //         },
  //         onPageFinished: (String url) {
  //           debugPrint('Page finished loading: $url');
  //         },
  //         gestureNavigationEnabled: true,
  //
  //
  //       ),
  //     ),
  //   );
  // }
  //
  // JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  //   return JavascriptChannel(
  //       name: 'Toaster',
  //       onMessageReceived: (JavascriptMessage message) {
  //         // ignore: deprecated_member_use
  //         Scaffold.of(context).showSnackBar(
  //           SnackBar(content: Text(message.message)),
  //         );
  //       });
  // }

}