import 'package:flutter/material.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:give_me_home/app/routes/wrapper_widget.dart';
import 'package:give_me_home/app/services/auth_services.dart';
import 'package:provider/provider.dart';

class User {
  String name = "Gabriel";
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel?>.value(
          initialData: null,
          value: AuthServices().authStateChanges(),
        )
      ],
      child: MaterialApp(
        title: 'Give me home',
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const WrapperWidget(),
        },
      ),
    );
  }
}
