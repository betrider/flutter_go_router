import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.go('/home');
          },
          child: Text(
            'Login Screen($name)',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
