import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leadingIcon;
  final VoidCallback? leadingClick;
  final Widget? actionIcon;
  final Widget? title;
  final Widget? actionIcon1;
  final VoidCallback? actionClick;
  final VoidCallback? actionClick1;
  final bool showLeading;
  final Color? bgColor;
  final double? elevation;
  final Color? shadowColor;

  CustomAppbar(
      {this.leadingIcon,
      this.leadingClick,
      this.actionIcon,
      this.actionIcon1,
      this.actionClick,
      this.actionClick1,
      this.title,
      this.bgColor,
      this.shadowColor,
      this.elevation,
      this.showLeading = true});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
          bottomOpacity: 0.0,
          backgroundColor:bgColor?? Get.theme.appBarTheme.backgroundColor,
          centerTitle: true,
          elevation: elevation?? 0.0,
          surfaceTintColor:bgColor?? Get.theme.appBarTheme.backgroundColor,
          shadowColor: shadowColor??Get.theme.appBarTheme.shadowColor,
          title: title ?? const SizedBox(),
          automaticallyImplyLeading: showLeading,
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
          ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
