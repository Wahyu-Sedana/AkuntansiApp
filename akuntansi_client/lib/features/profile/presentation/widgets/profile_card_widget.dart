import 'package:akuntansi_client/core/presentation/widgets/custom_button.dart';
import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:akuntansi_client/core/utils/helper.dart';
import 'package:akuntansi_client/core/utils/injection.dart';
import 'package:akuntansi_client/core/utils/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../login/presentation/pages/login_page.dart';

class ProfileCardWidget extends StatefulWidget {
  final String name;
  final String email;
  const ProfileCardWidget({super.key, required this.name, required this.email});

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  @override
  Widget build(BuildContext context) {
    final session = locator<Session>;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/people.jpg'),
                radius: 100,
              ),
              const SizedBox(height: 20),
              Text(
                widget.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                widget.email,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 200,
                child: CustomButton(
                    text: 'Logout',
                    event: () async {
                      await sessionLogOut().then((value) => {
                            Navigator.pushNamedAndRemoveUntil(
                                context, LoginPage.routeName, (route) => false)
                          });
                    },
                    bgColor: primaryDarkColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
