import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:flutter_laid_back/widget/image_selector.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

showImageSelectorBottomSheet(BuildContext? context,
    Function(File?)? onSelectedFile) {
  showModalBottomSheet(
      context: context!,
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return AnimationLimiter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) =>
                  ScaleAnimation(
                    duration: const Duration(milliseconds: 500),
                    child: widget,
                  ),
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const CustomText(
                    'گالری',
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  onTap: () async {
                    onSelectedFile!.call(
                        await ImageSelector.instance.openGallery(isNeedCrop: true));
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.videocam),
                  title: const CustomText('دوربین', textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,

                  ),
                  onTap: () async {
                    onSelectedFile!.call(
                        await ImageSelector.instance.openCamera(isNeedCrop: true));
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        );
      });
}

enum Type { GALLERY, CAMERA, FILE }
