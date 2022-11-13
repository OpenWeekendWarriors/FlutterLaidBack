import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatefulWidget {
  Function(bool)? isChecked;
  Widget? child;
  Color? fillColor;
  Color? borderColor;
  Color? checkColor;
  double? borderRadius;
  Size? size;
  FocusNode? focusNode;

  CustomCheckBox({Key? key,this.focusNode, this.size = const Size(20, 20),this.borderRadius ,this.child, this.isChecked , this.borderColor,this.fillColor ,this.checkColor}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode:widget.focusNode,
      onTap: () {
        setState(() {
          _value = !_value;
          widget.isChecked!.call(_value);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.child??const SizedBox(),
          AnimatedContainer(
            height:widget.size?.height,
            width: widget.size?.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: _value
                    ? (widget.fillColor?? Get.theme.checkboxTheme.fillColor
                        ?.resolve(<MaterialState>{MaterialState.selected}))
                    : Colors.transparent,
                border: Border.all(
                  color: (widget.borderColor?? Get.theme.checkboxTheme.checkColor!
                      .resolve(<MaterialState>{MaterialState.selected})!),
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius??5)),
            alignment:
            _value ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: _value
                ? Icon(
                    Icons.check,
                    size: widget.size!.width /1.2,
                    color: widget.checkColor??Get.theme.primaryColor,
                  )
                : const SizedBox(),
          ),

        ],
      ),
    );
  }
}
