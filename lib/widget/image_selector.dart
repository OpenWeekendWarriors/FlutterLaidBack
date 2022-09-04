import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector {
  static ImageSelector instance = ImageSelector._internal();

  factory ImageSelector() {
    return instance;
  }

  ImageSelector._internal();

  Future<File?> openGallery({bool isNeedCrop = false}) async {
    try {
      PickedFile? imageFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      if (isNeedCrop && GetPlatform.isWeb ==false) {
        File?croppedImage = await cropImage(File(imageFile!.path));
        return croppedImage;
      }
      return File(imageFile!.path);
    } catch (e) {
      // debugPrint();
    }
    return null;
  }

  Future<File?> openCamera({bool isNeedCrop = false}) async {
    // var status = await Permission.camera.status;
    // if (status.isGranted) {
    try {
      PickedFile? imageFile = await ImagePicker.platform.pickImage(source: ImageSource.camera);
      if (isNeedCrop) {
        File? cropedImage = await cropImage(File(imageFile!.path));
        return cropedImage;
      }
      return File(imageFile!.path);
    } catch (e) {
      // debugPrint(e);
    }
    // }
    return null;
  }


  Future<File?> cropImage(File image) async {
    // File? croppedFile = await ImageCropper.cropImage(
    //     sourcePath: image.path,
    //     compressQuality:60 ,
    //     aspectRatioPresets: Platform.isAndroid
    //         ? [
    //             CropAspectRatioPreset.square,
    //             CropAspectRatioPreset.ratio3x2,
    //             CropAspectRatioPreset.original,
    //             CropAspectRatioPreset.ratio4x3,
    //             CropAspectRatioPreset.ratio16x9
    //           ]
    //         : [
    //             CropAspectRatioPreset.original,
    //             CropAspectRatioPreset.square,
    //             CropAspectRatioPreset.ratio3x2,
    //             CropAspectRatioPreset.ratio4x3,
    //             CropAspectRatioPreset.ratio5x3,
    //             CropAspectRatioPreset.ratio5x4,
    //             CropAspectRatioPreset.ratio7x5,
    //             CropAspectRatioPreset.ratio16x9
    //           ],
    //     androidUiSettings: AndroidUiSettings(
    //         toolbarTitle: 'برش تصویر',
    //         toolbarColor: accentColor,
    //         toolbarWidgetColor: Colors.white,
    //         initAspectRatio: CropAspectRatioPreset.original,
    //         lockAspectRatio: false),
    //     iosUiSettings: IOSUiSettings(
    //       title: 'برش تصویر',
    //     ));
    // if (croppedFile != null) {
    //   return croppedFile;
    // } else {
    //   return null;
    // }
  }
}
