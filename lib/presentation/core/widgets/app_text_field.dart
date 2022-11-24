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
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconConstraints:
            const BoxConstraints(minHeight: 30, minWidth: 30),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
