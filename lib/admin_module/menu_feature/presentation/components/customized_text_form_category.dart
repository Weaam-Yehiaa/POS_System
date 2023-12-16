import 'package:flutter/material.dart';

Widget customizedTextFormCategory({
  required TextEditingController controller,
  required String hintText,
  double width=90,
  textType =TextInputType.text,
bool validate=true,
  String? validatorText,
})=>SizedBox(
  width: width,
  height: 50,
  child: Material(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.grey, ),
    ),
    color: Colors.white,
    child: TextFormField(
      textAlign: TextAlign.center,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        } else if (!validate) {
          return validatorText;
        }
        return null;
      },
      decoration:
      InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle:const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
          isDense: true,
      ),
      controller: controller,
      keyboardType:textType ,
    ),
  ),
);