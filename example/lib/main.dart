import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/laid_back_config.dart';
import 'package:flutter_laid_back/di/dependency.dart';
import 'package:flutter_laid_back/widget/custom_app_bar.dart';
import 'package:flutter_laid_back/widget/overlay.dart';
import 'package:flutter_laid_back/widget/text_field_widget.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';

void main() {
  injectLaidBackDependency(LaidBackConfig(textStyleBody: TextStyle(fontSize: 16)));
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
        'en',
        'US',
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
    double devicePixelRatio = Get.pixelRatio;
    TextStyle style38 = new TextStyle(
      inherit: true,
      fontSize: 38.0,
    );
    TextStyle style20 = new TextStyle(
      inherit: true,
      fontSize: 20.0,
    );

    return Scaffold(
        appBar: CustomAppbar(
          showLeading: false,
          bgColor: Colors.white,
          elevation: 50,
          actionIcon: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          title: CustomText("werwer"),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: CustomTextField(
              title: const CustomText(
                'user_name_or_mobile',
                fontWeight: FontWeight.bold,
              ),
              textColor: Colors.black,
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.person_outline_outlined),
              borderRadius: 10,
              onFieldSubmitted: (value) {},
              inputFormatters: [],
              validator: (value) {
                return null;
              },
            ),
          ),

          // new Text(
          //   'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
          //   style: style38,
          // ),
          new Text(
            'size (pixels): w=${Get.width * devicePixelRatio}, h=${Get.size.height * devicePixelRatio}',
            style: style20,
          ),
          new Text(
            'devicePixelRatio: $devicePixelRatio',
            style: style20,
          ),
          new Text(
            'size: w=${Get.width}, h=${Get.height}',
            style: style20,
          ),
          new Text(
            'textScaleFactor: w=${Get.textScaleFactor}',
            style: style20,
          ),

          // Container(width: ,height: ,color: Colors.blue,)



          // Column(
          //   children: [
          //     CustomText('سلام صبح یخیر یبسب سیب سیبسی بسشسی شسی شسیشس یشس یشسی شسی شسی شسی سیشسی شسی سش یشس یشسی ی بسیب یسب یسبسیب سیب سی', startWidget: Icon(Icons.add)),
          //     CustomText('سلام صبح یخیر یبسب سیب سیبسی بسشسی شسی شسیشس یشس یشسی شسی شسی شسی سیشسی شسی سش یشس یشسی ی بسیب یسب یسبسیب سیب سی', startWidget: Icon(Icons.add)),
          //   ],
          // ),
        ]),

    );
  }
}
