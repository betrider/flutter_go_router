import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: InkWell(
          onTap: () {
            // 1번 params 사용
            // context.push('/home/details/1111');

            // 1-1번 queryParams 사용
            context.push('/home/details?title=1122&test=3333');

            // 2번 queryParams 사용
            // context.pushNamed('details', queryParams: {'title':'2222'});

            // 3번 extra 사용
            // context.push('/home/details', extra: {
            //   'title': '3333'
            // });
          },
          child: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
