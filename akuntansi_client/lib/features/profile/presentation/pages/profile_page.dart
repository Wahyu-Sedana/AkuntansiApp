import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/features/login/presentation/pages/login_page.dart';
import 'package:akuntansi_client/features/login/presentation/providers/login_provider.dart';
import 'package:akuntansi_client/features/profile/presentation/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/custom_dialog_logout.dart';
import '../../../../core/utils/session.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    final session = locator<Session>();
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 50),
      child: ProfileCardWidget(
        name: '${session.namaUsaha}',
        email: '${session.email}',
      ),
    ));
  }
}
