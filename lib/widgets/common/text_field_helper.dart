import 'package:flutter/material.dart';
import 'package:groceries_app/constants/radii.dart';

class TextFieldHelper {
  static final border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: Radii.textFieldRadius,
  );

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
      decoration: InputDecoration(
        hintText: hintText,
        label: label == null ? null : Text(label),
      ),
      onChanged: (value) => onChanged?.call(value),
      validator: validator == null ? null : (value) => validator(value),
      onSaved: (value) => onSaved?.call(value),
    );
  }
}
