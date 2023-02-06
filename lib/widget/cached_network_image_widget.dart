
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/custom_loading_widget.dart';
import 'package:get/get.dart';

class BuildCachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Widget? defult;
  final Color? borderColor;
  final double? borderRadius;
  final Object? heroTag;

  const BuildCachedImageWidget(
      {Key? key, required this.imageUrl, this.width, this.height, this.defult, this.borderRadius, this.heroTag, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWidget();
  }

  Container buildWidget() {
    return Container(
      width: width ?? 30.0,
      height: height ?? 30.0,
      decoration: BoxDecoration(
        border:  Border.all(color: borderColor ?? Get.theme.primaryColorDark, width: 1.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        child: imageUrl.isEmpty
            ? SizedBox(
                width: width ?? 30.0,
                height: height ?? 30.0,
                child: defult ??
                    // Image.asset(
                    //   Images.empty_Image,
                    //   fit: BoxFit.cover,
                    // )
                    Container(
                      color: Colors.grey,
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: Get.theme.primaryColor,
                          size: 45.0,
                        ),
                      ),
                    ))
            : imageUrl.contains('http')
                ? GetPlatform.isWeb == false
                    ? CachedNetworkImage(
                        width: width ?? 30.0,
                        height: height ?? 30.0,

                        fit: BoxFit.cover,
                        fadeInCurve: Curves.easeIn,
                        fadeInDuration: const Duration(milliseconds: 100),
                        imageUrl:
                            imageUrl == 'test' ? 'https://unsplash.com/photos/QimEwRMvK6w/download?force=true&w=640' : imageUrl,
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.broken_image_rounded);
                        },
                        placeholder: (context, url) => customLoadingWidget(radios: width))
                    : SizedBox(
                        height: height,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ))
                : SizedBox(
                    height: height,
                    child: Image.file(
                      File(imageUrl),
                      fit: BoxFit.cover,
                    )),

        // placeholder: (context, url) => Shimmer.fromColors(
        //     baseColor: Colors.indigo,
        //     highlightColor: Colors.lightGreen.shade200,
        //     child:  SizedBox(
        //       height: 150,
        //       width: 200,
        //     ) )),
      ),
    );
  }
}
