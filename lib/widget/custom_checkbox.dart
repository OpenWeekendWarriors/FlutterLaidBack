import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatefulWidget {
  Function(bool)? isChecked;
  Widget? child;

  CustomCheckBox({Key? key, this.child, this.isChecked}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.isChecked!.call(_value);
        });
      },
      child: Container(
        height: 20,
        width: 20,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: _value
                ? Get.theme.checkboxTheme.fillColor
                    ?.resolve(<MaterialState>{MaterialState.selected})
                : Colors.transparent,
            border: Border.all(
              color: Get.theme.checkboxTheme.checkColor!
                  .resolve(<MaterialState>{MaterialState.selected})!,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: _value
            ? Icon(
                Icons.check,
                size: 12.0,
                color: Get.theme.primaryColor,
              )
            : const SizedBox(),
      ),
    );
  }
}
