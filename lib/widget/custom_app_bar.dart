import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/svg_loader.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leadingIcon;
  final VoidCallback?leadingClick;
  final Widget? actionIcon;
  final Widget? title;
  final Widget? actionIcon1;
  final VoidCallback? actionClick;
  final VoidCallback? actionClick1;
  final bool showLeading;
  final Color? bgColor;
  final double? elevation;


  CustomAppbar(
      {this.leadingIcon,
      this.leadingClick,
      this.actionIcon,
      this.actionIcon1,
      this.actionClick,
      this.actionClick1,
      this.title,
      this.bgColor,
      this.elevation,
      this.showLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:bgColor?? Get.theme.appBarTheme.backgroundColor,
        centerTitle: false,
        elevation: elevation?? 0.0,
        brightness: Get.theme.brightness,
        title: title ?? const SizedBox(),
        leading: !showLeading
            ? null
            : (leadingIcon == null && showLeading)
                ? BackButton(
                    color: Get.theme.iconTheme.color,
                    onPressed: () {
                      Get.back();
                    },
                  )
                : IconButton(onPressed: leadingClick, icon: leadingIcon!),
        actions: [
          actionIcon == null ? SizedBox() : IconButton(icon: actionIcon!, onPressed: () => actionClick!()),
          actionIcon1 == null ? SizedBox() : IconButton(icon: actionIcon1!, onPressed: () => actionClick1!())
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
