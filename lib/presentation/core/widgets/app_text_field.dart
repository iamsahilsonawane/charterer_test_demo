import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  final Widget? suffixIcon;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconConstraints:
            const BoxConstraints(minHeight: 30, minWidth: 30),
        filled: true,
        fillColor: const Color(0xFFE9EEF0),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
