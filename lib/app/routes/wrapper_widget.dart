import 'package:flutter/material.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:give_me_home/app/pages/home/home_page.dart';
import 'package:give_me_home/app/pages/login/login_page.dart';
import 'package:provider/provider.dart';

class WrapperWidget extends StatelessWidget {
  const WrapperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }
}
