import 'package:flutter/material.dart';

class DefaultAppPadding extends StatelessWidget {
  static const horizontalAppPaddingConstant = 16.0;
  static const verticalAppPaddingConstant = 32.0;
  static const EdgeInsets defaultPaddingInsets = EdgeInsets.symmetric(
      horizontal: horizontalAppPaddingConstant,
      vertical: verticalAppPaddingConstant);

  const DefaultAppPadding({Key? key, required this.child})
      : padding = const EdgeInsets.symmetric(
            horizontal: horizontalAppPaddingConstant,
            vertical: verticalAppPaddingConstant),
        super(key: key);

  const DefaultAppPadding.onlyHorizontal({Key? key, required this.child})
      : padding = const EdgeInsets.symmetric(
            horizontal: horizontalAppPaddingConstant),
        super(key: key);

  const DefaultAppPadding.onlyVertical({Key? key, required this.child})
      : padding =
            const EdgeInsets.symmetric(vertical: verticalAppPaddingConstant),
        super(key: key);

  const DefaultAppPadding.custom(
      {Key? key, required this.child, required this.padding})
      : super(key: key);

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
