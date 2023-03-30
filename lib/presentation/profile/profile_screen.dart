import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: InkWell(
          onTap: () {
            context.go('/profile/details');
          },
          child: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
