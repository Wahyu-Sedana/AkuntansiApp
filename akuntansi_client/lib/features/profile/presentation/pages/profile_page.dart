import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:akuntansi_client/core/utils/session.dart';

import '../../../../core/presentation/widgets/custom_dialog_logout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile Page',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomLogoutDialog(
                    positiveAction: () async {
                      await sessionLogOut().then((_) => Navigator.of(context)
                          .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false));
                    },
                  ),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
