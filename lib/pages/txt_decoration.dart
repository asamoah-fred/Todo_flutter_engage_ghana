import 'package:flutter/material.dart';

InputDecoration textInputDecoration({
  String hint,
  String label,
  IconData picon,
  IconButton sicon,
}) {
  return InputDecoration(
    hintText: hint,
    labelText: label,
    hintStyle: TextStyle(color: Color(0xffB0B0B0)),
    suffixIcon: sicon,
    labelStyle: TextStyle(color: Color(0xff9C9C9C)),
    contentPadding:
        EdgeInsets.symmetric(vertical: 5, horizontal: picon == null ? 16 : 0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 0.6, color: Color(0xffCDCDCD)),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      borderSide: BorderSide(width: 0.6, color: Color(0xffCDCDCD)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Color(0xffCDCDCD)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
  );
}
