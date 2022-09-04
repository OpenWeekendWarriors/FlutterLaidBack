import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/color_pallet.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/cached_network_image_widget.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';

class CustomDropDown extends StatefulWidget {
  final List<DropdownItem>? items;
  final Function(DropdownItem)? onSelection;
  final String? hint;

  final Color? bgColor;
  final Color? dropDownIconColor;
  final Color? borderColor;
  final Color? dbTextColor;

  final DropdownItem? iniValue;

  const CustomDropDown(
      {Key? key,
      this.items,
      this.dropDownIconColor,
      this.borderColor,
      this.onSelection,
      this.hint,
      this.bgColor,
      this.dbTextColor,
      this.iniValue})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  DropdownItem? selectedItem;

  @override
  void initState() {
    if (widget.iniValue != null) {
      selectedItem = widget.iniValue;
    }
    super.initState();
  }

  @override


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        border: Border.all(color: widget.borderColor ?? Colors.white),
        borderRadius: BorderRadius.circular(borderRadius),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.grey,
        //     blurRadius: 20.0,
        //     spreadRadius: 0.5,
        //     offset: Offset(1.0, 1.0),
        //   ),
        // ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButton(
        icon: Icon(
          Icons.arrow_drop_down_circle,
          color: widget.dropDownIconColor ?? Color(0xff525E7E),
        ),
        hint: CustomText(
          widget.hint ?? '',
          color:hintColor,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        items: widget.items?.map((DropdownItem item) {
          return DropdownMenuItem(
            value: item,
            child: Container(
              // decoration: BoxDecoration(
              // color: widget.bgColor??Colors.white,
              // borderRadius: BorderRadius.circular(borderRadius),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     blurRadius: 20.0,
              //     spreadRadius: 0.5,
              //     offset: Offset(1.0, 1.0),
              //   ),
              // ],
              // ),

              child: Row(
                children: [
                  item.icon == null
                      ? const SizedBox()
                      : item.icon!.startsWith('asset')
                          ? CircleAvatar(
                              radius: 15,
                              backgroundImage: Image.asset(item.icon! , fit: BoxFit.contain,).image,
                            )
                          : BuildCachedImageWidget(
                              imageUrl: item.icon!,
                              borderRadius: 30,
                              height: 24,
                              width: 24,
                            ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    item.name,
                    color: hintColor,
                  )
                ],
              ),
            ),
          );
        }).toList(),
        value: selectedItem,
        onChanged: (value) {
          setState(() {
            selectedItem = value as DropdownItem;
            widget.onSelection!.call(selectedItem!);
          });
        },
      ),
    );
  }
}



class DropdownItem {
  const DropdownItem(this.name, {this.icon , this.id});

  final String name;
  final int? id;
  final String? icon;
}