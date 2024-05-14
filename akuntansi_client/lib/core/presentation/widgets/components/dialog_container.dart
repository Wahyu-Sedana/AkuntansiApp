import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  final Widget child;
  final bool withPadding;
  final bool withMargin;
  final EdgeInsetsGeometry? customPadding;
  const DialogContainer(
      {Key? key,
      required this.child,
      this.withPadding = true,
      this.withMargin = true,
      this.customPadding = const EdgeInsets.all(0)})
      : super(key: key);

  static const double _radius = 29.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            margin: withMargin ? const EdgeInsets.all(16.0) : null,
            padding: withPadding ? customPadding ?? const EdgeInsets.all(26.0) : null,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(_radius),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
