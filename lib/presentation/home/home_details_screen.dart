import 'package:flutter/material.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          'Home Details',
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
