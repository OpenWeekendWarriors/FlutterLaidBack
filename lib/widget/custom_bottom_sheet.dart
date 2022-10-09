 import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/const.dart';
 import 'package:get/get.dart';
 import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
showCustomBottomSheet({List<Widget>? widget , VoidCallback? callback}){

  showModalBottomSheet(
      context: Get.context!,
      elevation: 10,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return AnimationLimiter(
          child: Container(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: EdgeInsets.all(dim_small),
              child: Wrap(
                // mainAxisSize: MainAxisSize.min,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => ScaleAnimation(
                    duration: const Duration(milliseconds: 500),
                    child: widget,
                  ),
                  children:widget! ,
                ),
              ),
            ),
          ),
        );
      });
}
