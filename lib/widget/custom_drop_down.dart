import 'package:flutter/material.dart';
import 'package:flutter_laid_back/conf/const.dart';
import 'package:flutter_laid_back/widget/cached_network_image_widget.dart';
import 'package:flutter_laid_back/widget/text_widget.dart';
import 'package:get/get.dart';

class CustomDropDown extends StatefulWidget {
  final List<DropdownItem>? items;
  final Function(DropdownItem)? onSelection;
  final String? hint;
  final double? borderRadios;
  final Color? bgColor;
  final Color? dropDownIconColor;
  final Color? borderColor;
  final Color? dbTextColor;
  final Color? bgColordropdown;
  final Icon? arrowIcon;
  final bool? isExpand;
  final DropdownItem? iniValue;
  final EdgeInsets? margin;
  final bool? isDense;

  const CustomDropDown(
      {Key? key,
      this.items,
      this.dropDownIconColor,
      this.borderRadios,
      this.borderColor,
      this.onSelection,
      this.hint,
      this.bgColor,
      this.arrowIcon,
      this.dbTextColor,
      this.bgColordropdown,
      this.isExpand,
      this.margin,
      this.isDense,
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
        borderRadius: BorderRadius.circular(widget.borderRadios ?? brd_radius_medium),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButton(
        dropdownColor: widget.bgColordropdown ?? Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadios ?? 0)),
        icon: widget.arrowIcon ??
            Icon(
              Icons.arrow_drop_down_circle,
              color: widget.dropDownIconColor ?? Get.theme.iconTheme.color,
            ),
        elevation: 50,
        isDense: widget.isDense ?? false,
        style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold , height: 60),
        hint: CustomText(
          widget.hint ?? '',
          color: widget.dbTextColor ?? Get.theme.hintColor,
        ),
        isExpanded: widget.isExpand ?? true,
        underline: const SizedBox(),
        items: widget.items?.map((DropdownItem item) {
          return DropdownMenuItem(
            value: item,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                item.icon == null
                    ? const SizedBox()
                    : item.icon!.startsWith('asset')
                        ? CircleAvatar(
                            radius: 15,
                            backgroundImage: Image.asset(
                              item.icon!,
                              fit: BoxFit.contain,
                            ).image,
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
                  color: widget.dbTextColor ?? Get.theme.hintColor,
                )
              ],
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
  const DropdownItem(this.name, {this.icon, this.id});

  final String name;
  final int? id;
  final String? icon;
}
