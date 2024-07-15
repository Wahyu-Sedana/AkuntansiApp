import 'package:akuntansi_client/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({super.key});

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryDarkColor,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/people.jpg'))],
        ),
      ),
    );
  }
}
