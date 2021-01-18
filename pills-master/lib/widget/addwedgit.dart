import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pills_reminder/utilities/Colors.dart';

class AddWidget extends StatelessWidget {
  @override
  String label;
  Function onChanged;
  String initialValue;
  AddWidget({@required this.label, this.onChanged, this.initialValue});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
          labelText: translator.translate(label),
          focusColor: maincolor,
          hoverColor: maincolor,
          fillColor: maincolor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
