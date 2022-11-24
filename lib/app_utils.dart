import 'package:flutter/material.dart';

class AppUtils {
  static Future<void> getDatePicker(BuildContext context,
      {required DateTime initialDate,
      required Function(DateTime date) onDatePicked,
      DateTime? firstDate}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null && picked != initialDate) onDatePicked(picked);
  }

  static bool emailValidation(String value) {
    final validEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return validEmail.hasMatch(value);
  }

  static String? fieldEmpty(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return "Field cannot be empty";
    }
  }

  static bool numericValidation(String value) {
    final validNum = RegExp(r"^[1-9]\d*(\.\d+)?$");
    return validNum.hasMatch(value);
  }

  static String? emailValidate(String? value) {
    if (value!.isNotEmpty) {
      if (emailValidation(value.trim())) {
        return null;
      } else {
        return "Invalid Email";
      }
    } else {
      return "Enter your email";
    }
  }

  static String? numberValidate(String? value) {
    if (value!.isNotEmpty) {
      if (numericValidation(value.trim())) {
        return null;
      } else {
        return "Invalid Number";
      }
    } else {
      return "Field cannot be empty";
    }
  }

  static String? passwordValidate(String? value) {
    if (value!.isNotEmpty) {
      if (value.length < 6) {
        return "Password must be at least 6 characters";
      } else {
        return null;
      }
    } else {
      return "Enter your password";
    }
  }

  static String? passwordValidateWithEquality(String? value, String? value2) {
    if (value!.isNotEmpty) {
      if (value.length < 6) {
        return "Password must be at least 6 characters";
      } else if (value != value2) {
        return "Passwords do not match";
      } else {
        return null;
      }
    } else {
      return "Enter your password";
    }
  }

  static String? phoneValidate(String? value) {
    if (value!.isNotEmpty) {
      if (value.length < 10 || value.length > 10) {
        return "Phone number must be 10 digits";
      } else {
        return null;
      }
    } else {
      return "Field cannot be empty";
    }
  }
}
