import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_laid_back/conf/laid_back_config.dart';
import 'package:flutter_laid_back/di/dependency.dart';
import 'package:flutter_laid_back/extention/date_time_extention.dart';
import 'package:flutter_laid_back/widget/button_widget.dart';
import 'package:flutter_laid_back/widget/custom_app_bar.dart';
import 'package:flutter_laid_back/widget/overlay.dart';
import 'package:flutter_laid_back/widget/svg_loader.dart';
import 'package:flutter_laid_back/widget/text_field_widget.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';

void main() {
  injectLaidBackDependency(LaidBackConfig(textStyleBody: const TextStyle(fontSize: 16)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.transparent, // transparent status bar
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
            ),
          ),
          scaffoldBackgroundColor: Colors.red,
          // useMaterial3: true,
          colorScheme: lightColorScheme,
          primaryColor: Colors.purple,),

      // theme: Themes().lightTheme,
      // theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      // darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      locale: const Locale(
        'en',
        'US',
      ),
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
    TextStyle style38 = const TextStyle(
      inherit: true,
      fontSize: 38.0,
    );
    TextStyle style20 = const TextStyle(
      inherit: true,
      fontSize: 20.0,
    );

    return Scaffold(
        appBar: CustomAppbar(
          shadowColor: Colors.grey,
          elevation: 5,
          bgColor: Colors.grey,
          showLeading: false,
          actionIcon:
              const Icon(Icons.delete_outline_rounded),
          actionIcon1:
               IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.arrow_forward)),
          actionClick: () {

          },
          actionClick1: () {
          },
        ),
        body: Column(children: [
          
          svgLoader('http://192.168.1.165:8571/files/7b45130e-e2b4-4bc8-afa7-f2db9bf26d64/app.svg', color: Colors.green),
          
          
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


          Icon(Icons.add_circle,size: 50,),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.add_circle,size: 50,),),

          CustomButton(title: 'convert',onTap: (){
            DateTime dateTime = DateTime.now();
            print(dateTime.timeZoneName);
            print(dateTime.timeZoneOffset.toString());
            print(dateTime.timeZoneOffset);
            // print('>>>>>>>>>>>>>>>' + DateTime(2023,5,23,13,03,00).toLocal().toString());

          } ),

          Text(
            'size (pixels): w=${Get.width * devicePixelRatio}, h=${Get.size.height * devicePixelRatio}',
            style: style20,
          ),
          Text(
            'devicePixelRatio: $devicePixelRatio',
            style: style20,
          ),
          Text(
            'size: w=${Get.width}, h=${Get.height}',
            style: style20,
          ),
          Text(
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
