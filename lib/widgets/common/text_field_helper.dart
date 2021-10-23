import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/constants/radii.dart';

class TextFieldHelper {
  static final border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: Radii.textFieldRadius,
  );

  static InputDecoration getInputDecoration({
    String? hintText,
    String? label,
  }) {
    return InputDecoration(
      hintText: hintText,
      label: label == null ? null : Text(label),
      enabledBorder: border,
      border: border,
      focusedBorder: border,
      filled: true,
      fillColor: ColorConstants.grey.withOpacity(0.3),
    );
  }

  static Widget buildTextField({
    TextEditingController? controller,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    String? hintText,
    String? label,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: getInputDecoration(hintText: hintText, label: label),
      onChanged: (value) => onChanged?.call(value),
      validator: validator == null ? null : (value) => validator(value),
      onSaved: (value) => onSaved?.call(value),
    );
  }
}
