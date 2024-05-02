import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

TextStyle labelAppBar =
    const TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle labelTitleAppBar =
    const TextStyle(fontSize: 9.0, color: Colors.black, fontWeight: FontWeight.normal);

TextStyle distanceTextStyle =
    const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.normal);

TextStyle selectPaymentStyle =
    const TextStyle(fontSize: 13.0, color: Colors.black, fontWeight: FontWeight.w300);

TextStyle noteStyle =
    const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.w300);

TextStyle paymentLabelStyle =
    const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle txtButtonStyle =
    const TextStyle(fontSize: 18.0, color: primaryColor, fontWeight: FontWeight.bold);
TextStyle txtButtonCancelStyle =
    const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle txtButtonProfileStyle =
    const TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle searchBarInputTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);

TextStyle searchBarHintTextStyle = const TextStyle(fontSize: 14.0);

TextStyle priceTextStyle =
    const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);

TextStyle formLabelStyle =
    const TextStyle(fontSize: fontSmall, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle formTextFieldStyle = const TextStyle(fontSize: 15, color: Colors.black);

TextStyle whiteAccentStyle = const TextStyle(fontSize: 12, color: whiteAccentColor);
TextStyle forgotPasStyle = const TextStyle(fontSize: 12, color: Colors.black);

TextStyle titleStyle =
    const TextStyle(fontSize: fontExtraLarge, color: primaryDarkColor, fontWeight: FontWeight.bold);

TextStyle appBarStyle(Color? textColor) =>
    TextStyle(fontSize: 16.0, color: textColor ?? Colors.black);

TextStyle titlePlatStyle = const TextStyle(fontSize: 16, color: Colors.black);

TextStyle titleModelStyle = const TextStyle(fontSize: 14, color: Colors.black);

TextStyle titleNameStyle = const TextStyle(fontSize: 13, color: Colors.black);

TextStyle txtProfilePictStyle =
    const TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold);
