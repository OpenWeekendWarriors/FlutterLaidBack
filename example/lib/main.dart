
import 'package:example/color_schemes.dart';
import 'package:example/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/button_widget.dart';
import 'package:flutter_laid_back/widget/svg_loader.dart';
import 'package:flutter_laid_back/widget/text_field_widget.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('fa', 'IR'),
      // theme: Themes().lightTheme,

      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme,),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),


      // theme: FlexThemeData.light(scheme: FlexScheme.material),
      // The Mandy red, dark theme.
      // darkTheme: FlexThemeData.dark(scheme: FlexScheme.material),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text("Material Theme Builder"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              CustomButton(title: 'teststtst',),
              CustomTextField(lable: 'سیبسیب',suffixIcon: Icon(Icons.ac_unit),)
            ],
          ),
        ),
        floatingActionButton:
        FloatingActionButton(onPressed: () => {}, tooltip: 'Increment'));
  }
}
