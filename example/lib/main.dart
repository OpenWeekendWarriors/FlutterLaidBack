import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/button_widget.dart';
import 'package:flutter_laid_back/widget/custom_app_bar.dart';
import 'package:flutter_laid_back/widget/custom_checkbox.dart';
import 'package:flutter_laid_back/widget/custom_drop_down.dart';
import 'package:flutter_laid_back/widget/custom_key_listener.dart';
import 'package:flutter_laid_back/widget/custom_popup_dialog.dart';
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
      locale: Locale( 'fa','IR',),
      themeMode: ThemeMode.system,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  var focusNode = FocusNode();

  RxBool isCh = false.obs;

  Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          showLeading: false,
          bgColor: Colors.white,
          elevation: 50,
          title: Row(
            children: [],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [

                CustomText('فثسفسفسف' , textAlign: TextAlign.end , startWidget: Icon(Icons.add),endWidget: Icon(Icons.add)),

              // CustomDropDown(
              //   hint: 'انتخاب زبان',
              //   bgColor: Colors.white,
              //   items: const [DropdownItem('فارسی'), DropdownItem('انگلیسی')],
              //   borderColor: Colors.white.withAlpha(25),
              //   borderRadios: 10,
              //   isDense: false,
              //   bgColordropdown: Colors.white,
              //   arrowIcon: const Icon(Icons.keyboard_arrow_down,color: Colors.green,),
              //   isExpand: false,
              //   onSelection: (value){
              //     // logic.langSelection = value;
              //   },
              // )

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
            {
              showSnackBar(text: 'asdkfjaskdj'),
              showPopupDialog(context , title: 'َُِسیسیشی' , message: 'یسبسیبسیبسبسیبسیبسیب'),

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
            tooltip: 'Increment'));
  }
}
