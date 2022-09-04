import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/color_pallet.dart';
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
            color: _value ? yellowColor : Colors.transparent,
            border: Border.all(
              color: yellowColor,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: _value
            ? const Icon(
                Icons.check,
                size: 12.0,
                color: Color(0xFF051436),
              )
            : const SizedBox(),
      ),
    );
  }
}
