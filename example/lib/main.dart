import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/button_widget.dart';
import 'package:flutter_laid_back/widget/cached_network_image_widget.dart';
import 'package:flutter_laid_back/widget/custom_app_bar.dart';
import 'package:flutter_laid_back/widget/custom_popup_dialog.dart';
import 'package:flutter_laid_back/widget/overlay.dart';
import 'package:flutter_laid_back/widget/snackbar.dart';
import 'package:flutter_laid_back/widget/text_field_widget.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Themes().lightTheme,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      locale: Locale(
        'fa',
        'IR',
      ),
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  var focusNode = FocusNode();

  RxBool isCh = false.obs;

  var nameController = TextEditingController(text: 'شسیبسظیبس بسیل یبلیب');

  Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var overlay = LoadingOverlay.of(Get.context);

    return Scaffold(
        appBar: CustomAppbar(
          showLeading: false,
          bgColor: Colors.white,
          elevation: 50,
          title: Row(
            children: [],
          ),
        ),
        body: const BuildCachedImageWidget(
          imageUrl:
          'https://sfl2.smart-boom.com:8571/files/35645bfd-bcb5-4b95-aa0e-ff61dfb07f0c/app.png',
          borderColor: Colors.transparent,
          height: double.infinity,
          width: double.maxFinite,

        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              FloatingActionButton(
              backgroundColor: Colors.red,
                  onPressed: () => {
                          overlay.show(timeoutInSec: 2),
                        // showSnackBar(text: 'asdkfjaskdj'),
                        // showPopupDialog(context, title: 'َُِسیسیشی', message: 'یسبسیبسیبسبسیبسیبسیب'),

                        // ScaffoldMessenger.of(context).showMaterialBanner(
                        //   MaterialBanner(
                        //     elevation: 25,
                        //     content: const Text('Hello, I am a Material Banner'),
                        //     leading: const Icon(Icons.info),
                        //     backgroundColor: Colors.green,
                        //     actions: [
                        //       TextButton(
                        //         child: const Text('Dismiss'),
                        //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      },
                  tooltip: 'Increment'),
              FloatingActionButton(backgroundColor: Colors.blue,
                  onPressed: () => {
                          overlay.hide(),
                        // showSnackBar(text: 'asdkfjaskdj'),
                        // showPopupDialog(context, title: 'َُِسیسیشی', message: 'یسبسیبسیبسبسیبسیبسیب'),

                        // ScaffoldMessenger.of(context).showMaterialBanner(
                        //   MaterialBanner(
                        //     elevation: 25,
                        //     content: const Text('Hello, I am a Material Banner'),
                        //     leading: const Icon(Icons.info),
                        //     backgroundColor: Colors.green,
                        //     actions: [
                        //       TextButton(
                        //         child: const Text('Dismiss'),
                        //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      },
                  tooltip: 'Increment'),
            ],
          ),
        ));
  }
}
