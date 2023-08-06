// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InnputField extends StatefulWidget {
  final TextEditingController controller;
  final String formTitle;
  final String formHintTxt;
  final IconData? iconData;
  const InnputField(
      {super.key,
      required this.controller,
      required this.formTitle,
      required this.formHintTxt,
      this.iconData});

  @override
  State<InnputField> createState() => _InnputFieldState();
}

class _InnputFieldState extends State<InnputField> {
  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textLightColor = Color(0xff717171);
  static const Color textBlackColor = Color(0xff232323);
  // static const Color clearButtonColor = Color(0xffFF7511);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.formTitle,
          style: TextStyle(
              color: textBlackColor, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: containerColor,
            hintText: widget.formHintTxt,
            helperStyle: TextStyle(color: textLightColor),
            suffixIcon:
                widget.iconData != null ? Icon(widget.iconData) : Text(''),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          controller: widget.controller,
          onFieldSubmitted: (value) {
            if (value.isEmpty) {
              widget.controller.text = '0.00';
            }
            widget.controller.text = value;
            setState(() {});
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter an amount";
            }
            return null;
          },
        ),
      ],
    );
  }
}
