import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:akuntansi_client/features/login/presentation/pages/login_page.dart';
import 'package:akuntansi_client/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/custom_dialog_logout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 50),
      child: ProfileCardWidget(),
    ));
  }
}
