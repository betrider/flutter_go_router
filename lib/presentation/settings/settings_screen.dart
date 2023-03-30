import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: InkWell(
          onTap: () {
            context.go('/settings/details');
          },
          child: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

