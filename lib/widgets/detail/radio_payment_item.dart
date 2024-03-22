import 'package:ecommerce_shopping_app/utils/const.dart';
import 'package:flutter/material.dart';

class RadioButtonItem extends StatefulWidget {
  final int value;
  final String text;
  final String imageAsset;
  final int groupValue;
  final Function(void) onChanged;

  RadioButtonItem({
    required this.value,
    required this.text,
    required this.imageAsset,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<RadioButtonItem> createState() => _RadioButtonItemState();
}

class _RadioButtonItemState extends State<RadioButtonItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensures full width
      height: 55,
      decoration: BoxDecoration(
        border: widget.value == widget.groupValue
            ? Border.all(width: 1, color: AssetsCustom.primaryColor)
            : Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(
                  value: widget.value,
                  groupValue: widget.groupValue,
                  onChanged: widget.onChanged,
                  activeColor: AssetsCustom.primaryColor,
                ),
                Text(
                  widget.text,
                  style: widget.value == widget.groupValue
                      ? const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)
                      : const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                ),
              ],
            ),
            Image.asset(
              widget.imageAsset,
              width: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
