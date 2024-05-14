import 'package:akuntansi_client/core/utils/enums.dart';
import 'package:flutter/material.dart';

class DialogButton {
  late Widget _button;

  // constructs
  DialogButton();
  DialogButton.setNegativeButton(
      {String? text, Color? color, required Function action, required dialogStyle style}) {
    _button = NegativeButton(
      style: style,
      action: action,
      text: text,
      color: color,
    );
  }
  DialogButton.setPositiveButton(
      {String? text, Color? color, required Function action, required dialogStyle style}) {
    _button = PositiveButton(
      style: style,
      action: action,
      text: text,
      color: color,
    );
  }
  DialogButton.setOkayButton({required Function action}) {
    _button = OkayButton(action: action);
  }

  // getter
  Widget get button => _button;
  Widget get closeButton => const CloseButton();
}

extension DialogButtonStyles on ButtonStyle {
  ButtonStyle roundedButtonStyle(Color color) => ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        textStyle: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      );
  ButtonStyle textButtonStyle(Color color) => TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        primary: color,
      );
}

class NegativeButton extends StatelessWidget {
  final dialogStyle style;
  final Function action;
  final String? text;
  final Color? color;
  const NegativeButton({Key? key, required this.action, required this.style, this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == dialogStyle.style1) {
      // return text button
      return TextButton(
        onPressed: () => action(),
        child: Text(text ?? 'no'),
        style: const ButtonStyle().textButtonStyle(color ?? Colors.blue),
      );
    } else {
      // return rounded filled button
      return ElevatedButton(
        onPressed: () => action(),
        child: Text(text ?? 'no'),
        style: const ButtonStyle().roundedButtonStyle(color ?? Colors.black54),
      );
    }
  }
}

class PositiveButton extends StatelessWidget {
  final dialogStyle style;
  final Function action;
  final String? text;
  final Color? color;
  const PositiveButton({Key? key, required this.action, required this.style, this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == dialogStyle.style1) {
      // return text button
      return TextButton(
        onPressed: () => action(),
        child: Text(text ?? 'yes'),
        style: const ButtonStyle().textButtonStyle(color ?? Colors.red),
      );
    } else {
      // return rounded filled button
      return ElevatedButton(
        onPressed: () => action(),
        child: Text(text ?? 'yes'),
        style: const ButtonStyle().roundedButtonStyle(color ?? Colors.black),
      );
    }
  }
}

class OkayButton extends StatelessWidget {
  final Function action;
  const OkayButton({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => action(),
      child: const Text(
        'OK',
      ),
      style: const ButtonStyle().textButtonStyle(Colors.black),
    );
  }
}

// class CloseButton extends StatelessWidget {
//   const CloseButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         customBorder: const CircleBorder(),
//         onTap: () => Navigator.pop(context),
//         child: Image.asset(
//           ASSETS_CLOSE,
//           color: Colors.black,
//           width: 24.0,
//           height: 24.0,
//         ),
//       ),
//     );
//   }
// }
