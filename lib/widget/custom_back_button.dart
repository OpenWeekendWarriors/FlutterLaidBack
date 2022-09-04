import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomBackButton extends StatelessWidget {
  Color? color;
  VoidCallback? onTap;

  CustomBackButton({Key? key , this.color ,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          RawMaterialButton(
            elevation: 3,
            onPressed: () {
              if(onTap ==null) {
                Get.back();
              }else{
                onTap!.call();
              }
            },
            fillColor: color??Colors.white,
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 24.0,
            ),
            // padding: EdgeInsets.all(8.0),
            shape: const CircleBorder(),
          ),
        ],
      ),
    );
  }
}
