import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/custom_drop_down.dart';
import 'package:flutter_laid_back/widget/text_field_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: Themes().lightTheme,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // CustomDropDown(
              //   items: [DropdownItem('1'), DropdownItem('2')],
              //   borderRadios: 5,
              //   onSelection: (value){
              //
              //   },
              //   bgColordropdown: Colors.red,
              //   borderColor: Colors.blue,
              // ),
              CustomTextField(
                  textInputAction: TextInputAction.next,
                 focusBorderColor: Colors.yellow,unFocusBorderColor: Colors.red),
              CustomTextField(
                  textInputAction: TextInputAction.search,
               focusBorderColor: Colors.yellow,unFocusBorderColor: Colors.red)

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () => {}, tooltip: 'Increment'));
  }
}
