import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget CustomTextFormField({
  required TextEditingController? controller,
  required TextInputType? keyboardType,
  ValueChanged<String>? submit,
  required FormFieldValidator<String>?validator,
  required String label,
  required String hintText,
  required IconData prefixIcon,
})=>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: submit,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        isDense: true,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        border:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        focusedErrorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
      ),
    );