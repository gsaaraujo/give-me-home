import 'package:flutter/material.dart';
import 'package:give_me_home/app/pages/login/login_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Give me home',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
