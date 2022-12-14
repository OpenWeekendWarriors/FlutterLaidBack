import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/custom_app_bar.dart';
import 'package:flutter_laid_back/widget/custom_drop_down.dart';
import 'package:flutter_laid_back/widget/snackbar.dart';
import 'package:flutter_laid_back/widget/text_field_widget.dart';
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

              CustomTextField(errorText: '',
                lable: 'username',
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password.';
                }
                if (value.length < 8 || value.length > 45) {
                  return 'password is not correct';
                }
                return null;
              },)

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
            {
              showSnackBar(text: 'asdkfjaskdj'),

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
