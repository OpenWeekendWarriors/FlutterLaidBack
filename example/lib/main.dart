import 'package:example/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/button_widget.dart';
import 'package:flutter_laid_back/widget/custom_app_bar.dart';
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.network(
            'https://foyr.com/learn/wp-content/uploads/2021/08/design-your-dream-home.jpg',
            fit: BoxFit.cover,
          ).image)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomButton(
                    title: 'dialog',
                    onTap: () async {
                      // showDialog(context: context, builder: builder)

                      // showDialog(
                      //     context: context,
                      //     builder: (context) => const BlurredDialog(
                      //       height: 100,
                      //       width: 200,
                      //       // child can be any widget.
                      //       child: Center(child: Text("Dialog")),
                      //     ));

                      showPopupDialog(context, title: 'دستگاه شماره 1', positiveButton: () {
                        print('sddsfsdf');
                      },
                          message: 'از حذف دستگاه اطمینان دارید؟',
                          positiveText: 'تایید',
                          negativeText: 'یسسی',
                          isBlur: true);
                    }),

                CustomTextField(
                  title: const CustomText(
                    'user_name',
                    fontWeight: FontWeight.bold,
                  ),
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  textColor: Colors.black,
                  prefixIcon: const Icon(Icons.person_outline_outlined),
                  borderRadius: 10,
                  inputFormatters: [
                    // FilteringTextInputFormatter.allow(
                    //   RegExp("[A-Za-z0-9]"),
                    // ),
                  ],
                  validator: (value) {
                    // if (value == null || value.isEmpty) {
                    //   // return please_enter_username.tr;
                    // }
                    // if ((value.length < 6 || value.length > 45) &&
                    //     (!usernameValidatorLength
                    //         .hasMatch(value))) {
                    //   return username_is_not_correct.tr;
                    // }
                    //
                    // if (logic.isNumeric(value[0])) {
                    //   return username_is_not_correct.tr;
                    // }
                    // return null;
                  },
                ),

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
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  showSnackBar(text: 'asdkfjaskdj'),
                  showPopupDialog(context, title: 'َُِسیسیشی', message: 'یسبسیبسیبسبسیبسیبسیب'),

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
