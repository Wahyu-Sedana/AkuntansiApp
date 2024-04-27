import 'package:flutter/material.dart';
import 'enums.dart';
import 'helper.dart';

class ValidationHelper {
  final Function(bool value) isError;
  final TypeField typeField;
  final String? pwd;

  ValidationHelper({
    this.pwd = '',
    required this.isError,
    required this.typeField,
  });

  FormFieldValidator validate() {
    String? message;
    return (value) {
      final strValue = value as String;
      if (strValue.isEmpty) {
        message = "Please enter a valid value";
        isError(true);
      } else {
        switch (typeField) {
          case TypeField.email:
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp emailRegex = RegExp(pattern.toString());
            if (!emailRegex.hasMatch(strValue)) {
              message = "Invalid email";
              isError(true);
            } else {
              isError(false);
            }
            break;

          default:
            isError(false);
        }
      }
      return message;
    };
  }
}
