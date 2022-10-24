import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
          useMaterial3: true, colorScheme: lightColorScheme, appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)),
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
        appBar: AppBar(
          elevation: 2,
          title: const Text("Material Theme Builder"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      elevation: 25,
                      content: const Text('Hello, I am a Material Banner'),
                      leading: const Icon(Icons.info),
                      backgroundColor: Colors.green,
                      actions: [
                        TextButton(
                          child: const Text('Dismiss'),
                          onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                        ),
                      ],
                    ),
                  ),
                },
            tooltip: 'Increment'));
  }
}
