import 'package:flutter/material.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/controllers/login_controller.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:give_me_home/app/routes/wrapper_widget.dart';
import 'package:give_me_home/app/services/auth_services.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel?>.value(
          initialData: null,
          value: AuthServices().authStateChanges(),
        ),
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(),
        ),
      ],
      child: MaterialApp(
        title: 'Give me home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
        routes: {
          "/": (context) => const WrapperWidget(),
        },
      ),
    );
  }
}
