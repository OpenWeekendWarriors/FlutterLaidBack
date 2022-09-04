import 'package:flutter/material.dart';
import 'package:flutter_laid_back/widget/svg_loader.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final Icon? leadingIcon;
  final VoidCallback?leadingClick;
  final Icon? actionIcon;
  final Widget? title;
  final Icon? actionIcon1;
  final VoidCallback? actionClick;
  final VoidCallback? actionClick1;
  final bool showLeading;

  CustomAppbar(
      {this.leadingIcon,
      this.leadingClick,
      this.actionIcon,
      this.actionIcon1,
      this.actionClick,
      this.actionClick1,
      this.title,
      this.showLeading = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5.0,
        brightness: Brightness.light,
        title: title ?? SizedBox(),
        leading: !showLeading
            ? const SizedBox()
            : (leadingIcon == null && showLeading)
                ? BackButton(
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
