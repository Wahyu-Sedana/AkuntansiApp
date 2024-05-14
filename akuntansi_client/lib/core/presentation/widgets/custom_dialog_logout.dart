import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/helper.dart';
import 'components/dialog_button.dart';
import 'components/dialog_container.dart';

class CustomLogoutDialog extends StatelessWidget {
  final Function positiveAction;
  const CustomLogoutDialog({Key? key, required this.positiveAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      withPadding: true,
      withMargin: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Text(
              'would you like to a logout?',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          mediumVerticalSpacing(),
          Container(
            height: 2,
            color: greyColor,
          ),
          ConfirmationButtons(
            positiveAction: positiveAction,
          ),
        ],
      ),
    );
  }
}

class ConfirmationButtons extends StatelessWidget {
  final Function positiveAction;
  const ConfirmationButtons({
    Key? key,
    required this.positiveAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DialogButton.setPositiveButton(
                  action: () => positiveAction(), style: dialogStyle.style1, color: Colors.red)
              .button,
        ),
        Expanded(
          child: DialogButton.setNegativeButton(
                  action: () => Navigator.pop(context),
                  style: dialogStyle.style1,
                  color: primaryDarkColor,
                  text: 'no')
              .button,
        ),
      ],
    );
  }
}
